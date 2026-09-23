# SparkComponentSpinner

The Spark Spinner is a revolving animated icon indicating ongoing process or loading activity.

## Overview

A spinner is a dynamic graphical element used to indicate loading or processing, 
providing visual feedback during wait times or background tasks.

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

### Implementation

- On SwiftUI, you need to use the ``SparkSpinner`` View.
- On UIKit, you need to use the ``SparkUISpinner`` inherits from UIView.

### Accessibility

By default, the component is not accessible.

You can override this value **BUT** in this case, an **accessibilityLabel** must be setted.

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/7651da-spinner)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=2411-23008)
