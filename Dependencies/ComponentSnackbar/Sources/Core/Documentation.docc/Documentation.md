# SparkComponentSnackbar

## Overview

A Snackbar component is a brief, non-intrusive notification that appears at the bottom of a screen, delivering concise feedback or information about user actions.

Snackbars inform users of a process that an app has performed or will perform. They appear temporarily, towards the bottom of the screen. They shouldn't interrupt the user experience, and they don't require user input to disappear.

### Implementation

- On SwiftUI, you need to use the ``sparkSnackbar`` View extension.
- On UIKit, you need to use the ``SparkUISnackbar`` which can be presented modally.

### Rendering

![Snackbar rendering.](snackbar_full.png.png)

## A11y

SparkSnackbar automatically supports:
- VoiceOver with proper accessibility traits
- Dynamic Type for text scaling
- Semantic grouping of title and description
- Auto-dismiss with configurable delay

- The icon is automatically hidden from accessibility as it's decorative.
- Button actions remain accessible through VoiceOver gestures.

## Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/34b742-snackbar)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=18-1591)
