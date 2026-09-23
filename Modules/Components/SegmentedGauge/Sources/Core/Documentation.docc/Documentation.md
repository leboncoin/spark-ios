# SparkComponentSegmentedGauge

The Spark SegmentedGauge allow users to quickly specify a numerical value within a given range.

## Overview

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

### Implementation

- On SwiftUI, you need to use the ``SparkSegmentedGauge`` View.
- On UIKit, you need to use the ``SparkUISegmentedGauge``.

### Accessibility

By default, the *accessibilityLabel* concat the title text, the current segment percent (localized value, Eg "2 out of 5" / "2 sur 5") and the description text like.

You can override this value if you want an another content.
- 
### Rendering

- With a title and description:

![SegmentedGauge rendering.](segmented_gauge_all.png) 

![SegmentedGauge rendering.](segmented_gauge_all_label.png)

- With a description only:

![SegmentedGauge rendering.](segmented_gauge_description.png) 

![SegmentedGauge rendering.](segmented_gauge_description_label.png)

- With all segments:

![SegmentedGauge rendering.](segmented_gauge_segments_three.png) 

![SegmentedGauge rendering.](segmented_gauge_segments_five.png)

- With all sizes:

![SegmentedGauge rendering.](segmented_gauge_size_small.png) 

![SegmentedGauge rendering.](segmented_gauge_size_medium.png)

- With a maker:

![SegmentedGauge rendering.](segmented_gauge_marker.png)

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/71a76b-segmented-gauge)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=60972-1300)
