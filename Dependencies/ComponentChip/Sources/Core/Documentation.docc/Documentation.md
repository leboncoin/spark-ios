# SparkComponentChip

The Chips help users quickly recognize an important information that has been entered by them, trigger actions, make selections, or filter content.

## Overview

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

It is composed by an optional text, optional icon and optionel extra content. 
At least one of the three is required.

Even if we can put all types of view in the **extra content**, we recommend using only :
- Icon (24px\*24px)
- A Spark Badge

### Implementation

- On SwiftUI, you need to use the ``SparkChip`` View.
- On UIKit, you need to use the ``SparkUIChip`` which inherit from an UIControl.

### Rendering

#### By Content Type

| Icon Only | Text Only | Text & Icon |
|:---:|:---:|:---:|
| ![Chip with icon.](chip_with_icon.png) | ![Chip with text.](chip_with_text.png) | ![Chip with text and icon.](chip_with_text_and_icon.png) |

| Text & Icon & Extra | Icon & Extra |
|:---:|:---:|
| ![Chip with text, icon and extra content.](chip_with_text_and_icon_and_extra_content.png) | ![Chip with icon and extra content.](chip_with_icon_and_extra_content.png) |

#### By Size

| Medium | Large |
|:---:|:---:|
| ![Chip medium size.](chip_with_size_medium.png) | ![Chip large size.](chip_with_size_large.png) |

#### By State

| Not Selected | Selected | Disabled |
|:---:|:---:|:---:|
| ![Chip not selected.](chip_with_text.png) | ![Chip selected.](chip_selected.png) | ![Chip disabled.](chip_disabled.png) |

## A11y

- The large content display, by default, the text and the icon. You can override theses values.
- If you not provide a text, you must set the **accessibilityLabel**.

## Custom Chip

If you need to create a custom chip component, you can use the ``ChipToken`` struct to access theme-based style values.

The ``ChipToken`` provides:
- **Border properties** (``ChipToken/Border``): width, radius, and dash length
- **Opacity values** (``ChipToken/Opacity``): different values for enabled and disabled states
- **Layout properties** (``ChipToken/Layout``): spacing and padding values
- **Size constants** (``ChipToken/Size``): heights and icon size
- **Typography** (``ChipToken/Typography``): font token for the chip title

> Tip: If you only need specific tokens, you can use the individual sub-structs directly. For example, use `ChipToken.Size()` if you only need size constants, or `ChipToken.Border(theme:)` for border properties.

## Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/17568d-chip)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=643-21226)
