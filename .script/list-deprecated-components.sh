#!/bin/bash

# Script to extract all deprecated components from spark-ios-component-xxx folders
# Outputs a JSON array with deprecated names and their replacements

# Temporary file for collecting entries
TEMP_ENTRIES=$(mktemp)

echo "Scanning Modules/Components directories for deprecated views..." >&2

# Loop through all component directories in Modules/Components folder
for component_dir in Modules/Components/*/; do
    # Check if Sources/Core exists in this directory
    if [ -d "${component_dir}Sources/Core" ]; then
        # Find all Swift files in Sources/Core that contain @available with deprecated
        find "${component_dir}Sources/Core" -name "*.swift" -type f 2>/dev/null | while read -r file; do
            # Search for @available(*, deprecated, message: "...") followed by public class/struct
            grep -n "@available.*deprecated" "$file" 2>/dev/null | while IFS=: read -r line_num deprecated_line; do
                # Extract the message from the @available line
                if [[ $deprecated_line =~ message:[[:space:]]*\"Use[[:space:]]+([A-Za-z0-9_]+) ]]; then
                    new_name="${BASH_REMATCH[1]}"

                    # Read the next few lines to find the class/struct declaration
                    next_line_num=$((line_num + 1))
                    class_line=$(sed -n "${next_line_num}p" "$file")

                    # Try the line after if the first one doesn't match
                    if [[ ! $class_line =~ public[[:space:]]+(final[[:space:]]+)?(class|struct)[[:space:]]+([A-Za-z0-9_]+) ]]; then
                        next_line_num=$((line_num + 2))
                        class_line=$(sed -n "${next_line_num}p" "$file")
                    fi

                    # Extract the deprecated class/struct name
                    if [[ $class_line =~ public[[:space:]]+(final[[:space:]]+)?(class|struct)[[:space:]]+([A-Za-z0-9_]+) ]]; then
                        deprecated_name="${BASH_REMATCH[3]}"

                        # Only include views (classes/structs that are views)
                        # Check if it's a View-related type
                        if [[ $class_line =~ (View|UIView|UIControl) ]] || [[ $deprecated_name =~ (View|UI) ]]; then
                            # Write entry as "deprecated:name" to temp file
                            echo "${deprecated_name}:${new_name}" >> "$TEMP_ENTRIES"
                        fi
                    fi
                fi
            done
        done
    fi
done

# Generate output file
OUTPUT_FILE="spark-deprecated-components-listing.json"

# Format the collected entries as JSON
echo "[" > "$OUTPUT_FILE"

# Read entries and format as JSON
FIRST=true
while IFS=: read -r deprecated_name new_name; do
    if [ "$FIRST" = false ]; then
        echo "," >> "$OUTPUT_FILE"
    fi
    FIRST=false

    echo "  {" >> "$OUTPUT_FILE"
    echo "    \"deprecated\": \"$deprecated_name\"," >> "$OUTPUT_FILE"
    echo -n "    \"name\": \"$new_name\"" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    echo -n "  }" >> "$OUTPUT_FILE"
done < "$TEMP_ENTRIES"

echo "" >> "$OUTPUT_FILE"
echo "]" >> "$OUTPUT_FILE"

# Count entries
TOTAL_COUNT=$(wc -l < "$TEMP_ENTRIES" 2>/dev/null | tr -d ' ')
[ -z "$TOTAL_COUNT" ] && TOTAL_COUNT=0

# Cleanup
rm -f "$TEMP_ENTRIES"

echo "✅ Successfully created $OUTPUT_FILE"
echo "   Total deprecated components: $TOTAL_COUNT"
