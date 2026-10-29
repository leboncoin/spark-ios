# SparkComponentCircularMeter

The Spark Circular Meter is a component used to display a progression or a rate in a circular form, with determined completion steps/values.

## Overview

The component is available on **SwiftUI** and requires at least **iOS 17**.

### Introduction

The Circular meter is a component used to display a progression or a rate in a circular form, with determined completion steps/values. It provides a quick and visual understanding of a percentage-based value, usually linked to a key metric.

It highlights:
- a visual progression, with determined completion steps/values
- a clear central value
- optionally, a descriptive label

### Implementation

- On SwiftUI, you need to use the ``SparkCircularMeter`` View.

### Rendering

![Component rendering.](component.png)

#### Sizes

| Small | Medium | Large | Extra Large |
|:---:|:---:|:---:|:---:|
| ![Small size](circularmeter_small.png) | ![Medium size](circularmeter_medium.png) | ![Large size](circularmeter_large.png) | ![Extra large size](circularmeter_xLarge.png) |

#### Display Types

| Text | Icon | Image |
|:---:|:---:|:---:|
| ![Text display](circularmeter_text.png) | ![Icon display](circularmeter_icon.png) | ![Image display](circularmeter_image.png) |

## Custom CircularMeter

If you need to create a custom circular meter component, you can use the ``CircularMeterToken`` struct, available from the theme with `theme.component.circularMeter`, to access theme-based style values.

The ``CircularMeterToken`` provides:
- **Colors** (``CircularMeterToken/Colors``): track, indicator, icon, value and content color tokens
- **Layout properties** (``CircularMeterToken/Layout``): spacing and padding
- **Typography** (``CircularMeterToken/Typography``): font tokens of the value and the content
- **Content** (``CircularMeterToken/Content``): whether the content is displayed inside the gauge
- **Size constants** (``CircularMeterToken/Size``): gauge diameter, gauge stroke and icon sizes

> Tip: If you only need specific tokens, you can use the individual categories directly. For example, use `theme.component.circularMeter.size` if you only need size constants, or `theme.component.circularMeter.colors` for color tokens.

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/35093b-circular-meter)
- Desing on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=62525-3978)
