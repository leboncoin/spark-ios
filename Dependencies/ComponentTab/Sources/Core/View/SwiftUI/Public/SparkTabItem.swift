//
//  SparkTabItem.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 24/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

/// A single tab item within a ``SparkTab``.
///
/// Use `SparkTabItem` to define the content and appearance of each tab in a ``SparkTab``.
/// Each tab item must have a unique tag value that identifies it.
///
/// ## Example of usage
///
/// ### With Text Only
///
/// ```swift
/// SparkTabItem(tag: 1, text: "Home")
/// ```
///
/// ### With Icon Only
///
/// ```swift
/// SparkTabItem(tag: 1, icon: Image(systemName: "house"))
/// ```
///
/// ### With Text and Icon
///
/// ```swift
/// SparkTabItem(tag: 1, text: "Home", icon: Image(systemName: "house"))
/// ```
///
/// ### With Extra Label
///
/// ```swift
/// SparkTabItem(tag: 1, text: "Messages", icon: Image(systemName: "message")) {
///     Text("99+")
/// }
/// ```
///
public struct SparkTabItem<Tag, Label, ExtraLabel>: View where Tag: Hashable, Label: View, ExtraLabel: View {

    // MARK: - Properties

    private let tag: Tag

    private let icon: Image?
    private let label: () -> Label
    private let extraLabel: () -> ExtraLabel

    @Environment(\.tabContext) private var context
    @Environment(\.tabItemTag) private var itemTag

    // MARK: - Initialization

    /// Creates a tab item with text and an optional icon.
    ///
    /// - Parameters:
    ///   - tag: A unique value that identifies this tab item.
    ///   - text: The text label for the tab item.
    ///   - icon: An optional icon image to display alongside the text.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkTabItem(tag: 1, text: "Home", icon: Image(systemName: "house"))
    /// ```
    ///
    public init(
        tag: Tag,
        text: String,
        icon: Image? = nil
    ) where Label == Text, ExtraLabel == EmptyView {
        self.tag = tag
        self.icon = icon
        self.label = { Text(text) }
        self.extraLabel = { EmptyView() }
    }

    /// Creates a tab item with text, an optional icon, and an extra label.
    ///
    /// The extra label can be used to display additional information like badges or notifications.
    ///
    /// - Parameters:
    ///   - tag: A unique value that identifies this tab item.
    ///   - text: The text label for the tab item.
    ///   - icon: An optional icon image to display alongside the text.
    ///   - extraLabel: A view builder that creates the extra label content.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkTabItem(tag: 1, text: "Messages", icon: Image(systemName: "message")) {
    ///     Text("99+")
    /// }
    /// ```
    ///
    public init(
        tag: Tag,
        text: String,
        icon: Image? = nil,
        @ViewBuilder extraLabel: @escaping () -> ExtraLabel
    ) where Label == Text {
        self.tag = tag
        self.icon = icon
        self.label = { Text(text) }
        self.extraLabel = extraLabel
    }

    /// Creates a tab item with only an icon.
    ///
    /// - Parameters:
    ///   - tag: A unique value that identifies this tab item.
    ///   - icon: The icon image to display.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkTabItem(tag: 1, icon: Image(systemName: "house"))
    /// ```
    ///
    public init(
        tag: Tag,
        icon: Image
    ) where Label == EmptyView, ExtraLabel == EmptyView {
        self.tag = tag
        self.icon = icon
        self.label = { EmptyView() }
        self.extraLabel = { EmptyView() }
    }

    /// Creates a tab item with a custom label and an optional icon.
    ///
    /// - Parameters:
    ///   - tag: A unique value that identifies this tab item.
    ///   - icon: An optional icon image to display alongside the label.
    ///   - label: A view builder that creates the label content.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkTabItem(tag: 1, icon: Image(systemName: "house")) {
    ///     Text("Custom Label")
    /// }
    /// ```
    ///
    public init(
        tag: Tag,
        icon: Image? = nil,
        @ViewBuilder label: @escaping () -> Label
    ) where ExtraLabel == EmptyView  {
        self.tag = tag
        self.icon = icon
        self.label = label
        self.extraLabel = { EmptyView() }
    }

    /// Creates a tab item with a custom label, an optional icon, and an extra label.
    ///
    /// - Parameters:
    ///   - tag: A unique value that identifies this tab item.
    ///   - icon: An optional icon image to display alongside the label.
    ///   - label: A view builder that creates the main label content.
    ///   - extraLabel: A view builder that creates the extra label content.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkTabItem(tag: 1, icon: Image(systemName: "message")) {
    ///     Text("Messages")
    /// } extraLabel: {
    ///     Text("99+")
    /// }
    /// ```
    ///
    public init(
        tag: Tag,
        icon: Image? = nil,
        @ViewBuilder label: @escaping () -> Label,
        @ViewBuilder extraLabel: @escaping () -> ExtraLabel
    ) {
        self.tag = tag
        self.icon = nil
        self.label = label
        self.extraLabel = extraLabel
    }

    // MARK: - View

    public var body: some View {
        switch self.context {
        case .collecting:
            // Used only to collecte the list of tag on SparkTab
            Rectangle()
                .hidden()
                .preference(key: TabTagsPreferenceKey.self, value: [AnyHashable(self.tag)])

        case .renderer:
            if self.isItem() {
                SparkTabItemRenderer(
                    icon: self.icon,
                    label: self.label,
                    extraLabel: self.extraLabel
                )
            } else {
                EmptyView()
            }

        case .accessibilityRenderer:
            if self.isItem() {
                SparkTabItemAccessibilityRenderer(
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
