# SparkComponentTag

## Overview

A Spark Tag is used to label content and help users quickly recognize info
about them: Categories, Status...
Can be applied with different colors and designs that are associated
with a content due to its characteristics: new content, unvisited content,
featured content...

Users can’t interact with Tag except for accessibility.

### Implementation

- On SwiftUI, you need to use the ``SparkTag`` View.
- On UIKit, you need to use the ``SparkUITag`` which inherit from an UIView.

### Rendering

- Text :
![Tag rendering with a text.](tag_with_text.png)

- Text + Icon :
![Tag rendering with a text and an icon.](tag_with_text_and_icon.png)

- Icon : 
![Tag rendering with an icon.](tag_with_icon.png)

- Is highlighted : 
![Tag rendering with when us highlighted is true.](tag_with_is_highlighted.png)

## A11y

- The large content is used to display the content of the tag in the popup.
- If you not provide a text, you must set the **accessibilityLabel**.

## Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/295e88-tag)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=631-15420)
