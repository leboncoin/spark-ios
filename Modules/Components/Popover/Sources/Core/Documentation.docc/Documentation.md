# SparkComponentPopover

A popover is a small surface that appears when someone interacts with a component to give nonessential, contextual information without blocking them.

## Overview

The component is available on **UIKit** and **SwiftUI** and requires at least **iOS 17**.

### Implementation

- On SwiftUI, you need to use the ``SwiftUICore/View/sparkPopover(isPresented:attachmentAnchor:arrowEdge:content:)`` modifier.
  The intent is set with ``SwiftUICore/View/sparkPopoverIntent(_:)`` and the theme with `sparkTheme(_:)`.
- On UIKit, you need to use the ``PopoverViewController`` presented with `presentPopover(_:sourceView:sourceRect:permittedArrowDirections:passthroughViews:animated:completion:)`.

```swift
struct MyView: View {
    let theme: SparkTheming.Theme = MyTheme()
    @State private var isPresented = false

    var body: some View {
        Button("Show") {
            self.isPresented = true
        }
        .sparkPopover(isPresented: self.$isPresented) {
            Text("My popover")
        }
        .sparkPopoverIntent(.info)
        .sparkTheme(self.theme)
    }
}
```

## Custom Popover

If you need to create a custom popover, you can use the ``PopoverToken`` struct, available from the theme with `theme.component.popover`, to access theme-based style values.

The ``PopoverToken`` provides:
- **Colors** (``PopoverToken/Colors``): foreground color token for each intent
- **Layout properties** (``PopoverToken/Layout``): padding

## Resources

- Specification on [ZeroHeight](https://zeroheight.com/1186e1705/p/88a08c-popover)
- Design on [Figma](https://www.figma.com/design/0QchRdipAVuvVoDfTjLrgQ/Spark-Component-Specs?node-id=4337-30927)
