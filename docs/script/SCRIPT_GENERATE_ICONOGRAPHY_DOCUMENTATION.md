# Generate Iconography Documentation Script

## Overview

This Swift script generates the **Iconography** DocC page of the `SparkResources` package. It lists every icon of the iconography asset catalog with its image and the name to use in code.

## Script File

`.script/generate-iconography-documentation.swift`

## Usage

### Direct Execution

```bash
./.script/generate-iconography-documentation.swift
```

### Using Swift Command

```bash
swift .script/generate-iconography-documentation.swift
```

## Arguments

No arguments required. The script uses the current working directory (must be the project root).

## Input/Output Paths

### Input
- **Asset Catalog**: `Resources/Sources/Core/Assets/Iconography.xcassets`

### Output
- **Documentation Page**: `Resources/Sources/Core/Documentation.docc/Iconography.md`
- **Documentation Images**: `Resources/Sources/Core/Documentation.docc/Resources/Iconography/`

## Process Flow

### 1. Directory Validation

Verifies that the `Iconography.xcassets` directory exists.

**Exit Behavior**: Exits with error if asset catalog is not found

### 2. Scan for Icon Categories

Recursively scans the asset catalog to find:
- All `.imageset` directories
- Their parent folder (category name)
- The `.svg` file inside each imageset

**Skips**:
- Hidden files
- Root-level items
- Imagesets without an `.svg` file (a warning is printed)

### 3. Copy Images

DocC can only display images stored inside the `.docc` catalog, so every SVG is copied into `Documentation.docc/Resources/Iconography/`.

DocC image names must be unique in the whole catalog, so each file is prefixed with its category:

```
iconography-{category}-{IconName}.svg
```

**Examples**:
- `Global/ActionsFill.imageset/ActionsFill.svg` → `iconography-global-ActionsFill.svg`
- `Criteria/Bear.imageset/Bear.svg` → `iconography-criteria-Bear.svg`

The images folder is deleted and recreated on each run, so removed icons don't leave stale images.

### 4. Generate Documentation Page

Overwrites `Iconography.md` with:
- An overview listing every category with its `ImageResource` enum and initializers
- One section per category containing a table of icons

**Category Mapping**:

| Category | Enum | Initializers |
| --- | --- | --- |
| `Global` | `ImageResource.Spark` | `Image(spark:)` / `UIImage(spark:)` |
| `Criteria` | `ImageResource.SparkCriteria` | `Image(sparkCriteria:)` / `UIImage(sparkCriteria:)` |
| Other | `ImageResource.Spark{CategoryName}` | `Image(spark{CategoryName}:)` / `UIImage(spark{CategoryName}:)` |

**Generated Grid**:
```markdown
| ![ActionsFill](iconography-global-ActionsFill) `\.actionsFill` | ![AddCircleFill](iconography-global-AddCircleFill) `\.addCircleFill` | ... |
| :---: | :---: | :---: | :---: |
| ![AddFill](iconography-global-AddFill) `\.addFill` | ... |
```

## Models

### `Icon`

**Properties**:
- `name: String` - Icon name (e.g., "ActionsFill")
- `svgURL: URL` - URL of the SVG file in the asset catalog

### `IconCategory`

**Properties**:
- `name: String` - Category name (e.g., "Global", "Criteria")
- `icons: [Icon]` - Icons sorted alphabetically

## Helper Functions

- `toCamelCase(_:)` - Converts the icon name to the Swift property name (same rules as `generate-iconography-codebase.swift`, including `3D` → `threeD` and `360` → `threeSixty`)
- `getCategoryEnumName(category:)` - Maps the category to its `ImageResource` enum name
- `getInitializerLabel(category:)` - Maps the category to the `Image` / `UIImage` initializer label
- `getDocumentationImageName(category:icon:)` - Builds the unique DocC image name
- `findIconCategories(at:)` - Scans the asset catalog
- `copyImages(categories:to:)` - Copies the SVGs into the DocC catalog
- `generateCategorySection(category:)` - Generates the table of a category
- `generateDocumentation(categories:)` - Generates the full page

## Output Examples

**Console Output**:
```
🚀 Starting Iconography documentation generation...
📂 Scanning for icon categories...
  - Criteria: 157 icons
  - Global: 414 icons

🖼️  Copying images...
✅ Images copied to: Resources/Sources/Core/Documentation.docc/Resources/Iconography

📝 Generating documentation...
✅ Successfully generated: Resources/Sources/Core/Documentation.docc/Iconography.md

🎉 Done!
```

## Error Handling

- Validates asset catalog exists before processing
- Exits with code 1 if no category is found
- Exits with code 1 if images can't be copied or the page can't be written
- Prints a warning for imagesets without an SVG

## Notes

- `Iconography.md` and the `Resources/Iconography/` folder are generated: **do not edit them manually**
- The script is idempotent - running multiple times produces the same output
- Categories and icons are sorted alphabetically
- The page is linked from `Documentation.md` with `<doc:Iconography>`

## Related Files

- `.script/generate-iconography-assets.swift` - Processes icon assets
- `.script/generate-iconography-codebase.swift` - Generates the `ImageResource` code
- `Resources/Sources/Core/Documentation.docc/Documentation.md` - Main page linking to the Iconography page

## Dependencies

- Foundation framework
- No external dependencies required

## Execution Order

This script should be run **after** the other iconography scripts:

1. `generate-iconography-assets.swift` - Organizes icon assets
2. `generate-iconography-codebase.swift` - Generates Swift code
3. `generate-iconography-documentation.swift` - Generates the DocC page
