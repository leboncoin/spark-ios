# SparkComponentSegmentedControl

A Spark Segmented control provides closely related choices that affect an object, state, or view.

## Overview

The component is available on **SwiftUI** and requires at least **iOS 16**.

### Introduction

The Segmented Control component groups different but related content, allowing users to **switch views without leaving the current context**. They always contain at least **two segments** and **one segment is selected at a time**.

A segmented control is a linear set of **two to eight segments**, each of which functions as a button.

### Implementation

- On SwiftUI, you need to use the ``SparkSegmentedControl`` View with ``SparkSegmentedControlItem`` instances.

### Snasphots Testing

If you add a snapshots testing for a view which contains the ``SparkSegmentedControl``, you must add on your snapshots view this line :
```swift
.sparkIsSnapshot(true)
```

Example :
```swift
import SparkCommon // Needed

let view = MyViewWithSegmentedControl()
    .sparkIsSnapshot(true) // Magic is here

self.assertSnapshot(matching: view)
```

### Rendering

#### Content Types

| Text | Icons | Text and Icons | Label |
|:---:|:---:|:---:|:---:|
| ![SegmentedControl rendering with text.](segmentedcontrol_texts.png) | ![SegmentedControl rendering with icons.](segmentedcontrol_icons.png) | ![SegmentedControl rendering with text and icons.](segmentedcontrol_icons_and_texts.png) | ![SegmentedControl rendering with label.](segmentedcontrol_label.png) |

#### Segment Count

| 3 items | 6 items | 7 items |
|:---:|:---:|:---:|
| ![SegmentedControl rendering with 3 items.](segmentedcontrol_three_items.png) | ![SegmentedControl rendering with 6 items.](segmentedcontrol_six_items.png) | ![SegmentedControl rendering with 7 items.](segmentedcontrol_seven_items.png) |

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/049d6e-segmented-control)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=65227-17269)
