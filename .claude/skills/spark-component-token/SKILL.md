---
name: spark-component-token
description: Create or update a token file in the Token folder in Sources of a spark-ios-component-XXX and add or update unit tests.
---

# Add Repository Skill

## Overview & Prerequisites

This skill guides you to implement/update a token in spark component.

## Component Selection

**Parameter Handling:**
- If the skill is invoked with a parameter (e.g., `/spark-component-token button`):
  - Use the parameter as the component name
  - Verify the folder exists in `Modules/Components/{component-name}/`
  - If found, use that component and skip the selection step

- If no parameter is provided:
  - List all folders in the `Modules/Components/` directory
  - Use AskUserQuestion to let the user select ONE component from the list
  - Format: Display folder names as options (e.g., "button", "card", "checkbox")

**Once the component is selected, all operations must be performed in `Modules/Components/{component-name}/` folder.**

Use the files in the **template** folder as reference to manage the *token* and the *unit tests*. See `Modules/Components/InputOTP/Sources/Core/Token` for a full real-world example.

> The template uses `Border`, `Size`, and `Typography` purely as illustrations of three recurring *patterns* (see Rules below). A real component's token categories are whatever it actually needs — e.g. `Colors`, `Opacity`, `Layout`, `Spacing`, `Icon`, `Animation`, ... Determine the category names and count from the component's design/usage, not from the template names.

> The token is exposed publicly through `theme.component.xxx` (`ComponentToken+XXX.swift`) and consumed by the SwiftUI views through `EnvironmentTheme+XXXToken.swift`. Theses two files are managed by the skill **spark-component-migrate-token**.

## Rules

The Token file must respect theses rules :
  - must be located in *Sources/Core/Token* and in *Tests/UnitTests/Token*.
  - the root file is named *XXXToken.swift* and contains a `public struct XXXToken: Equatable` with one property per token category the component actually needs (there is no fixed list or fixed count — could be one category or a dozen), plus a `public init(theme: any Theme)` that forwards the theme to every category that needs it.
  - each token category lives in its own file named *XXXToken+CategoryName.swift* (e.g. `XXXToken+Opacity.swift`), containing a `public extension XXXToken` with a nested `struct CategoryName: Equatable`.
  - a category that depends on the theme (illustrated by ``Border`` and ``Typography`` in the template):
    - stores the theme in an internal `let theme: any Theme` (no explicit init, the internal memberwise `init(theme:)` is used by the root struct).
    - exposes its values as **public computed properties** (`public var radius: CGFloat { ... }`) reading `self.theme`.
    - exposes the values depending on a state/configuration (intent, isEnabled, isSelected, onError, ...) as **public methods** (`public func width(isSelected: Bool) -> CGFloat`). Theses methods replace the old styling use cases.
    - implements a manual `static func ==` comparing the themes: `lhs.theme.equals(rhs.theme)`.
    - is assigned in the root `init(theme:)`.
  - a category that only exposes fixed constants (no theme-dependent values, illustrated by ``Size`` in the template) contains only `public let` constants. On the root struct, its property is a stored default value (`public let size = Size()`), **not** assigned in the root `init(theme:)` body.
  - every public struct, property and method must be documented with a doc comment (`///`).
  - use `// MARK: - Properties`, `// MARK: - Methods` and `// MARK: - Equatable` in the categories.
  - the root *XXXToken.swift* file must have a top-level doc comment that:
    - starts with "Contains all token values for the XXX component, grouped like the ``Theme``."
    - lists every category actually present, each with a doc link (e.g. `` ``XXXToken/CategoryName``: description``)
    - includes a Tip explaining the token is available with `theme.component.xxx` and that the categories can be used individually (`theme.component.xxx.size`)
    - includes a "Creating a Custom XXX" section with a full SwiftUI usage example using `theme.component.xxx`

## Workflow
  - [ ] Add/Update the code.
  - [ ] Add/Update the documentation (the token file and its categories are always public).
  - [ ] Run swiftlint ```$ swiftlint```.
  - [ ] Run sourcery ```$ sourcery```
  - [ ] Implement the unit tests. Read theses folders to get mocks :
    - *spark-ios-component-XXX/Sources/Testing*
    - *spark-ios-common/Sources/Testing*
    - *spark-ios-theming/Sources/Testing*

### Code Conventions
- [ ] File headers follow pattern: `Created by {Firstname Lastname} on DD/MM/YYYY`
- [ ] Copyright line includes current year for new files (keep the year of existing files)
- [ ] No empty lines contain whitespace or tabs
- [ ] All members accessed with `self.`
- [ ] Proper MARK comments in place
- [ ] Single `return switch` when each case returns a value

### Test Implementation
- [ ] Tests must be written in **Swift Testing** framework
- [ ] Imports: `Testing`, `Foundation`, `@testable import SparkComponentXXX`, `@_spi(SI_SPI) import SparkTheming`, `@_spi(SI_SPI) import SparkThemingTesting`
- [ ] Function names in lowerCamelCase describing the expectation (e.g. `radiusShouldReturnRadiusFull`)
- [ ] Use `ThemeGeneratedMock.mocked()` for the values and `ThemeGeneratedMock.mocked2()` for the inequality
- [ ] For each category:
  - one test per computed property comparing with the theme value (fonts compared with `.font`)
  - one parameterized test (`@Test(arguments:)`) per method, covering all the combinations of the parameters
  - a `// MARK: - Equatable Tests` section: same theme returns true, different theme returns false
  - for a constant category: one test per constant
- [ ] The root `XXXTokenTests` contains `initShouldSetAllCategories` (each property equals `.init(theme: self.theme)` or `.init()` for constants), plus equatable true/false at the root level

### When to Ask for Help

If you encounter:
- A token value that doesn't map to any existing theme property
- A use case that mixes styling and business rules (the business rules must not go in the token)
- Component doesn't follow standard patterns

Use AskUserQuestion to clarify with the user before proceeding.
