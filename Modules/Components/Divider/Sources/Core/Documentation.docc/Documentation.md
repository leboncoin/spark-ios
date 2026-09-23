# SparkComponentDivider

The Divider component provides a thin, unobtrusive line that separates 
and distinguishes sections of content to reinforce visual hierarchy. 

## Overview

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

It is composed by:
- if text : two separators between text.
- if no text : one separator.


A few common uses are:
- Separating sections on a page.
- Separating items in a list. 
- Creating a visual contrast between 2 sides of a page.

### Implementation

- On SwiftUI, you need to use the ``SparkDivider`` View.
- On UIKit, you need to use the ``SparkUIDivider`` which inherit from an UIView.


### Rendering

Without a text:
![Divider rendering.](divider_without_text.png)

With a text:
![Divider rendering.](divider_with_text.png)

Axis:
![Divider rendering.](divider_axis_horizontal.png)

![Divider rendering.](divider_axis_vertical.png)

Alignment:
![Divider rendering.](divider_alignment_top.png)

![Divider rendering.](divider_alignment_trailing.png)

Intents:
![Divider rendering.](divider_intent_outline.png)

![Divider rendering.](divider_intent_outlineHigh.png)

## A11y

If there is not text, the component is not accessible,
in other case, the accessibilityLabel is equals to the content of the label.

To override this value, you need to set a new **accessibilityLabel**

## Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/867b47-divider)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=47694-27911)
