# GitHub Action Detect Changes Script

## Overview

This Bash script finds the files changed by a pull request and decides which jobs of the [Build and Test workflow](../workflow/WORKFLOW_BUILD_AND_TEST.md) must run: the package build, the tests (all of them or only some test targets), and the demo app build.

## Script File

`.script/github-action-detect-changes.sh`

## Usage

### Direct Execution

```bash
./.script/github-action-detect-changes.sh origin/main
```

### Simulate Changed Files (local check)

Set the `CHANGED_FILES` environment variable (one path per line) to skip `git diff`:

```bash
CHANGED_FILES="Modules/Components/Badge/Sources/Core/A.swift" ./.script/github-action-detect-changes.sh
```

### In GitHub Actions

Called by the `Detect changes` job of `.github/workflows/build-and-test.yml`. The checkout needs `fetch-depth: 0` so the base branch is available:

```yaml
- name: Detect changes
  id: detect
  run: .script/github-action-detect-changes.sh "origin/${{ github.base_ref }}"
```

If the script fails, the workflow falls back to running everything.

## Arguments

- `<base-ref>` (optional) - The git ref to compare with (`git diff <base-ref>...HEAD`)
  - Default: `origin/main`

## Environment Variables

| Variable        | Description                                                         |
|-----------------|---------------------------------------------------------------------|
| `CHANGED_FILES` | Overrides the list of changed files (used for local checks)         |
| `GITHUB_OUTPUT` | Set by GitHub Actions. When present, the outputs are appended to it |

## Rules

| Changed files | Build | Tests | Build Demo App |
|---|---|---|---|
| `Modules/Theming`, `Modules/Common`, `.tools`, `Package.swift`, `Package.resolved`, `Makefile`, the script, the workflow | ✅ | ✅ all | ✅ |
| `Modules/Components/<X>` | ✅ | ✅ `<X>` + components depending on `<X>` (transitively) | ✅ |
| `Spark`, `Resources` | ✅ | ❌ | ✅ |
| `Demo`, `.demo`, `project.yml` | ❌ | ❌ | ✅ |
| Anything else (and every `*.md` file) | ❌ | ❌ | ❌ |

When several files are changed, the rules are combined.

### Impacted Components

When a component is changed, the script reads `Package.swift` with `swift package dump-package` and:

1. Maps the component folder to its Core target (`Modules/Components/Badge/Sources/Core` → `SparkComponentBadge`)
2. Adds, transitively, every component target that depends on it (e.g. `Badge` → `Avatar`, `Tab`)
3. Selects every test target located in the folders of these components (unit and snapshot tests)

## Output

Printed on stdout and appended to `$GITHUB_OUTPUT`:

| Output         | Values         | Description                                      |
|----------------|----------------|--------------------------------------------------|
| `run_build`    | `true`/`false` | Build the Spark package (`make build`)           |
| `run_tests`    | `true`/`false` | Run the tests (`make test`)                      |
| `run_demo`     | `true`/`false` | Build the demo app (`make build-demo-app`)       |
| `test_targets` | list or empty  | Space separated test targets, empty means all    |

Example:

```text
run_build=true
run_tests=true
run_demo=true
test_targets=SparkComponentAvatarSnapshotTests SparkComponentAvatarUnitTests SparkComponentBadgeSnapshotTests SparkComponentBadgeUnitTests SparkComponentTabSnapshotTests SparkComponentTabUnitTests
```

`test_targets` is passed to `make test TEST_TARGETS="..."`, which adds one `-only-testing:<target>` per target.

## Requirements

- `git`
- `swift` (for `swift package dump-package`)
- `jq`

All are available on the GitHub `ubuntu-latest` runner.
