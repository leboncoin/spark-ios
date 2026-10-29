# Claude Skills Documentation

This document provides comprehensive documentation for all Claude Code skills available in the Spark iOS project.

## Table of Contents

1. [Overview](#overview)
2. [Component Creation](#component-creation)
3. [Component Development Skills](#component-development-skills)
4. [Quality Assurance Skills](#quality-assurance-skills)
5. [Git & Deployment Skills](#git--deployment-skills)
6. [Demo App Skills](#demo-app-skills)
7. [Release Skills](#release-skills)

---

## Overview

Claude skills are specialized workflows that automate common development tasks in the Spark iOS project. They follow a structured approach to ensure consistency and quality across the codebase.

### SwiftUI-only components: Token & ViewModifier

New components are developed **for SwiftUI only**. They no longer use **UseCase**, **Model** and **ViewModel**: the styling rules live in the **Token** (exposed through `theme.component.xxx`) and are applied by the views through private **ViewModifiers**. See `Modules/Components/InputOTP` for the reference implementation.

The `spark-component-model`, `spark-component-use-case` and `spark-component-view-model` skills are kept for the **legacy components** that still have a UIKit view (`SparkUIXXX`), which relies on the ViewModel. Use `spark-component-migrate-token` to migrate a legacy component's SwiftUI part.

### Skill Invocation

Skills can be invoked using the `/` prefix followed by the skill name:

```bash
# Without parameters
/spark-component-enum

# With parameters
/spark-component-enum button
```

---

## Component Creation

### spark-create-component

**Purpose**: Create a new component in the Modules folder using the template-based approach.

**Usage**: `/spark-create-component`

**Description**: This skill helps you create a complete component structure from a template, handling all placeholder replacements and initial setup.

**Parameters** (gathered interactively):
1. **Component Name** (PascalCase): e.g., Button, Avatar, Chip
2. **Description**: Brief description for documentation
3. **Figma Link**: URL to the Figma design
4. **Zeroheight Link**: URL to the Zeroheight specifications
5. **Anatomy Image Path**: Local path to the anatomy image file

**Workflow**:
1. Validates all required parameters
2. Copies template to `Modules/Components/{Name}/`
3. Handles anatomy image setup in `.github/assets`
4. Updates `documentation.json` with metadata
5. Replaces all placeholders in files and filenames
6. Updates `spark-ios/Spark/Sources/Core/Import.swift` to export the new component
7. Verifies component structure

**Output**:
- New component directory with complete structure
- Updated Import.swift with new export
- Anatomy image in assets folder
- All documentation properly configured

---

## Component Development Skills

All component development skills support parameter-based targeting:
- With parameter: `/skill-name button` (directly targets that component)
- Without parameter: Prompts to select from available components in `Modules/Components/`

### spark-component-accessibility-identifier

**Purpose**: Create or update accessibility identifier files in component.

**Usage**: `/spark-component-accessibility-identifier [component-name]`

**Location**: `Sources/Core/AccessibilityIdentifier`

**Best Practices**:
- Must be public
- Contains only static let constants
- Property name must contain "view" or component name equals "spark-xxx"
- Fully documented

**Workflow**:
1. Add/Update accessibility identifier code
2. Add/Update documentation if public
3. Implement unit tests using Swift Testing framework

---

### spark-component-constants

**Purpose**: Create or update constants files in component.

**Usage**: `/spark-component-constants [component-name]`

**Location**: `Sources/Core/Constants`

**Best Practices**:
- Can contain sub enums
- Contains only static let or static func
- Properly documented if public

**Workflow**:
1. Add/Update constants code
2. Add/Update documentation if public
3. Implement unit tests using Swift Testing framework

---

### spark-component-enum

**Purpose**: Create or update enum files in component.

**Usage**: `/spark-component-enum [component-name]`

**Location**: `Sources/Core/Enum`

**Best Practices**:
- Should have a `default` case if public
- If default not specified in prompt, asks user to select
- Fully documented

**Workflow**:
1. Add/Update enum code
2. Add/Update documentation if public
3. Run swiftlint: `$ swiftlint`
4. Run sourcery: `$ sourcery`
5. Implement unit tests using Swift Testing framework

---

### spark-component-environment

**Purpose**: Create or update environment files (EnvironmentValues) in component.

**Usage**: `/spark-component-environment [component-name]`

**Location**: `Sources/Core/Environment`

**Rules**:
- Contains EnvironmentValues extension with one `@Entry var`
- Variable prefix must be component name
- Contains public View extension to set the EnvironmentValues
- Function must be documented and name starts with `sparkXXX`

**Workflow**:
1. Add/Update environment code
2. Run swiftlint: `$ swiftlint`

---

### spark-component-model

> ⚠️ **Legacy**: only for the components with a UIKit view. New SwiftUI-only components use Tokens instead.

**Purpose**: Create or update model files in component.

**Usage**: `/spark-component-model [component-name]`

**Location**: `Sources/Core/Model`

**Rules**:
- Must be `Equatable`
- Property naming:
  - `any TypographyFontToken` type → `xxxFontToken`
  - `any ColorToken` type → `xxxColorToken`
- Default values required:
  - `CGSize` → `.zero`
  - `CGFloat` → `.zero`
  - `any TypographyFontToken` → `TypographyFontTokenClear()`
  - `any ColorToken` → `ColorTokenClear()`
  - `String` → `.empty`
  - `Number` → `.zero`

**Workflow**:
1. Add/Update model code
2. Add/Update documentation if public
3. Run swiftlint: `$ swiftlint`
4. Run sourcery: `$ sourcery`
5. Implement unit tests using Swift Testing framework

---

### spark-component-token

**Purpose**: Create or update token files (theme-derived values grouped by category) in component. Replaces the styling UseCases and Models.

**Usage**: `/spark-component-token [component-name]`

**Location**: `Sources/Core/Token`

**Reference**: `Modules/Components/InputOTP/Sources/Core/Token`

**Rules**:
- Root file `XXXToken.swift` is a `public struct XXXToken: Equatable` with one property per category the component actually needs (e.g. `Border`, `Colors`, `Layout`, `Opacity`, `Size`, `Typography`, ...) and a `public init(theme: any Theme)`
- Each category lives in its own file `XXXToken+CategoryName.swift` as a `public extension XXXToken` with a nested `struct CategoryName: Equatable`
- Theme-dependent category:
  - stores an internal `let theme: any Theme` (internal memberwise init)
  - exposes fixed values as `public var` computed properties
  - exposes state-dependent values as `public func` (e.g. `width(isSelected:)`, `value(isEnabled:)`) — they replace the old styling use cases
  - manual `static func ==` using `lhs.theme.equals(rhs.theme)`
- Constant-only category (`Size`): only `public let` constants, stored as a default value on the root struct (`public let size = Size()`)
- Root file's doc comment lists every category with a doc link, a tip on `theme.component.xxx`, and a "Creating a Custom XXX" example

**Workflow**:
1. Add/Update token code
2. Add/Update documentation (token files are always public)
3. Run swiftlint: `$ swiftlint`
4. Run sourcery: `$ sourcery`
5. Implement unit tests using Swift Testing framework (one test per property, `@Test(arguments:)` per method, equatable true/false)

---

### spark-component-migrate-token

**Purpose**: Migrate the SwiftUI part of a legacy component from UseCases / Models / ViewModels to Tokens and ViewModifiers.

**Usage**: `/spark-component-migrate-token [component-name]`

**Reference**: `Modules/Components/InputOTP`

**Creates**:
- `Sources/Core/Token/XXXToken(+Category).swift` (via `spark-component-token`)
- `Sources/Core/Extension/Token/ComponentToken+XXX.swift`: exposes the token publicly through `theme.component.xxx`
- `Sources/Core/Extension/Token/EnvironmentTheme+XXXToken.swift`: internal shortcuts (`self.theme.colors`, `self.theme.border`, ...) for the views
- `Sources/Core/ViewModifier/XXXYyyViewModifier.swift`: a `private struct` ViewModifier reading `@Environment(\.theme)` + an internal `View` extension
- Internal extensions (`Sources/Core/Extension/...`) for the non-styling rules (formatting, validation, ...)

**Rules**:
- Analyse first which UseCases / Models / ViewModels are used by the UIKit view: **they must be kept**
- Remove only what was used by the SwiftUI view alone (code + tests)
- UIKit views are not modified

**Workflow**:
1. Analysis (created / removed / kept for UIKit)
2. Tokens, ComponentToken, EnvironmentTheme, ViewModifiers
3. Migrate the SwiftUI views, clean up
4. Run sourcery, unit tests (Swift Testing), snapshot tests, DocC
5. Run swiftlint

---

### spark-component-use-case

> ⚠️ **Legacy**: only for the components with a UIKit view. New SwiftUI-only components use Tokens (styling) and internal extensions (business rules) instead.

**Purpose**: Create or update use case files (business logic) in component.

**Usage**: `/spark-component-use-case [component-name]`

**Location**: `Sources/Core/UseCase`

**Rules**:
- Contains protocol and struct implementation
- Should have only one `func execute` (unless specified otherwise)
- Protocol annotation: `// sourcery: AutoMockable, AutoMockTest`
- If parameter contains theme: `// sourcery: theme = "Identical"`

**Workflow**:
1. Add/Update use case code
2. Add/Update documentation if public
3. Run swiftlint: `$ swiftlint`
4. Run sourcery: `$ sourcery`
5. Implement unit tests using Swift Testing framework

---

### spark-component-view-model

> ⚠️ **Legacy**: only for the components with a UIKit view. New SwiftUI-only components use ViewModifiers instead.

**Purpose**: Create or update view model files in component.

**Usage**: `/spark-component-view-model [component-name]`

**Location**: `Sources/Core/ViewModel`

**Rules**:
- Must be a `final class`
- Class annotation: `// sourcery: AutoPublisherTest, AutoViewModelStub`
- For `@Published private(set)` with `any XXX`: `// sourcery: propertyName = "Identical"`
- Must contain:
  1. `@Published private(set) var` (set by use cases, consumed by views)
  2. `var` (set by views and setup, manage didSet)
  3. `private var alreadyUpdateAll` (tracks setup state)
  4. Use cases list
  5. Init with all use cases (default implementation)
  6. Setup function
  7. Private setter functions

**Workflow**:
1. Add/Update view model code
2. Run swiftlint: `$ swiftlint`
3. Run sourcery: `$ sourcery`
4. Implement unit tests (uses XCTest for view models)

---

### spark-component-view

**Purpose**: Create or update view files for UIKit and SwiftUI (new components: SwiftUI only).

**Usage**: `/spark-component-view [component-name]`

**Location**: `Sources/Core/View`

**UIKit Rules**:
- Can inherit UIView or UIControl (default: UIView)
- Respect MARK order from template
- Follow template naming conventions

**SwiftUI Rules**:
- Respect MARK order from template
- Follow template naming conventions
- Add dynamic type only if requested
- Manage all possible inits (separate file if more than 4 public inits)
- New components: no ViewModel, read the tokens with `@Environment(\.theme)` and apply the ViewModifiers

**Workflow**:
1. Read templates
2. Add/Update view code for both UIKit and SwiftUI

---

### spark-component-documentation

**Purpose**: Create or update DocC documentation for component.

**Usage**: `/spark-component-documentation [component-name]`

**Location**: `Sources/Core/Documentation.docc`

**Parameters**:
- Description message
- Introduction message
- Figma URL
- ZeroHeight URL

**Workflow**:
1. Use description in `Documentation.md`
2. Use introduction in overview section
3. Get resources from snapshot tests in `Resources/`
4. Add resources to Rendering section
5. Set Figma and ZeroHeight URLs in Resources section

---

### spark-component-snapshots-testing

**Purpose**: Create or update snapshot tests for component.

**Usage**: `/spark-component-snapshots-testing [component-name]`

**Location**: `Tests/SnapshotTests`

**Rules**:
- Contains configuration with all customization variables
- Contains scenarios with all test functions
- Includes documentation function for DocC snapshots

**Workflow**:
1. Read SparkXXX and SparkUIXXX content
2. Create/update configuration in `Tests/SnapshotTests/Common`
3. Create/update scenarios in `Tests/SnapshotTests/Common`
4. Create/update snapshots for UIKit and SwiftUI
5. Run swiftlint: `$ swiftlint`
6. Run sourcery: `$ sourcery`

---

## Quality Assurance Skills

### spark-replace-xctests

**Purpose**: Migrate the XCTest unit tests of a component (or Common/Theming) to Swift Testing, without adding or removing tests.

**Usage**: `/spark-replace-xctests [component-name]`

**Rules**:
- Each `func test_xxx()` becomes one named `@Test("...")` in a `@Suite("...") struct`
- Functions renamed in lowerCamelCase without the `test_` prefix
- Snapshot tests and Deprecated files are not touched

**Workflow**:
1. Run sourcery
2. Migrate folder by folder (AccessibilityIdentifier → Constants → Enum → Model → Token → Environment → UseCase → ViewModel ...), building and running the tests after each folder

---

### spark-check-before-push

**Purpose**: Verify code quality before pushing to git.

**Usage**: `/spark-check-before-push`

**Checks Performed** (on created/updated files only):
- No TODO comments remain
- All public code is documented
- No commented code (except documentation)
- Copyright line present with current year
- No empty lines with whitespace or tabs
- All class members accessed with `self.`
- Package.swift uses remote URLs (not local paths)

**Actions**:
- Runs `$ swiftlint`
- Runs `$ swiftlint --fix` if necessary
- Displays list of any violations found

---

## Git & Deployment Skills

### spark-push

**Purpose**: Push code to git with proper commit message.

**Usage**: `/spark-push`

**Prerequisites**:
- If current branch is "main" or "master", prompts to create new branch
- Does not mention Claude in commit messages

**Workflow**:
1. Creates commit summary using [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
2. Adds description from current updated files
3. Asks for confirmation of commit texts
4. Pushes code if approved

**Commit Format**:
```
type(scope): subject

description

Co-Authored-By: Claude <noreply@anthropic.com>
```

---

## Demo App Skills

### spark-update-demo-code-syntax

**Purpose**: Add or update code syntax examples in demo app for all components.

**Usage**: `/spark-update-demo-code-syntax`

**Prerequisites**: Must be run from `spark-ios-demo` folder

**Location**: `Sources/Scene/Components/XXX/Tools/CodeSyntax`

**Process** (for each component in `Sources/Scene/Components/`):
1. Get all code syntaxes from component init documentation
2. Put syntaxes in `XXXCodeSyntaxes` (SwiftUI) and `XXXUICodeSyntaxes` (UIKit)
3. Create private static var for each syntax found

**Applies to**: Both SwiftUI and UIKit views (if they exist)

---

## Release Skills

### spark-changelog

**Purpose**: Replace the placeholder of the new version in `CHANGELOG.md` with the description of the changes since the previous release.

**Usage**: `/spark-changelog`

**Prerequisites**: `.script/update-changelog.swift` must have added the new version placeholder.

**Workflow**:
1. Get the new version and the previous tag
2. List the merged pull requests since the previous tag
3. Group them by category (Breaking Changes, New Features, Improvements, Bug Fixes, ...)
4. Replace the placeholder and ask for confirmation

---

## Common Conventions

### Code Conventions (All Skills)

- File headers: `Created by {Firstname Lastname} on DD/MM/YYYY`
- Copyright line includes current year for new files (keep the year of existing files)
- No empty lines contain whitespace or tabs
- All class members accessed with `self.`
- Protocols marked with `// sourcery: AutoMockable`
- Proper MARK comments in place

### Test Implementation (Component Skills)

- Tests must be written in **Swift Testing** framework
- Exceptions using XCTest (legacy components only):
  - View model tests
  - Use cases containing other use cases
- Proper imports:
  - `SparkComponentXXX`
  - `SparkCommon`
  - `SparkTheming`
  - `@testable`
  - `@_spi(SI_SPI) @testable import SparkComponentXXXTesting`
  - `Testing`

### Switch Statement Pattern

Use single return on switch:

```swift
// Do:
func test() -> String {
  return switch intent {
    case .main: "Main"
    case .other: "Other"
  }
}

// Don't do:
func test() -> String {
  switch intent {
    case .main: return "Main"
    case .other: return "Other"
  }
}
```

---

## Component Architecture

### Folder Structure

```
Modules/Components/{component-name}/
├── Sources/
│   └── Core/
│       ├── AccessibilityIdentifier/
│       ├── Constants/
│       ├── Documentation.docc/
│       ├── Enum/
│       ├── Environment/
│       ├── Extension/
│       │   └── Token/          — ComponentToken+XXX, EnvironmentTheme+XXXToken
│       ├── Token/
│       ├── View/
│       ├── ViewModifier/
│       ├── Model/              — legacy (UIKit) only
│       ├── UseCase/            — legacy (UIKit) only
│       └── ViewModel/          — legacy (UIKit) only
└── Tests/
    ├── SnapshotTests/
    └── UnitTests/
```

### Development Order

**New component (SwiftUI only)**:
1. Enum
2. Token (+ `ComponentToken+XXX`, `EnvironmentTheme+XXXToken`)
3. Environment
4. ViewModifier
5. View
6. Tests
7. Documentation

**Legacy component (with UIKit)**:
1. Enum
2. Model
3. Token
4. Environment
5. UseCase
6. ViewModel
7. View
8. Tests
9. Documentation

---

## Tips & Best Practices

1. **Always use skills for consistency**: Skills ensure proper structure and conventions
2. **Run sourcery before tests**: Required for generated test code
3. **Use Swift Testing**: Default for new tests (except noted exceptions)
4. **Document public code**: All public APIs must be documented
5. **Follow template patterns**: Templates provide the correct structure
6. **Check before pushing**: Always run `spark-check-before-push` before `spark-push`
7. **Component selection**: Use parameters to skip selection prompts
8. **New components are SwiftUI only**: use Token + ViewModifier, never UseCase / ViewModel
9. **Keep the UIKit dependencies**: when migrating a legacy component, never remove a ViewModel/UseCase still used by `SparkUIXXX`

---

## Examples

### Creating a new component:
```bash
/spark-create-component
# Follow prompts for: Name, Description, Figma, Zeroheight, Image
```

### Adding an enum to Button component:
```bash
/spark-component-enum button
# Or without parameter to select from list:
/spark-component-enum
```

### Migrating a legacy component to tokens:
```bash
/spark-component-migrate-token chip
```

### Preparing code for push:
```bash
/spark-check-before-push
# Review issues, then:
/spark-push
```

---

## Support

For issues or questions about Claude skills:
- Check the individual skill's SKILL.md file in `.claude/skills/{skill-name}/`
- Review the main project documentation in `CLAUDE.md`
- Consult the template files for reference implementations
