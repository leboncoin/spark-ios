#!/bin/bash

# Excluded classes and patterns
EXCLUDED_CLASSES=(
    "A11YLabel"
    "SelectionControlsGroupItem"
    "SelectionControlsGroup"
    "StarUIView"
    "TabItemUIView"
    "TextFieldAddon"
)

# Temporary files
TEMP_FILE=$(mktemp)
UIKIT_FILE=$(mktemp)
SWIFTUI_FILE=$(mktemp)

echo "Scanning Dependencies directories for components in Sources/Core..."

# Find all directories with Sources/Core in Dependencies folder
for dir in Dependencies/*/; do
    if [ -d "${dir}Sources/Core" ]; then
        # Find all Swift files and extract public structs/classes that are views
        find "${dir}Sources/Core" -name "*.swift" -type f -exec grep -H "^public.*\(struct\|class\)" {} \; 2>/dev/null | while IFS=: read -r file line; do
            # Extract the type name first
            if [[ $line =~ public[[:space:]]+(final[[:space:]]+)?(struct|class)[[:space:]]+([A-Za-z0-9_]+)(\<[^>]+\>)?(:|[[:space:]]) ]]; then
                typename="${BASH_REMATCH[3]}"

                # Skip if contains "Main" or "Container" or template markers
                if [[ $typename =~ Main|Container|___|COMPONENT_NAME ]]; then
                    continue
                fi

                # Skip excluded classes
                skip=false
                for excluded in "${EXCLUDED_CLASSES[@]}"; do
                    if [ "$typename" = "$excluded" ]; then
                        skip=true
                        break
                    fi
                done

                if [ "$skip" = true ]; then
                    continue
                fi

                # Check if it's a view-related type:
                # 1. Contains View/UIView/UIControl keywords
                # 2. Inherits from : View/UIView/UIControl
                # 3. Starts with SparkUI (our component pattern)
                # 4. Exclude UIViewController
                if [[ $line =~ (: View|: UIView|: UIControl|View|UIView|UIControl) ]] || [[ $typename =~ ^SparkUI ]]; then
                    # Exclude UIViewController
                    if [[ ! $line =~ UIViewController ]]; then
                        echo "$typename" >> "$TEMP_FILE"
                    fi
                fi
            fi
        done
    fi
done

# Remove duplicates and sort alphabetically
sort -u "$TEMP_FILE" -o "$TEMP_FILE"

# Count components
TOTAL_COUNT=$(wc -l < "$TEMP_FILE" 2>/dev/null | tr -d ' ')

# Handle empty file
[ -z "$TOTAL_COUNT" ] && TOTAL_COUNT=0

# Generate output file
OUTPUT_FILE="spark-components-listing.txt"

# Simply output the sorted list
cat "$TEMP_FILE" > "$OUTPUT_FILE"

# Cleanup
rm -f "$TEMP_FILE" "$UIKIT_FILE" "$SWIFTUI_FILE"

echo "✅ Successfully created $OUTPUT_FILE"
echo "   Total components: $TOTAL_COUNT"
