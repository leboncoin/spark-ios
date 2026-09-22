# SparkComponentTextLink

A textlink is a reference to a resource.


It can be external (e.g. a different web page) or internal (e.g. a specific element in the current page).

## Overview

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

It can be external (e.g. a different web page) or internal (e.g. a specific element in the current page).

### Implementation

- On SwiftUI, you need to use the ``SparkTextLink`` View.
- On UIKit, you need to use the ``SparkUITextLink`` which inherit from an UIControl.

### Accessibility

By default, the accessibilityLabel is equals to the text.

To override this value, you need to set a new **accessibilityLabel**.


The image is not accessible.

### Rendering
- With image :
![TextLink rendering.](textlink_with_image.png)

- Without image :
![TextLink rendering.](textlink_without_image.png)

- With a long text :
![TextLink rendering.](textlink_with_long_text.png)

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/75ed11-textlink)
- Desing on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=8638-1179)
