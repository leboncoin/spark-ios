# SparkComponentDotsIndicator

Shows the user's **progress in a sequence of pages**.

## Overview

The component is available on **SwiftUI** and requires at least **iOS 17**.

### Introduction

The Dots Indicator shows the current page in a sequence of pages (carousel, onboarding, ...). The **active dot** is wider than the **inactive dots**.

By default, the dots indicator is not interactive. Only the **large** size can have the **tap interaction**: tapping on the leading half shows the previous page and tapping on the trailing half shows the next page.

### Implementation

- On SwiftUI, you need to use the ``SparkDotsIndicator`` View.

### Rendering

#### Sizes

| Small | Medium (default) | Large |
|:---:|:---:|:---:|
| ![DotsIndicator rendering with small size.](dotsIndicator_size_small.png) | ![DotsIndicator rendering with medium size.](dotsIndicator_size_medium.png) | ![DotsIndicator rendering with large size.](dotsIndicator_size_large.png) |

#### Intents

| Support (default) | Surface |
|:---:|:---:|
| ![DotsIndicator rendering with support intent.](dotsIndicator_intent_support.png) | ![DotsIndicator rendering with surface intent.](dotsIndicator_intent_surface.png) |

#### States

| Enabled | Disabled |
|:---:|:---:|
| ![DotsIndicator rendering with enabled state.](dotsIndicator_size_medium.png) | ![DotsIndicator rendering with disabled state.](dotsIndicator_isDisabled.png) |

## Custom DotsIndicator

If you need to create a custom dots indicator component, you can use the ``DotsIndicatorToken`` struct, available from the theme with `theme.component.dotsIndicator`, to access theme-based style values.

The ``DotsIndicatorToken`` provides:
- **Border properties** (``DotsIndicatorToken/Border``): dot radius
- **Colors** (``DotsIndicatorToken/Colors``): active and inactive dot color tokens
- **Layout properties** (``DotsIndicatorToken/Layout``): spacing between the dots
- **Opacity** (``DotsIndicatorToken/Opacity``): opacity for enabled and disabled states
- **Size constants** (``DotsIndicatorToken/Size``): dot sizes

> Tip: If you only need specific tokens, you can use the individual categories directly. For example, use `theme.component.dotsIndicator.size` if you only need size constants, or `theme.component.dotsIndicator.colors` for color tokens.

### Resources

- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=44234-4697)
