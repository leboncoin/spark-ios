//
//  SparkDivider.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 13/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

/// The Divider component provides a thin, unobtrusive line that separates
/// and distinguishes sections of content to reinforce visual hierarchy.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkDivider("My text Key")
///         .sparkTheme(self.theme)
///         .sparkDividerAlignment(.bottom)
///         .sparkDividerAxis(.vertical)
///         .sparkDividerIntent(.outline)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **dividerAlignment** : ``sparkDividerAlignment(_:)`` (View extension)
/// - **dividerAxis** : ``sparkDividerAxis(_:)`` (View extension)
/// - **dividerIntent** : ``sparkDividerIntent(_:)`` (View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// If there is not text, the component is not accessible,
/// in other case, the accessibilityLabel is equals to the content of the label.
///
/// To override this value, you need to set a new **accessibilityLabel**.
///
/// ## Rendering
///
/// Without a text:
///
/// ![Divider rendering.](divider_without_text.png)
///
/// With a text:
///
/// ![Divider rendering.](divider_with_text.png)
///
/// Axis:
///
/// ![Divider rendering.](divider_axis_horizontal.png)
///
/// ![Divider rendering.](divider_axis_vertical.png)
///
/// Alignment:
///
/// ![Divider rendering.](divider_alignment_top.png)
///
/// ![Divider rendering.](divider_alignment_trailing.png)
///
/// Intents:
///
/// ![Divider rendering.](divider_intent_outline.png)
///
/// ![Divider rendering.](divider_intent_outlineHigh.png)
///
public struct SparkDivider<Label>: View where Label: View {

    // MARK: - Properties

    let label: () -> Label

    @Environment(\.theme) private var theme
    @Environment(\.dividerAlignment) private var alignment
    @Environment(\.dividerAxis) private var axis
    @Environment(\.dividerIntent) private var intent

    @StateObject private var viewModel = DividerViewModel()

    // MARK: - Initialization

    /// Create a divider without text.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkDivider()
    ///         .sparkTheme(self.theme)
    ///         .sparkDividerAlignment(.bottom)
    ///         .sparkDividerAxis(.vertical)
    ///         .sparkDividerIntent(.outline)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Divider rendering.](divider_with_text.png)
    public init() where Label == EmptyView {
        self.label = { EmptyView() }
    }

    /// Create a divider with a localized text.
    ///
    /// - Parameters:
    ///   - textKey: The localized text key.
    ///   The position depends of the ``DividerAlignment`` value.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkDivider("My text Key")
    ///         .sparkTheme(self.theme)
    ///         .sparkDividerAlignment(.bottom)
    ///         .sparkDividerAxis(.vertical)
    ///         .sparkDividerIntent(.outline)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Divider rendering.](divider_with_text.png)
    public init(_ textKey: LocalizedStringKey) where Label == Text {
        self.label = { Text(textKey) }
    }

    /// Create a divider with a text.
    ///
    /// - Parameters:
    ///   - text: The text.
    ///   The position depends of the ``DividerAlignment`` value.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkDivider("My text")
    ///         .sparkTheme(self.theme)
    ///         .sparkDividerAlignment(.bottom)
    ///         .sparkDividerAxis(.vertical)
    ///         .sparkDividerIntent(.outline)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Divider rendering.](divider_with_text.png)
    public init(_ text: String) where Label == Text {
        self.label = { Text(text) }
    }

    /// Create a divider with a label.
    ///
    /// - Parameters:
    ///   - label: The content text.
    ///   The position depends of the ``DividerAlignment`` value.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkDivider(
    ///             label: {
    ///                 HStack {
    ///                     Text("My")
    ///                     Text("text")
    ///                         .foregroundColor(.blue)
    ///                 }
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkDividerAlignment(.bottom)
    ///         .sparkDividerAxis(.vertical)
    ///         .sparkDividerIntent(.outline)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Divider rendering.](divider_with_label.png)
    public init(@ViewBuilder label: @escaping () -> Label) {
        self.label = label
    }

    // MARK: - View

    public var body: some View {
        self.contentStack {
            if (self.label() is EmptyView) {

                // Separator only
                self.separator()
                    .frame(axis: self.axis)

            } else {

                // Separator (top or leading)
                self.separator()
                    .frame(
                        axis: self.axis,
                        widthType: self.viewModel.separatorWidthTypes.first
                    )

                // Label
                self.label()
                    .foregroundStyle(self.viewModel.colors.text)
                    .font(self.viewModel.textFont.font)
                    .accessibilityIdentifier(DividerAccessibilityIdentifier.label)
                    .layoutPriority(2)

                // Separator (bottom or trailing)
                self.separator()
                    .frame(
                        axis: self.axis,
                        widthType: self.viewModel.separatorWidthTypes.last
                    )
            }
        }
        .accessibilityIdentifier(DividerAccessibilityIdentifier.view)
        .accessibilityElement(children: .combine)
        .dynamicTypeSize(...DynamicTypeSize.accessibility3)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                alignment: self.alignment,
                axis: self.axis,
                intent: self.intent
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = self.theme.value
        }
        .onChange(of: self.alignment) { alignment in
            self.viewModel.alignment = alignment
        }
        .onChange(of: self.axis) { axis in
            self.viewModel.axis = axis
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
    }

    // MARK: - Private Modifier

    private func separator() -> some View {
        self.viewModel.colors.separator.color
            .accessibilityHidden(true)
    }

    @ViewBuilder
    private func contentStack<Content>(
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content: View {
        switch self.axis {
        case .horizontal:
            HStack(
                spacing: self.viewModel.spacing,
                content: content
            )
        case .vertical:
            VStack(
                spacing: self.viewModel.spacing,
                content: content
            )
        }
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func frame(axis: DividerAxis, widthType: DividerSeparatorWidthType? = nil) -> some View {
        switch axis {
        case .horizontal:
            self.sparkFrame(
                width: widthType?.isFixed == true ? DividerConstants.minimumWidth : nil,
                height: DividerConstants.thickness
            )
            .sparkFrame(minWidth: DividerConstants.minimumWidth)
        case .vertical:
            self.sparkFrame(
                width: DividerConstants.thickness,
                height: widthType?.isFixed == true ? DividerConstants.minimumWidth : nil
            )
            .sparkFrame(minHeight: DividerConstants.minimumWidth)
        }
    }
}
