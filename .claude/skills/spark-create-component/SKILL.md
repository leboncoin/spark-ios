---
name: spark-create-component
description: Create a new SwiftUI-only component in the Modules/Components folder (core code + tests + documentation) from the Figma and Zeroheight specifications, with the Token + ViewModifier architecture.
---

# Create a New Component

## Overview & Prerequisites

This skill creates a **complete new component**: the core code, the tests and the documentation.

❗️ This skill should be used from the root of the repository ❗️

> **All new components are created for SwiftUI only.** There is no UIKit view (`SparkUIXXX`), and no **UseCase**, **Model** or **ViewModel**: the styling rules live in the **Token** (exposed through `theme.component.xxx`) and are applied by the views through private **ViewModifiers**.
> Reference implementation: `Modules/Components/InputOTP`. Read it before writing any code.

The skill will:
1. Get the component specification from **Figma** and **Zeroheight** (through their MCPs)
2. Create the component structure from the template and register it (`Package.swift`, `Import.swift`, Demo)
3. Implement the core code with the dedicated skills (Enum, Token, Environment, ViewModifier, View, ...)
4. Add the unit tests and the snapshot tests
5. Write the DocC documentation

## Input Parameters

Gather the required parameters one by one. Check if the user has already provided each piece of information. If not, ask for each parameter individually in a conversational message.

**Required Parameters (ask one at a time):**

1. **Component Name** (PascalCase format)
   - Examples: Button, Avatar, Chip, SegmentedControl
   - Ask: "What is the component name? (PascalCase format, e.g., Button, Avatar, Chip)"

2. **Description** (Brief description for the documentation)
   - Examples: "A customizable button component", "User profile image component"
   - Ask: "What is the component description? (Brief description for documentation)"

3. **Figma Link** (URL to the Figma design)
   - Example: https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=643-21226
   - Ask: "What is the Figma link? (URL to the Figma design)"
   - Used in the documentation **and** by the Figma MCP to get the component specification.

4. **Zeroheight Link** (URL to the Zeroheight specifications)
   - Example: https://zeroheight.com/1186e1705/p/17568d-chip
   - Ask: "What is the Zeroheight link? (URL to the Zeroheight specifications)"
   - Used in the documentation **and** by the Zeroheight MCP to get the component specification.

5. **Anatomy Image Path** (Local path to the anatomy image file)
   - Example: /Users/username/Desktop/anatomy.png
   - Ask: "What is the anatomy image path? (Local path to the anatomy image file)"

**Important:**
   - Do NOT use the `AskUserQuestion` tool to gather these parameters
   - Ask for ONE parameter at a time in a conversational message
   - Wait for the user to respond before asking for the next parameter
   - Only proceed to the workflow once ALL parameters have been collected

## Workflow

### Step 1: Validate Parameters

- [ ] Component Name (PascalCase)
- [ ] Description
- [ ] Figma Link
- [ ] Zeroheight Link
- [ ] Anatomy Image Path (verify the file exists)

### Step 2: Prepare Component Names

From the component name, generate:
- **REMOVE SPARK MENTION**: remove *Spark* or *SparkComponent* from the name ("SparkButton" -> "Button", "SparkComponentButton" -> "Button")
- **COMPONENT_NAME_PASCAL**: PascalCase (e.g. "SegmentedControl")
- **COMPONENT_NAME_LOWER**: lowercase (e.g. "segmentedcontrol")
- **COMPONENT_NAME_KEBAB**: kebab-case (e.g. "segmented-control")
- **COMPONENT_NAME_CAMEL**: camelCase (e.g. "segmentedControl"), used for `theme.component.segmentedControl` and the Demo case

### Step 3: Get the Specification (Figma + Zeroheight MCPs)

Use the links with the related MCPs to get the full specification **before** writing any code:

- [ ] **Figma MCP**: parse the link (`fileKey` + `node-id`, convert "-" to ":"), then get the design context, the screenshot and the variables (colors, spacings, radius, typography, sizes, states, variants). Follow the Figma skills when required (e.g. `figma:figma-design-to-code` before `get_design_context`).
- [ ] **Zeroheight MCP**: read the specification page (usage, anatomy, variants, states, behaviors, accessibility).
- [ ] If an MCP is not available or fails, tell the user and ask how to continue (do not guess the specification).

Then write a short **specification summary** for the user and wait for their validation:
- Public API (configuration enums, environment modifiers, initializers)
- Anatomy (sub-views)
- Token categories (colors, spacings, sizes, borders, typography, animation, ...) mapped to the theme tokens
- States (enabled, disabled, pressed, focused, error, ...)
- Accessibility

### Step 4: Copy the Template

```bash
cp -r .template/component/ "Modules/Components/${COMPONENT_NAME_PASCAL}/"
```

### Step 5: Anatomy Image

- [ ] Copy the anatomy image into `.github/assets/anatomy/`
- [ ] Rename it `{component-name-kebab}.png` (e.g. `segmented-control.png`)

### Step 6: Replace All Placeholders

Replace these exact placeholders in the file contents, then rename the files with `mv`:

| Placeholder | Underscores | Replace With | Example |
|------------|-------------|--------------|---------|
| `__COMPONENT_NAME___` | 2 prefix, 3 suffix | PascalCase | SegmentedControl |
| `___COMPONENT_NAME___` | 3 each side | PascalCase | SegmentedControl |
| `___component_name___` | 3 each side | lowercase | segmentedcontrol |
| `___component-name___` | 3 each side | kebab-case | segmented-control |

### Step 7: Update documentation.json

`Modules/Components/{ComponentName}/documentation.json`:
- [ ] `title`: readable name + " Component" (e.g. "Segmented Control Component")
- [ ] `description`: the user description
- [ ] `figma`: the Figma link
- [ ] `zeroheight`: the Zeroheight link
- [ ] `image`: the anatomy image name without extension (e.g. "segmented-control")

Update the Zeroheight link (`TODO`) in `README.md`.

### Step 8: Register the Component

**`Package.swift`** (single package, keep the alphabetical order, 4 spaces indentation):
- [ ] Add `"SparkComponent{ComponentName}"` in the dependencies of the main `Spark` target
- [ ] Add the core and testing targets (after the other component targets, with a `// {ComponentName}` comment):
  ```swift
  // {ComponentName}
  .target(
      name: "SparkComponent{ComponentName}",
      dependencies: [
          "SparkCommon",
          "SparkTheming"
          // + "SparkResources" or other components if needed
      ],
      path: "Modules/Components/{ComponentName}/Sources/Core"
  ),
  .target(
      name: "SparkComponent{ComponentName}Testing",
      dependencies: [
          "SparkComponent{ComponentName}",
          "SparkCommon",
          "SparkCommonTesting",
          "SparkThemingTesting",
          "SparkTheme"
      ],
      path: "Modules/Components/{ComponentName}/Sources/Testing"
  ),
  ```
- [ ] Add the test targets:
  ```swift
  .testTarget(
      name: "SparkComponent{ComponentName}UnitTests",
      dependencies: [
          "SparkComponent{ComponentName}",
          "SparkComponent{ComponentName}Testing",
          "SparkCommonTesting",
          "SparkThemingTesting"
      ],
      path: "Modules/Components/{ComponentName}/Tests/UnitTests"
  ),
  .testTarget(
      name: "SparkComponent{ComponentName}SnapshotTests",
      dependencies: [
          "SparkComponent{ComponentName}",
          "SparkComponent{ComponentName}Testing",
          "SparkCommonSnapshotTesting",
      ],
      path: "Modules/Components/{ComponentName}/Tests/SnapshotTests"
  ),
  ```

**`Spark/Sources/Core/Import.swift`**:
- [ ] Add `@_exported import SparkComponent{ComponentName}` in alphabetical order

### Step 9: Implement the Core Code

Follow the **creation order** of a new component (see `CLAUDE.md`), using the matching skill for each type:

1. [ ] **Enum** (`spark-component-enum`): the configuration enums (intent, size, variant, ...)
2. [ ] **Token** (`spark-component-token`): `XXXToken` + categories (`+Colors`, `+Spacing`, `+Animation`, ...), `ComponentToken+XXX` (`theme.component.xxx`) and `EnvironmentTheme+XXXToken`
3. [ ] **Environment** (`spark-component-environment`): the `EnvironmentValues` and the public view modifiers configuring the component
4. [ ] **ViewModifier**: private view modifiers reading the tokens from `@Environment(\.theme)`, with an internal `View` extension
5. [ ] **AccessibilityIdentifier** (`spark-component-accessibility-identifier`)
6. [ ] **View** (`spark-component-view`): `SparkXXX` in `View/Public` (replace the template file), sub-views in `View/Internal`

❗️ Do **not** create a UIKit view, a UseCase, a Model or a ViewModel.

### Step 10: Tests

- [ ] Run `make sourcery` (or `sourcery` from the component folder)
- [ ] Unit tests with **Swift Testing**, same nomenclature as the productive code (each skill above adds its tests). Remove `Tests/UnitTests/.gitkeep` once a test exists.
- [ ] Snapshot tests (`spark-component-snapshots-testing`), replacing the template file
- [ ] Run `make test TEST_TARGETS="SparkComponent{ComponentName}UnitTests"` and fix the failures

### Step 11: Documentation

- [ ] DocC (`spark-component-documentation`): complete `Documentation.md` (description, Figma and Zeroheight links, usage, rendering images generated by the snapshot tests)
- [ ] Add the component in the **Demo** app: new case in `Demo/Sources/Core/Scene/Components/Main/ComponentsView+ComponentExtension.swift` (excluded from the UIKit list), and the `Demo/Sources/Core/Scene/Components/Components/{ComponentName}/` folder (Configuration, Integration, Tools) based on `InputOTP`. Use `spark-update-demo-code-syntax` for the code syntax.
- [ ] Add a `CHANGELOG.md` entry if needed (`spark-changelog`)

### Step 12: Verify

- [ ] No remaining placeholder (`___`, `TODO`) in the component folder
- [ ] `swiftlint` from the component folder
- [ ] `make build` and the tests are green

## Error Handling

If any step fails:
1. Stop the process immediately
2. Report the specific error and the failing step to the user
3. Suggest a corrective action if applicable

## Final Output

When complete, give the user:
1. 📁 The path of the new component: `Modules/Components/{ComponentName}/`
2. 📝 A summary of the created and modified files (component, `Package.swift`, `Import.swift`, Demo, assets)
3. ✅ The test results (unit and snapshot)
4. ⚠️ The parts of the specification not implemented or to confirm with the designers
