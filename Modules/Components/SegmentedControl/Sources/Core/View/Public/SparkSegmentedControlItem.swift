//
//  SparkSegmentedControlItem.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

/// A single segment item within a ``SparkSegmentedControl``.
///
/// Use `SparkSegmentedControlItem` to define the content and appearance of each segment in a ``SparkSegmentedControl``.
/// Each segment item must have a unique tag value that identifies it.
///
/// ## Example of usage
///
/// ### With Text Only
///
/// ```swift
/// SparkSegmentedControlItem(tag: 1, text: "Day")
/// ```
///
/// ### With Icon Only
///
/// ```swift
/// SparkSegmentedControlItem(tag: 1, icon: Image(systemName: "house"))
/// ```
///
/// ### With Text and Icon
///
/// ```swift
/// SparkSegmentedControlItem(tag: 1, text: "Home", icon: Image(systemName: "house"))
/// ```
///
/// ### With Custom Label
///
/// ```swift
/// SparkSegmentedControlItem(tag: 1) {
///     HStack {
///         Image(systemName: "heart.fill")
///         Text("Favorite")
///     }
/// }
/// ```
///
public struct SparkSegmentedControlItem<Tag, Label>: View where Tag: Hashable, Label: View {

    // MARK: - Properties

    private let tag: Tag

    private let icon: Image?
    private let label: () -> Label

    @Environment(\.segmentedControlContext) private var context
    @Environment(\.segmentedControlItemTag) private var itemTag

    // MARK: - Initialization

    /// Creates a segment item with text and an optional icon.
    ///
    /// - Parameters:
    ///   - tag: A unique value that identifies this segment item.
    ///   - text: The text label for the segment item.
    ///   - icon: An optional icon image to display alongside the text.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkSegmentedControlItem(tag: 1, text: "Day", icon: Image(systemName: "sun.max"))
    /// ```
    ///
    /// ## Rendering
    ///
    /// | Text | Text and Icons |
    /// |:---:|:---:|
    /// | ![SegmentedControl rendering with text.](segmentedcontrol_texts.png) | ![SegmentedControl rendering with text and icons.](segmentedcontrol_icons_and_texts.png) |
    ///
    public init(
        tag: Tag,
        text: String,
        icon: Image? = nil
    ) where Label == Text {
        self.tag = tag
        self.icon = icon
        self.label = { Text(text) }
    }

    /// Creates a segment item with only an icon.
    ///
    /// - Parameters:
    ///   - tag: A unique value that identifies this segment item.
    ///   - icon: The icon image to display.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkSegmentedControlItem(tag: 1, icon: Image(systemName: "house"))
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![SegmentedControl rendering with icons.](segmentedcontrol_icons.png)
    ///
    public init(
        tag: Tag,
        icon: Image
    ) where Label == EmptyView {
        self.tag = tag
        self.icon = icon
        self.label = { EmptyView() }
    }

    /// Creates a segment item with a custom label.
    ///
    /// - Parameters:
    ///   - tag: A unique value that identifies this segment item.
    ///   - label: A view builder that creates the label content.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkSegmentedControlItem(tag: 1) {
    ///     Text("Custom Label")
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![SegmentedControl rendering with label.](segmentedcontrol_label.png)
    ///
    public init(
        tag: Tag,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.tag = tag
        self.icon = nil
        self.label = label
    }

    // MARK: - View

    public var body: some View {
        switch self.context {
        case .collecting:
            // Used only to collect the list of tags in SparkSegmentedControl
            Rectangle()
                .hidden()
                .preference(key: SegmentedControlTagsPreferenceKey.self, value: [AnyHashable(self.tag)])

        case .renderer:
            if self.isItem() {
                SparkSegmentedControlItemRenderer(
                    icon: self.icon,
                    label: self.label
                )
            } else {
                EmptyView()
            }

        case .accessibilityRenderer:
            if self.isItem() {
                SparkSegmentedControlItemAccessibilityRenderer(
                    icon: self.icon,
                    label: self.label
                )
            } else {
                EmptyView()
            }
        }
    }

    // MARK: - Methods

    private func isItem() -> Bool {
        self.itemTag?.base as? Tag == self.tag
    }
}
