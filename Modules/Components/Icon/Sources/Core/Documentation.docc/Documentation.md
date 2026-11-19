# SparkComponentIcon

The Spark Icon shows a colored and scaled icon image.

## Overview

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 17**.

### Implementation

- On SwiftUI, you need to use the ``SparkIcon`` View.
- On UIKit, you need to use the ``SparkUIIcon`` inherits from UIImageView.

### Accessibility

By default, the component is not accessible.

You can override this value **BUT** in this case, an **accessibilityLabel** must be setted.

### Rendering

![Icon rendering.](icon_defaults.png)

## Custom Icon

If you need to create a custom icon component, you can use the ``IconToken`` struct, available from the theme with `theme.component.icon`, to access theme-based style values.

The ``IconToken`` provides:
- **Colors** (``IconToken/Colors``): tint color token
- **Size constants** (``IconToken/Size``): icon size

> Tip: If you only need specific tokens, you can use the individual categories directly. For example, use `theme.component.icon.size` if you only need size constants.

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/11373f-icon)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=2411-22585)
