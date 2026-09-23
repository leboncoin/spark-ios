# SparkComponentBadge

The badges are a visual indicator for numeric values such as tallies and scores.

## Overview

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

It is composed by an optional value and unit. 

### Implementation

- On SwiftUI, you need to use the ``SparkBadge`` View.
- On UIKit, you need to use the ``SparkUIBadge`` UIView.

## Attach

It is possible to attach the view with a ``BadgePosition`` to a view.
- SwiftUI : a modifier is available on a view extension. Read the `attachSparkBadge(position:_:)` to have more information.
- UIKit : a function is available directly on the ``SparkUIBadge``. Read the ``SparkUIBadge`` to have more information.

### Rendering

With a value (medium and small sizes):

![Component rendering.](badge_with_value_medium.png)

![Component rendering.](badge_with_value_small.png)

With a value and an unit:

![Component rendering.](badge_with_unit.png)

Without a value (medium and small sizes):

![Component rendering.](badge_without_value_medium.png)

![Component rendering.](badge_without_value_small.png)

Attached (trailing and top right corner):

![Component rendering.](badge_with_value_attach_trailing.png)

![Component rendering.](badge_with_value_attach_topTrailingCorner.png)

## A11y

- You must manage by yourself the **accessibilityLabel** : add a context, a value, ...

## Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/8711ec-badge)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=643-15510)
