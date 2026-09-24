# Generate DocC Packages JSON Script

## Overview

This Swift script merges the `documentation.json` file from every DocC output folder into a single `packages.json` file. The documentation site (`.documentation/index.html`) reads `packages.json` to build the package cards (title, description, image, links).

## Script File

`.script/generate-docc-packages-json.swift`

## Usage

### Direct Execution

```bash
./.script/generate-docc-packages-json.swift .docs
```

### Using Swift Command

```bash
swift .script/generate-docc-packages-json.swift .docs
```

### Using Makefile

The script is called automatically at the end of the `docc` target:

```bash
make docc
make docc DOCC_OUTPUT_PATH=my-output-path HOSTING_BASE_PATH=my-custom-path
```

## Arguments

- `<docsOutputPath>` (optional) - The DocC output folder that contains one subfolder per package
  - Default: `.docs`

## Input

Each package folder inside `<docsOutputPath>` may contain a `documentation.json` file. The Makefile copies it from the module (e.g. `Modules/Components/Button/documentation.json`, `Demo/documentation.json`, `Spark/documentation.json`).

The file is an **array** of package entries:

```json
[
  {
    "title": "Resources",
    "description": "Spark icon assets and image helpers",
    "image": "iconography"
  }
]
```

### Entry Fields

| Field         | Required | Description                                                                     |
|---------------|----------|---------------------------------------------------------------------------------|
| `title`       | Yes      | Name shown on the card                                                          |
| `description` | Yes      | Short description shown on the card                                            |
| `image`       | Yes      | Image name, resolved to `.github/assets/doc/{light,dark}/<image>.png`           |
| `zeroheight`  | No       | Link to the Zeroheight documentation                                            |
| `figma`       | No       | Link to the Figma file                                                          |
| `path`        | No       | Always overwritten by the script (see below)                                    |

## Process Flow

### Step 1: List Package Folders

Reads the content of `<docsOutputPath>` and sorts it alphabetically. Files are ignored, only folders are processed.

### Step 2: Decode Each `documentation.json`

For each folder, the script decodes `<folder>/documentation.json`. Folders without this file are skipped silently.

### Step 3: Set the Path

For every entry, `path` is set to the DocC documentation URL relative to the site root:

```
<folder>/documentation/<folder>/documentation
```

**Example** for the `sparkcomponentbutton` folder:
```
sparkcomponentbutton/documentation/sparkcomponentbutton/documentation
```

### Step 4: Write `packages.json`

All entries are merged into one array and written (pretty printed) to `<docsOutputPath>/packages.json`.

## Output Example

**Input folders**:
```
.docs/
├── demo/documentation.json
├── resources/documentation.json
└── sparkcomponentbutton/        (no documentation.json → skipped)
```

**Generated `.docs/packages.json`**:
```json
[
  {
    "title" : "Demo",
    "description" : "Showcases all Spark components in UIKit and SwiftUI, and the theming solution",
    "image" : "demo",
    "path" : "demo/documentation/demo/documentation"
  },
  {
    "title" : "Resources",
    "description" : "Spark icon assets and image helpers",
    "image" : "iconography",
    "path" : "resources/documentation/resources/documentation"
  }
]
```

## Console Output

**Success**:
```
✅ Generated packages.json with 2 packages
```

**Warning** (invalid JSON, the folder is skipped):
```
⚠️  Warning: Could not parse .docs/demo/documentation.json: <error>
```

**Error**:
```
❌ Error: Cannot read directory at .docs
❌ Error writing packages.json: <error>
```

## Error Handling

- Exits with code 1 if the output folder cannot be read
- Exits with code 1 if `packages.json` cannot be written
- Invalid `documentation.json` files only print a warning and are skipped

## Notes

- To add a card on the documentation site, add a `documentation.json` file at the root of the module
- The order of the cards follows the alphabetical order of the folders
- The `path` value from the input file is always replaced

## Related Files

- `Makefile` - `docc` target calling this script
- `.github/workflows/deploy-doc-page.yml` - Workflow deploying the documentation site
- `.documentation/index.html` - Documentation site reading `packages.json`
- `**/documentation.json` - Metadata file of each module

## Dependencies

- Foundation framework (part of Swift standard library)
- No external dependencies required
