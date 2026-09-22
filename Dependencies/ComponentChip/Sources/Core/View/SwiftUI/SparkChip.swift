//
//  SparkChip.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 24/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark Chip help users quickly recognize an important
/// information that has been entered by them, trigger actions,
/// make selections, or filter content.
///
/// The **Label** and **ExtraContent** can be a empty view.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     var theme: any Theme
///
///     var body: some View {
///         SparkChip(
///             "My Chip",
///             icon: .init("moon")
///         )
///         .sparkTheme(self.theme)
///         .sparkChipAlignment(.trailingIcon)
///         .sparkChipIntent(.main)
///         .sparkChipVariant(.filled)
///         .sparkIsSelected(true)
///         .disabled(true)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **chipAlignment** : ``sparkChipAlignment(_:)`` (View extension)
/// - **chipIntent** : ``sparkChipIntent(_:)`` (View extension)
/// - **chipVariant** : ``sparkChipVariant(_:)`` (View extension)
/// - **chipSize** : ``sparkChipSize(_:)`` (View extension)
/// - **isSelected** : ``sparkIsSelected(_:)`` (View extension)
/// - **isEnabled** : ``sparkChipAlignment(_:)`` (View extension)
///
/// *Note* : If theses values are not set, default values will be applied.
///
/// You can set theses EnvironmentValues directly after created like this :
/// ```swift
/// struct MyView: View {
///     var theme: any Theme
///
///     var body: some View {
///         SparkChip("My Chip")
///         .sparkTheme(self.theme)
///         .sparkChipAlignment(.trailingIcon)
///         .sparkChipIntent(.main)
///         .sparkChipVariant(.filled)
///         .sparkIsSelected(true)
///         .disabled(true)
///     }
/// }
/// ```
///
/// You can also set theses EnvironmentValues on the parent, all child chips will be automatically updated :
/// ```swift
/// struct MyView: View {
///     var theme: any Theme
///
///     var body: some View {
///         HStack {
///             SparkChip("My Chip")
///
///             SparkChip("My Chip 2")
///
///             // The .neutral intent will be set only for this chip.
///             SparkChip("My Chip 3")
///                 .sparkChipIntent(.neutral)
///         }
///         .sparkTheme(self.theme)
///         .sparkChipAlignment(.trailingIcon)
///         .sparkChipIntent(.main)
///         .sparkChipVariant(.filled)
///         .sparkIsSelected(true)
///         .disabled(true)
///     }
/// }
/// ```
///
/// ## Accessibility
///
/// - By default, the accessibility combine all children except the icon.
/// You can set an another ``accessibilityElement(children:)`` to override
/// the default value.
///
/// - By default the ``accessibilityShowsLargeContentViewer(_:)`` use the icon
/// and the text to diplay the large content.
/// You can set an another ``accessibilityShowsLargeContentViewer(_:)``to override
/// the default value.
///
/// ## Rendering
///
/// ### By Content Type
///
/// | Icon Only | Text Only | Text & Icon |
/// |:---:|:---:|:---:|
/// | ![Chip with icon.](chip_with_icon.png) | ![Chip with text.](chip_with_text.png) | ![Chip with text and icon.](chip_with_text_and_icon.png) |
///
/// | Text & Icon & Extra | Icon & Extra |
/// |:---:|:---:|
/// | ![Chip with text, icon and extra content.](chip_with_text_and_icon_and_extra_content.png) | ![Chip with icon and extra content.](chip_with_icon_and_extra_content.png) |
///
/// ### By Size
///
/// | Medium | Large |
/// |:---:|:---:|
/// | ![Chip medium size.](chip_with_size_medium.png) | ![Chip large size.](chip_with_size_large.png) |
///
/// ### By State
///
/// | Not Selected | Selected | Disabled |
/// |:---:|:---:|:---:|
/// | ![Chip not selected.](chip_with_text.png) | ![Chip selected.](chip_selected.png) | ![Chip disabled.](chip_disabled.png) |
///
public struct SparkChip<Label, ExtraContent>: View where Label: View, ExtraContent: View {

    // MARK: - Properties

    private let icon: Image?
    private let label: () -> Label
    private let extraContent: () -> ExtraContent
    private var action: (() -> Void)?

    @Environment(\.theme) private var theme
    @Environment(\.chipAlignment) private var alignment
    @Environment(\.chipIntent) private var intent
    @Environment(\.chipVariant) private var variant
    @Environment(\.chipSize) private var size
    @Environment(\.isSelected) private var isSelected
    @Environment(\.isEnabled) private var isEnabled

    @StateObject private var viewModel = ChipViewModel()

    @State private var feedbackID: UUID = UUID()

    // MARK: - Initialization

    /// Init with a Label and an Extra Content.
    ///
    /// - Parameters:
    ///   - icon: The icon of the chip. *Optional*. Default is *nil*.
    ///   - action: The action of the chip. *Optional*. Default is *nil*.
    ///   - extraContent: The extra content of the chip.
    ///   - label: The content label of the chip.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     var theme: any Theme
    ///
    ///     var body: some View {
    ///         SparkChip(
    ///             icon: .init("moon"),
    ///             action: { // Your action },
    ///             label: {
    ///                 HStack {
    ///                     Text("Welcome")
    ///                     Text("on Spark's Chip")
    ///                         .foregroundColor(.blue)
    ///                 }
    ///             },
    ///             extraContent: {
    ///                 Text("99")
    ///                     .font(.body)
    ///                     .bold()
    ///                     .foregroundStyle(.red)
    ///                     .padding(4)
    ///                     .background(.yellow)
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkChipAlignment(.trailingIcon)
    ///         .sparkChipIntent(.main)
    ///         .sparkChipVariant(.filled)
    ///         .sparkIsSelected(true)
    ///         .disabled(true)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![Component rendering.](chip_with_text_and_icon_and_extra_content.png)
    ///
    public init(
        icon: Image? = nil,
        action: (() -> Void)? = nil,
        @ViewBuilder label: @escaping () -> Label,
        @ViewBuilder extraContent: @escaping () -> ExtraContent
    ) {
        self.action = action
        self.icon = icon
        self.label = label
        self.extraContent = extraContent
    }

    // MARK: - View

    public var body: some View {
        if let action {
            Button(action: {
                action()
                self.feedbackID = .init()
            }, label: self.content)
                .buttonStyle(PressedButtonStyle(isPressed: self.$viewModel.isPressed))
        } else {
            self.content()
        }
    }

    private func content() -> some View {
        ReversibleHStack(
            spacing: self.viewModel.layout.spacing,
            content1: {
                self.labelContent()
            },
            content2: {
                self.icon?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .accessibilityIdentifier(ChipAccessibilityIdentifier.icon)
                    .sparkFrame(
                        size: self.viewModel.sizes.iconSize,
                        relativeTo: .title2
                    )
                    .foregroundStyle(self.viewModel.colors.content)
                    .accessibilityHidden(true)
            }
        )
        .isReversed(self.viewModel.isReversed)
        .sparkPadding(.horizontal, self.viewModel.layout.padding)
        .sparkFrame(height: self.viewModel.sizes.height)
        .background(self.viewModel.colors.background)
        .sparkBorder(
            width: self.viewModel.border.width,
            radius: self.viewModel.border.radius,
            dash: self.viewModel.border.dash,
            colorToken: self.viewModel.colors.border
        )
        .opacity(self.viewModel.dim)
        .sparkSensoryFeedback(.selection, trigger: self.feedbackID)
        .accessibilityIdentifier(ChipAccessibilityIdentifier.view)
        .accessibilityShowsLargeContentViewer {
            // Only two can be displayed, the extra content
            // can't automatically parsed to be an image or a text.
            self.icon
            self.label()
        }
        .accessibilityAddTraits(.isSelected, condition: self.isSelected)
        .accessibilityElement(children: .combine)
        .dynamicTypeSize(...DynamicTypeSize.accessibility3)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                alignment: self.alignment,
                intent: self.intent,
                variant: self.variant,
                size: self.size,
                isSelected: self.isSelected,
                isEnabled: self.isEnabled
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.alignment) { alignment in
            self.viewModel.alignment = alignment
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.variant) { variant in
            self.viewModel.variant = variant
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
        .onChange(of: self.isSelected) { isSelected in
            self.viewModel.isSelected = isSelected
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
    }

    @ViewBuilder
    private func labelContent() -> some View {
        if !(self.label() is EmptyView && self.extraContent() is EmptyView) {
            SparkHStack(spacing: self.viewModel.layout.extraContentSpacing) {
                self.label()
                    .foregroundStyle(self.viewModel.colors.content)
                    .font(self.viewModel.titleFont)

                self.extraContent()
                    .dynamicTypeSize(...DynamicTypeSize.accessibility1)
            }
        } else {
            EmptyView()
        }
    }
}
