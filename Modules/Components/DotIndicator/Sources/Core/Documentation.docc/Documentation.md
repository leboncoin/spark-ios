# SparkComponentDotIndicator

Shows the user's **progress in a sequence of pages**.

## Overview

The component is available on **SwiftUI** and requires at least **iOS 17**.

### Introduction

The Dot Indicator shows the current page in a sequence of pages (carousel, onboarding, ...). The **active dot** is wider than the **inactive dots**.

By default, the dot indicator is not interactive. Only the **large** size can have the **tap interaction**: tapping on the leading half shows the previous page and tapping on the trailing half shows the next page.

### Implementation

- On SwiftUI, you need to use the ``SparkDotIndicator`` View.

### Rendering

#### Sizes

| Small | Medium (default) | Large |
|:---:|:---:|:---:|
| ![DotIndicator rendering with small size.](dotIndicator_size_small.png) | ![DotIndicator rendering with medium size.](dotIndicator_size_medium.png) | ![DotIndicator rendering with large size.](dotIndicator_size_large.png) |

#### Intents

| Support (default) | Surface |
|:---:|:---:|
| ![DotIndicator rendering with support intent.](dotIndicator_intent_support.png) | ![DotIndicator rendering with surface intent.](dotIndicator_intent_surface.png) |

#### States

| Enabled | Disabled |
|:---:|:---:|
| ![DotIndicator rendering with enabled state.](dotIndicator_size_medium.png) | ![DotIndicator rendering with disabled state.](dotIndicator_isDisabled.png) |

## Custom DotIndicator

If you need to create a custom dot indicator component, you can use the ``DotIndicatorToken`` struct, available from the theme with `theme.component.dotIndicator`, to access theme-based style values.

The ``DotIndicatorToken`` provides:
- **Border properties** (``DotIndicatorToken/Border``): dot radius
- **Colors** (``DotIndicatorToken/Colors``): active and inactive dot color tokens
- **Layout properties** (``DotIndicatorToken/Layout``): spacing between the dots
- **Opacity** (``DotIndicatorToken/Opacity``): opacity for enabled and disabled states
- **Size constants** (``DotIndicatorToken/Size``): dot sizes

> Tip: If you only need specific tokens, you can use the individual categories directly. For example, use `theme.component.dotIndicator.size` if you only need size constants, or `theme.component.dotIndicator.colors` for color tokens.

### Resources

- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=44234-4697)
