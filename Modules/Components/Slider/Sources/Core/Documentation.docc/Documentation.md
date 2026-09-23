# SparkComponentSlider

A slider is an interactive component that allows users to set values by moving a handle within a defined range.

## Overview

The Slider allows users to select a single value or a range of values along a continuous or discrete scale (e.g. volume, brightness, price range).

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

### Implementation

- On SwiftUI, you need to use the ``SparkSlider`` View.
- On UIKit, you need to use the ``SparkUISlider`` which inherit from an UIControl.

### Accessibility

You must set an **accessibilityLabel** to give some context.

This component use the native slider **accessibilityValue**'s.
To override this value, you need to set a new **accessibilityValue**.

### Rendering

- Default

![Slider rendering.](slider_default.png)

- Title

![Slider rendering.](slider_title.png)

- Value

![Slider rendering.](slider_value.png)

- Range Values

![Slider rendering.](slider_range_values.png)

- All Values

![Slider rendering.](slider_all_values.png)


### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/25cceb-slider)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=3282-22023)
