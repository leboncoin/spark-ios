//
//  View+SparkPopoverExtension.swift
//  SparkComponentPopover
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

public extension View {

    /// Presents a Spark popover when a given condition is true.
    ///
    /// The theme is read from the environment (``sparkTheme(_:)``) and the intent
    /// from ``sparkPopoverIntent(_:)``. The foreground color of the intent is applied on the content.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///     @State private var isPresented = false
    ///
    ///     var body: some View {
    ///         Button("Show") {
    ///             self.isPresented = true
    ///         }
    ///         .sparkPopover(isPresented: self.$isPresented) {
    ///             Text("My popover")
    ///         }
    ///         .sparkPopoverIntent(.info)
    ///         .sparkTheme(self.theme)
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether
    ///     to present the popover content that you return from the modifier's
    ///     `content` closure.
    ///   - attachmentAnchor: The positioning anchor that defines the
    ///     attachment point of the popover. The default is
    ///     ``Anchor/Source/bounds``.
    ///   - arrowEdge: The edge of the `attachmentAnchor` that defines the
    ///     location of the popover's arrow in macOS. The default is ``Edge/top``.
    ///     iOS ignores this parameter.
    ///   - content: A closure returning the content of the popover.
    func sparkPopover<Content>(
        isPresented: Binding<Bool>,
        attachmentAnchor: PopoverAttachmentAnchor = .rect(.bounds),
        arrowEdge: Edge = .top,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content: View {
        self.popover(
            isPresented: isPresented,
            attachmentAnchor: attachmentAnchor,
            arrowEdge: arrowEdge
        ) {
            content()
                .popoverForeground()
                .popoverPadding()
                .presentationCompactAdaptation(.popover)
        }
    }
}
