# SparkComponentRating

A ratings let users see and/or set a star rating for a user or experience.

## Overview

This repository contains two component : 
- Display (read only)
- Input (controllable)

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

### Implementation

- Display :
    - On SwiftUI, you need to use the ``SparkRatingDisplay`` View.
    - On UIKit, you need to use the ``SparkUIRatingDisplay`` inherits from UIView.

- Input :
    - On SwiftUI, you need to use the ``SparkRatingInput`` View.
    - On UIKit, you need to use the ``SparkUIRatingInput`` inherits from UIControl.

### Accessibility

You must set an **accessibilityLabel** to give some context.

By default, the component set an localized (english and french) **accessibilityValue**
with the current value and the number of stars :"1 out of 5" / "1 sur 5".
To override this value, you need to set a new **accessibilityValue**.

### Rendering

- Display

![Rating rendering.](rating_display_default.png)

- Input

![Rating rendering.](rating_input_default.png)

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/63e136-rating)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=7792-7244)
