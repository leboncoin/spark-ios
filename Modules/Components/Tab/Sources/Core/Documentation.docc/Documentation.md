# SparkComponentTab

A Tabs group related content and let users switch views on the same page. They always have at least two items, with one active.

## Overview

The Tabs are used to group different but related content, allowing users to navigate views without leaving the page. 
They always contain at least two items and one tab is active at a time. 
Tabs can be used on full page layouts or in components such as modals, cards, or side panels.

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

### Implementation

- On SwiftUI, you need to use the ``SparkTab`` and ``SparkTabItem`` View.
- On UIKit, you need to use the ``SparkUITab`` which inherit from an UIControl.

### Accessibility

By default, VoiceOver reads in order:
- The tab item label
- The current position (e.g., "1 of 3")
- The selection state

On accessibility sizes, a long press gesture will show an accessibility list view for easier navigation.

### Rendering

- Texts

![Tab rendering.](tab_texts.png)

- Icons

![Tab rendering.](tab_icons.png)

- With Extra View

![Tab rendering.](tab_extra_view.png)

- All Values

![Tab rendering.](tab_all_values.png)

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/7461a4-tab)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=267-8337)
