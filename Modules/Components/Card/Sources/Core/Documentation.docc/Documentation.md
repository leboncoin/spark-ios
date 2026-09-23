# SparkComponentCard

The Spark Cards display content and actions about a single subject.

## Overview

A card is a block that groups related info (text, image, button). It helps show content clearly, compactly, and in a scannable way.

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 16**.

### Implementation

- On SwiftUI, you need to use the ``SparkCard`` View.
- On UIKit, you need to use the ``SparkUICard`` which inherit from an UIControl.

### Accessibility

You need to manage yourself the accessibility of the component because Spark doesn't know the context of the content.

If an action is provided, the card will be treated as a button.

## Rendering

#### Classic

| Default | Is highlighted |
|:---:|:---:|
| ![Default](card_classic.png) | ![is highlight](card_with_highlight.png) |

#### With Header (SwiftUI Only)

| Banner | Border |
|:---:|:---:|
| ![Banner header](card_with_banner_header.png) | ![Border header](card_with_border_header.png) |

## Templates

For SwiftUI, you have also have access to a ``SparkAwarenessCard``. 
It is a ``SparkCard`` with icon, title, description, action and an extra view.

### Rendering

| Default | With Extra View |
|:---:|:---:|
| ![Classic](awareness_card_classic.png) | ![With Extra View](awareness_card_with_extra_view.png) |

### Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/51f428-card)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=59075-1497)
