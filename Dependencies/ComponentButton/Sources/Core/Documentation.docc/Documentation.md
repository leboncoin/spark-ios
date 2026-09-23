# SparkComponentButton

## Overview

Spark Buttons are clickable elements used to trigger actions.

Buttons communicate calls to action to the user and allow users to interact with pages in a variety of ways. Button labels express what action will occur when the user interacts with it.

### Implementation

- On SwiftUI, you need to use the ``SparkButton`` View.
- On UIKit, you need to use the ``SparkUIButton`` which inherit from an UIControl.

### Rendering

- Title
![Button rendering.](button_title.png)

- Icon only
![Button rendering.](button_icon.png)

- All content (image + title)
![Button rendering.](button_all.png)

## A11y

SparkButton automatically supports:
- VoiceOver with proper button traits
- Dynamic Type up to xxxLarge
- Large Content Viewer for accessibility
- Haptic feedback on button press

- The large content is used to display the content of the tag in the popup.
- If you only provide an icon, you must set the **accessibilityLabel**.

## Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/34b742-button)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=18-1591)
