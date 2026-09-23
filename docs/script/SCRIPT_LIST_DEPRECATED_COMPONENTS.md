# List Deprecated Components Script

## Overview

This Bash script scans the monorepo's `Modules/Components/` folder to identify deprecated Spark components and their recommended replacements. It analyzes `@available` deprecation annotations in Swift source files and generates a JSON mapping of deprecated components to their modern alternatives.

## Script File

`.script/list-deprecated-components.sh`

## Usage

### Direct Execution

```bash
./.script/list-deprecated-components.sh
```

### From Repository Root

```bash
cd /path/to/spark-ios
./.script/list-deprecated-components.sh
```

## Output

- **File**: `spark-deprecated-components-listing.json` (created in current directory)
- **Format**: JSON array with deprecated component mappings
- **Console**: Reports total deprecated component count

## JSON Structure

```json
[
  {
    "deprecated": "OldComponentName",
    "name": "NewComponentName"
  },
  {
    "deprecated": "SparkUIButton",
    "name": "ButtonUIView"
  }
]
```

## Process Flow

The script executes the following steps:

### Step 1: Scan Modules/Components Directories

Searches all subdirectories within `Modules/Components/` that contain a `Sources/Core` folder structure.

**Pattern**: `Modules/Components/*/Sources/Core`

### Step 2: Find Deprecated Annotations

For each Swift file, searches for deprecation patterns:
- Pattern: `@available(*, deprecated, message: "...")`
- Extracts the deprecation message
- Looks for replacement component name in the message

### Step 3: Extract Deprecated Component Name

Reads the lines following the `@available` annotation to find the component declaration:
- Checks next line for: `public class ComponentName` or `public struct ComponentName`
- Supports: `public final class ComponentName`
- Handles multi-line declarations

### Step 4: Parse Replacement Name

Extracts the recommended replacement from the deprecation message:
- Pattern: `message: "Use ComponentName instead"`
- Captures the component name after "Use "

### Step 5: Filter View Components

**Included**: Only view-related components:
- Declaration contains: `View`, `UIView`, or `UIControl`
- Component name contains: `View` or `UI`

**Purpose**: Excludes deprecated models, utilities, or non-visual components

### Step 6: Generate JSON Output

Creates a well-formatted JSON file with:
1. Proper JSON structure (array of objects)
2. Each entry contains `deprecated` and `name` fields
3. Properly escaped strings
4. Formatted with indentation for readability

## Output Examples

**Console Output**:
```
Scanning Modules/Components directories for deprecated views...
✅ Successfully created spark-deprecated-components-listing.json
   Total deprecated components: 36
```

**Generated File (`spark-deprecated-components-listing.json`)**:
```json
[
  {
    "deprecated": "SparkUIButton",
    "name": "ButtonUIView"
  },
  {
    "deprecated": "SparkButton",
    "name": "ButtonView"
  },
  {
    "deprecated": "BadgeUIView",
    "name": "BadgeView"
  }
]
```

## Deprecation Detection Logic

The script identifies deprecated components by:

1. **Annotation Pattern**: Looks for `@available(*, deprecated)` attributes
2. **Message Parsing**: Extracts "Use X" from deprecation messages
3. **Proximity Analysis**: Associates annotation with following declaration
4. **Type Validation**: Ensures both deprecated and replacement are view components

## Supported Deprecation Message Formats

The script recognizes these message patterns:
- `"Use NewComponent instead"`
- `"Use NewComponent"`
- `message: "Use NewComponent instead"`

## Monorepo-Specific Features

This script has been adapted for the monorepo structure:

**Before (Multi-repo)**:
- Scanned: Root-level `spark-ios-component-*/` directories
- Required: All repositories cloned
- Used: `gh` CLI to list and clone repositories

**After (Monorepo)**:
- Scans: `Modules/Components/*/Sources/Core` directories
- Benefits: All components local, no cloning needed
- Faster execution with direct file access

## Use Cases

- **Migration Guide**: Help developers identify which deprecated components to replace
- **Documentation**: Generate deprecation notices for component docs
- **Code Analysis**: Track deprecation status across the design system
- **CI/CD**: Automated deprecation tracking and reporting
- **Analytics**: Monitor adoption of new components over time

## JSON Format Benefits

The JSON output format enables:
- Easy parsing by automated tools
- Integration with documentation generators
- Use in IDE plugins or linters
- Consumption by web applications
- Version tracking in Git

## Error Handling

- Creates empty JSON array if no deprecated components found
- Handles malformed deprecation messages gracefully
- Validates file existence before processing
- Reports total count (0 if none found)

## Notes

- The script is idempotent - running it multiple times produces the same result
- Overwrites `spark-deprecated-components-listing.json` on each run
- Requires execution from the monorepo root directory
- Only processes components with proper `@available` annotations
- Validates that both deprecated and replacement are view types

## Related Files

- `.script/list-components.sh` - Lists all components (including deprecated)
- `.github/workflows/nightly-list-deprecated-components.yml` - Workflow that uses this script
- `spark-deprecated-components-listing.json` - Generated output file

## Dependencies

- Standard Unix utilities: `find`, `grep`, `sed`
- Bash shell (version 3.0 or higher)
- No external dependencies required

## Example Deprecation Pattern

**In Swift Source**:
```swift
@available(*, deprecated, message: "Use ButtonUIView instead")
public final class SparkUIButton: UIControl {
    // ...
}
```

**In Generated JSON**:
```json
{
  "deprecated": "SparkUIButton",
  "name": "ButtonUIView"
}
```
