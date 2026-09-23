# List Components Script

## Overview

This Bash script scans the monorepo's `Modules/Components/` folder to extract and list all public Spark component views. It identifies UIKit and SwiftUI components by analyzing Swift source files and outputs a comprehensive list of component names.

## Script File

`.script/list-components.sh`

## Usage

### Direct Execution

```bash
./.script/list-components.sh
```

### From Repository Root

```bash
cd /path/to/spark-ios
./.script/list-components.sh
```

## Output

- **File**: `spark-components-listing.txt` (created in current directory)
- **Format**: Plain text file with one component name per line, alphabetically sorted
- **Console**: Reports total component count

## Process Flow

The script executes the following steps:

### Step 1: Scan Modules/Components Directories

Searches all subdirectories within `Modules/Components/` that contain a `Sources/Core` folder structure.

**Pattern**: `Modules/Components/*/Sources/Core`

### Step 2: Extract Public Component Declarations

For each Swift file found, extracts public struct and class declarations using pattern matching:
- Matches: `public struct ComponentName` or `public class ComponentName`
- Supports: `public final class ComponentName`
- Handles: Generic types like `ComponentName<SomeType>`

### Step 3: Filter Components

**Included**: Only declarations that are view-related:
- Contains keywords: `View`, `UIView`, or `UIControl`
- Inherits from: `: View`, `: UIView`, or `: UIControl`
- Starts with: `SparkUI` (Spark UIKit component pattern)

**Excluded Patterns**:
- UIViewController types
- Names containing "Main" or "Container"
- Template markers: `___`, `COMPONENT_NAME`
- Specific excluded classes:
  - `A11YLabel`
  - `SelectionControlsGroupItem`
  - `SelectionControlsGroup`
  - `StarUIView`
  - `TabItemUIView`
  - `TextFieldAddon`

### Step 4: Remove Duplicates and Sort

Processes the component names:
1. Removes duplicate entries
2. Sorts alphabetically
3. Counts total components

### Step 5: Generate Output File

Creates `spark-components-listing.txt` with the sorted list of component names.

## Output Examples

**Console Output**:
```
Scanning Modules/Components directories for components in Sources/Core...
✅ Successfully created spark-components-listing.txt
   Total components: 120
```

**Generated File (`spark-components-listing.txt`)**:
```
BadgeUIView
BadgeView
ButtonUIView
ButtonView
CheckboxGroupUIView
CheckboxGroupView
CheckboxUIView
CheckboxView
ChipUIView
ChipView
...
```

## Component Detection Logic

The script identifies components using multiple criteria:

1. **View Protocol Conformance**:
   - SwiftUI: Conforms to `View` protocol
   - UIKit: Inherits from `UIView` or `UIControl`

2. **Naming Convention**:
   - UIKit components: Prefix `SparkUI` or suffix `UIView`
   - SwiftUI components: Suffix `View`

3. **Public Access**:
   - Only `public` declarations are included
   - Internal/private components are excluded

## Monorepo-Specific Features

This script has been adapted for the monorepo structure:

**Before (Multi-repo)**:
- Scanned: Root-level `spark-ios-component-*/` directories
- Required: All repositories cloned

**After (Monorepo)**:
- Scans: `Modules/Components/*/Sources/Core` directories
- Benefits: All components local, no cloning needed

## Use Cases

- **Component Inventory**: Track all available components in the design system
- **Documentation**: Generate component lists for documentation
- **Validation**: Verify component naming conventions
- **CI/CD**: Automated component tracking and reporting
- **Analytics**: Monitor design system growth over time

## Notes

- The script is idempotent - running it multiple times produces the same result
- Overwrites `spark-components-listing.txt` on each run
- Requires execution from the monorepo root directory
- All components from all packages in `Modules/Components/` are included
- Both UIKit and SwiftUI variants are listed separately

## Related Files

- `.script/list-deprecated-components.sh` - Lists deprecated components
- `.github/workflows/nightly-list-components.yml` - Workflow that uses this script
- `spark-components-listing.txt` - Generated output file

## Dependencies

- Standard Unix utilities: `find`, `grep`, `sort`
- Bash shell (version 3.0 or higher)
- No external dependencies required
