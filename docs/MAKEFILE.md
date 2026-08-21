# Makefile Documentation

This document provides comprehensive documentation for all available Makefile targets in the project.

## Table of Contents

- [Configuration Variables](#configuration-variables)
- [Build Targets](#build-targets)
- [Test Targets](#test-targets)
- [Documentation Targets](#documentation-targets)
- [Clean & Clear Targets](#clean--clear-targets)
- [Code Generation Targets](#code-generation-targets)

---

## Configuration Variables

The Makefile uses the following configuration variables that can be customized:

| Variable | Default Value | Description |
|----------|---------------|-------------|
| `PACKAGES` | Auto-detected from Dependencies folder | List of all packages found in the Dependencies directory |
| `RESULTS_DIR` | `.testResults` | Directory where test results are stored |
| `DERIVED_DATA_PATH` | `.derivedData/` | Path for Xcode derived data |
| `SDK` | `iphonesimulator` | SDK to use for building |
| `DESTINATION` | `platform=iOS Simulator,name=iPhone 17 Pro Max,OS=26.4.1` | Simulator destination for builds and tests |
| `DOCC_OUTPUT_PATH` | `.docs` | Output directory for DocC documentation |
| `HOSTING_BASE_PATH` | `poc-monorepo` | Base path for hosting static documentation (can be overridden) |

---

## Build Targets

### `build`

Builds the project using xcodebuild.

**Usage:**
```bash
make build
```

**Description:**
- Builds the Spark-Package scheme
- Uses the configured SDK and simulator destination
- Reports any failed packages
- Exits with error code 1 if any package fails to build
- Displays success message if all packages build successfully

**Output:**
- `✓ All packages built successfully` on success
- `✗ Failed packages: [package names]` on failure

---

## Test Targets

### `test`

Runs all tests with .xcresult bundles for the project.

**Usage:**
```bash
make test
```

**Description:**
- First runs the `sourcery` target to generate necessary code
- Creates the test results directory structure
- Cleans previous test results
- Runs snapshot tests for Spark-Package
- Generates .xcresult bundles for test analysis
- Lists all generated .xcresult files

**Dependencies:**
- Requires `sourcery` target to run first

**Output Directory:**
- Test results saved to `.testResults/xcresult/`
- XCResult bundles: `Spark-snapshots.xcresult`

**Output:**
- `✓ All tests completed successfully` on success
- `✗ Tests failed` on failure
- Lists all generated .xcresult bundle files

---

## Documentation Targets

### `docc`

Generates DocC documentation for all packages and prepares it for static hosting.

**Usage:**
```bash
make docc
```

**With custom paths:**
```bash
make docc DOCC_OUTPUT_PATH=my-output-path HOSTING_BASE_PATH=my-custom-path
```

**Description:**
- Builds DocC documentation using xcodebuild docbuild
- Processes all .doccarchive files (excluding those containing "Testing")
- Transforms documentation for static hosting
- Copies documentation.json files from package directories if available
- Copies additional files from `.documentation/` directory if it exists
- Generates a `packages.json` file with metadata for all packages
- Extracts title, description, image, zeroheight, and figma links from documentation.json files

**Output Directory:**
- Documentation saved to `.docs/` (or custom DOCC_OUTPUT_PATH)
- Each package gets its own subdirectory (lowercase name)

**Testing Locally:**
```bash
cd .docs && python3 -m http.server 8000
```
Then open http://localhost:8000

**Generated Files:**
- `[DOCC_OUTPUT_PATH]/[package-name]/` - Documentation for each package
- `[DOCC_OUTPUT_PATH]/packages.json` - Metadata JSON with all package information

**Output:**
- `✓ DocC documentation generated successfully in [path]/` on success
- `✗ DocC build failed` on failure
- Shows count of processed packages

---

## Clean & Clear Targets

### `clean`

Removes all build artifacts, derived data, documentation, and generated files.

**Usage:**
```bash
make clean
```

**Description:**
- Runs `swift package clean`
- Removes derived data directory (`.derivedData/`)
- Removes documentation output directory (`.docs/`)
- Deletes all Sourcery generated files (`Sourcery.generated.swift`) from:
  - All packages in `Dependencies/`
  - `Spark/` directory

**Output:**
- `✓ Sourcery generated files removed` on success

**What Gets Removed:**
- Swift package build cache
- `.derivedData/` directory
- `.docs/` directory
- All `Sourcery.generated.swift` files

---

### `clear-snapshots`

Removes all snapshot test reference files from the project.

**Usage:**
```bash
make clear-snapshots
```

**Description:**
- Searches for all `*.__snapshots__` directories in Tests folders
- Clears the contents of each snapshot directory
- Processes packages in both `Dependencies/` and `Spark/` directories

**Use Case:**
- When you want to regenerate all snapshot reference images
- After making intentional UI changes that affect all snapshots
- To clean up snapshot files before committing

**Output:**
- Shows which packages are being checked
- Displays which snapshot directories are being cleared
- `✓ All snapshots cleared successfully` on completion

**Directories Searched:**
- `Dependencies/*/Tests/**/__snapshots__/`
- `Spark/Tests/**/__snapshots__/`

---

## Code Generation Targets

### `sourcery`

Runs Sourcery code generation for all packages in the project.

**Usage:**
```bash
make sourcery
```

**Description:**
- Runs Sourcery using `.sourcery.yml` configuration files
- Processes the root package configuration if present
- Iterates through all packages in `Dependencies/` directory
- Processes `Spark/` package if configuration exists
- Generates mock files and other code based on Sourcery templates

**Configuration Files:**
- `.sourcery.yml` - Root package configuration
- `Dependencies/[package]/.sourcery.yml` - Individual package configurations
- `Spark/.sourcery.yml` - Spark package configuration

**Output:**
- Shows which packages are being processed
- `✓ Sourcery completed for all packages` on success

**Use Case:**
- Automatically run before tests
- Generate mocks for testing
- Generate boilerplate code from templates

---

## Common Workflows

### Full Clean Build
```bash
make clean
make build
```

### Run Tests
```bash
make test
```
*(automatically runs sourcery first)*

### Generate Documentation
```bash
make docc
```

### Clean and Rebuild Everything
```bash
make clean
make build
make test
```

### Regenerate All Snapshots
```bash
make clear-snapshots
make test
```

---

## Notes

- All targets are declared as `.PHONY` to ensure they always run
- The Makefile uses shell scripting for complex operations
- Error handling is built-in with appropriate exit codes
- Output uses emoji for better readability (✓, ✗, etc.)
- Most paths are relative to the project root
