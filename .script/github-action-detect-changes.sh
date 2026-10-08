#!/bin/bash
# Detects which CI jobs must run from the files changed since a base ref.
# Usage: .script/github-action-detect-changes.sh <base-ref>   (e.g. origin/main)
# Outputs (stdout and $GITHUB_OUTPUT when set):
#   run_build=true|false       Build the Spark package
#   run_tests=true|false       Run the tests
#   run_demo=true|false        Build the demo app
#   test_targets=<list>        Space separated test targets ("" means all)

set -euo pipefail

BASE_REF="${1:-origin/main}"

run_all=false
run_build=false
run_demo=false
components=()

changed_files="${CHANGED_FILES:-$(git diff --name-only "$BASE_REF"...HEAD)}"

echo "Changed files:" >&2
echo "$changed_files" | sed 's/^/  /' >&2

while IFS= read -r file; do
    [ -z "$file" ] && continue
    case "$file" in
        *.md) ;;
        Modules/Theming/*|Modules/Common/*|.tools/*) run_all=true ;;
        Package.swift|Package.resolved|Makefile|.script/github-action-detect-changes.sh|.github/workflows/build-and-test.yml) run_all=true ;;
        Demo/*|.demo/*|project.yml) run_demo=true ;;
        Spark/*|Resources/*) run_build=true; run_demo=true ;;
        Modules/Components/*)
            component=$(echo "$file" | cut -d/ -f3)
            components+=("$component")
            run_build=true
            run_demo=true
            ;;
    esac
done <<< "$changed_files"

run_tests=false
test_targets=""

if [ "$run_all" = true ]; then
    run_build=true
    run_tests=true
    run_demo=true
elif [ ${#components[@]} -gt 0 ]; then
    run_tests=true
    manifest=$(swift package dump-package)

    # Map each component folder to its Core target (e.g. Badge -> SparkComponentBadge)
    initial_targets=$(printf '%s\n' "${components[@]}" | sort -u | while read -r name; do
        echo "$manifest" | jq -r --arg path "Modules/Components/$name/Sources/Core" \
            '.targets[] | select(.type == "regular" and .path == $path) | .name'
    done)

    # Add, transitively, every component target which depends on a modified component
    impacted=$(echo "$manifest" | jq -r --argjson initial "$(echo "$initial_targets" | jq -R . | jq -s 'map(select(. != ""))')" '
        [.targets[] | select(.type == "regular" and (.path | startswith("Modules/Components/")) and (.path | endswith("/Sources/Core")))
            | {name, deps: [.dependencies[] | (.byName // .target // .product)[0]]}] as $components
        | def expand($set):
            ($set + [$components[] | select(.deps | any(. as $d | $set | index($d))) | .name] | unique) as $next
            | if ($next | length) == ($set | length) then $set else expand($next) end;
        expand($initial) | .[]')

    # Folders of the impacted components
    impacted_paths=$(echo "$manifest" | jq -r --argjson names "$(echo "$impacted" | jq -R . | jq -s .)" \
        '.targets[] | select(.name as $n | $names | index($n)) | .path | split("/")[0:3] | join("/")')

    # Test targets located in these folders
    test_targets=$(echo "$manifest" | jq -r --argjson paths "$(echo "$impacted_paths" | jq -R . | jq -s .)" \
        '.targets[] | select(.type == "test") | select(.path | split("/")[0:3] | join("/") as $p | $paths | index($p)) | .name' \
        | sort -u | tr '\n' ' ' | sed 's/ $//')

    echo "Impacted components: $(echo "$impacted" | tr '\n' ' ')" >&2
fi

{
    echo "run_build=$run_build"
    echo "run_tests=$run_tests"
    echo "run_demo=$run_demo"
    echo "test_targets=$test_targets"
} | tee -a "${GITHUB_OUTPUT:-/dev/null}"
