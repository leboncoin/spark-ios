//
//  SparkButton.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 24/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkComponentSpinner

/// Spark Buttons are clickable elements used to trigger actions.
///
/// Buttons communicate calls to action to the user and allow users
/// to interact with pages in a variety of ways.
/// Button labels express what action will occur when the user interacts with it.
///
/// ## Example of usage
///
/// ### Text Only Button
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkButton("Click Me") {
///             // Your action
///         }
///         .sparkTheme(self.theme)
///         .sparkButtonIntent(.main)
///         .sparkButtonVariant(.filled)
///         .sparkButtonSize(.medium)
///     }
/// }
/// ```
///
/// ### Button with Icon
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkButton(
///             "Save",
///             image: Image(systemName: "checkmark")
///         ) {
///             // Your action
///         }
///         .sparkTheme(self.theme)
///         .sparkButtonIntent(.support)
///         .sparkButtonVariant(.outlined)
///         .sparkButtonSize(.medium)
///         .sparkButtonAlignment(.leadingImage)
///     }
/// }
/// ```
///
/// ### Icon Only Button
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkButton(Image(systemName: "heart.fill")) {
///             // Your action
///         }
///         .sparkTheme(self.theme)
///         .sparkButtonIntent(.support)
///         .sparkButtonVariant(.ghost)
///         .sparkButtonSize(.small)
///     }
/// }
/// ```
///
/// ### Custom Label Button
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkButton(action: {
///             // Your action
///         }) {
///             VStack {
///                 Text("Custom")
///                 Text("Label")
///             }
///         }
///         .sparkTheme(self.theme)
///         .sparkButtonIntent(.main)
///         .sparkButtonVariant(.tinted)
///         .sparkButtonSize(.large)
///     }
/// }
/// ```
///
/// ### Loading State
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var isLoading = false
///
///     var body: some View {
///         SparkButton("Submit") {
///             self.isLoading = true
///             // Perform async operation
///         }
///         .sparkTheme(self.theme)
///         .sparkButtonIntent(.main)
///         .sparkButtonVariant(.filled)
///         .sparkButtonIsLoading(self.isLoading)
///     }
/// }
/// ```
///
/// ### Max width State
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///     @State private var isLoading = false
///
///     var body: some View {
///         SparkButton("Share") {
///             // Your action
///          }
///         .sparkTheme(self.theme)
///         .sparkButtonMaxWidth(.infinity)
///     }
/// }
/// ```
///
/// ## Menu
///
/// Button can also be a native **menu** :
///
/// ```swift
/// SparkButton("Options") {
///     Button("Edit") { }
///     Button("Delete") { }
///     Button("Share") { }
/// }
/// .sparkTheme(self.theme)
/// .sparkButtonIntent(.main)
/// ```
///
/// ## EnvironmentValues
///
/// This component uses some EnvironmentValues:
/// - **theme**: ``sparkTheme(_:)`` (View extension)
/// - **intent**: ``sparkButtonIntent(_:)`` (View extension)
/// - **variant**: ``sparkButtonVariant(_:)`` (View extension)
/// - **shape**: ``sparkButtonShape(_:)`` (View extension)
/// - **size**: ``sparkButtonSize(_:)`` (View extension)
/// - **alignment**: ``sparkButtonAlignment(_:)`` (View extension)
/// - **contentVisibility**: ``sparkButtonContentVisibility(_:)`` (View extension)
/// - **hasFeedback**: ``sparkButtonHasFeedback(_:)`` (View extension)
/// - **isLoading**: ``sparkButtonIsLoading(_:)`` (View extension)
/// - **maxWidth**: ``sparkButtonMaxWidth(_:)`` (View extension)
/// - **removeStyles**: ``sparkButtonRemoveStyles(_:)`` (View extension)
///
/// > If these values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// SparkButton automatically supports:
/// - VoiceOver with proper button traits
/// - Dynamic Type up to xxxLarge
/// - Large Content Viewer for accessibility
/// - Haptic feedback on button press
///
/// If you only provide a image, you must set the **accessibilityLabel**.
///
/// ## Rendering
///
/// ### Title
///
/// ![Button rendering.](button_title.png)
///
/// ### Icon only
///
/// ![Button rendering.](button_icon.png)
///
/// ### All content (image + title)
///
/// ![Button rendering.](button_all.png)
///
public struct SparkButton<Label, ImageLabel, Content>: View where Label: View, ImageLabel: View, Content: View {

    // MARK: - Properties

    private var image: () -> ImageLabel
    private var label: () -> Label
    private var content: () -> Content
    private var role: ButtonRole?
    private var action: (() -> Void)?

    @Environment(\.theme) private var theme
    @Environment(\.buttonAlignment) private var alignment
    @Environment(\.buttonContentVisibility) private var contentVisibility
    @Environment(\.buttonHasFeedback) private var hasFeedback
    @Environment(\.buttonAppearance) private var appearance
    @Environment(\.buttonIntent) private var intent
    @Environment(\.buttonIsLoading) private var isLoading
    @Environment(\.buttonMaxWidth) private var maxWidth
    @Environment(\.buttonRemoveStyles) private var removeStyles
    @Environment(\.buttonShape) private var shape
    @Environment(\.buttonSize) private var size
    @Environment(\.buttonVariant) private var variant
    @Environment(\.isEnabled) private var isEnabled

    private let type: ButtonType

    @StateObject private var viewModel = ButtonViewModel()

    @State private var feedbackID: UUID = UUID()

    // MARK: - Initialization

    init(
        type: ButtonType,
        role: ButtonRole? = nil,
        action: @escaping @MainActor () -> Void,
        label: @escaping () -> Label,
        image: @escaping () -> ImageLabel
    ) where Content == EmptyView {
        self.type = type
        self.role = role
        self.action = action
        self.label = label
        self.image = image
        self.content = { EmptyView() }
    }

    init(
        type: ButtonType,
        label: @escaping () -> Label,
        image: @escaping () -> ImageLabel,
        content: @escaping () -> Content
    ) {
        self.type = type
        self.role = nil
        self.action = nil
        self.label = label
        self.image = image
        self.content = content
    }

    // MARK: - View

    public var body: some View {
        self.button {
            SparkHStack(spacing: self.viewModel.layout.horizontalSpacing) {
                // Loading
                if self.isLoading {
                    SparkSpinner()
                        .sparkSpinnerSize(.onButton)
                        .sparkSpinnerIntent(.custom(self.viewModel.colors.tintColor))
                }

                // Content
                if self.viewModel.showContent {
                     self.buttonContent()
                }
            }
            .sparkPadding(.horizontal, self.viewModel.layout.horizontalPadding)
            .sparkFrame(
                width: self.viewModel.sizes.isFixedWidth ? self.viewModel.sizes.width : nil,
                height: self.viewModel.sizes.isFixedHeight ? self.viewModel.sizes.height : nil
            )
            .sparkFrame(minWidth: self.viewModel.sizes.width)
            .frame(maxWidth: self.viewModel.sizes.isFixedWidth ? nil : self.maxWidth)
            .frame(maxHeight: self.viewModel.sizes.maxHeight)
            .background(self.viewModel.colors.backgroundColor)
            .contentShape(Rectangle())
            .sparkBorder(
                width: self.viewModel.border.width,
                radius: self.viewModel.border.radius,
                colorToken: self.viewModel.colors.borderColor
            )
        }
        .buttonStyle(PressedButtonStyle(
            isPressed: self.$viewModel.isPressed
        ))
        .opacity(self.viewModel.dim)
        .sparkSensoryFeedback(.impact, trigger: self.feedbackID)
        .accessibilityIdentifier(ButtonAccessibilityIdentifier.button)
        .accessibilityShowsLargeContentViewer() {
            self.image()
            self.label()
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
        .sparkVisualIdentification()
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                appearance: self.appearance,
                intent: self.intent,
                variant: self.variant,
                shape: self.shape,
                size: self.size,
                type: self.type,
                contentVisibility: self.contentVisibility,
                removeStyles: self.removeStyles,
                isEnabled: self.isEnabled,
                isLoading: self.isLoading
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.appearance) { appearance in
            self.viewModel.appearance = appearance
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.variant) { variant in
            self.viewModel.variant = variant
        }
        .onChange(of: self.shape) { shape in
            self.viewModel.shape = shape
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
        .onChange(of: self.contentVisibility) { contentVisibility in
            self.viewModel.contentVisibility = contentVisibility
        }
        .onChange(of: self.removeStyles) { removeStyles in
            self.viewModel.removeStyles = removeStyles
        }
        .onChange(of: self.type) { type in
            self.viewModel.type = type
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
        .onChange(of: self.isLoading) { isLoading in
            self.viewModel.isLoading = isLoading
        }
    }

    @ViewBuilder
    private func button<V>(@ViewBuilder label: @escaping () -> V) -> some View where V: View {
        if self.content().isEmptyView {
            Button(
                role: self.role,
                action: {
                    self.action?()

                    // Play feedback only
                    if self.hasFeedback {
                        self.feedbackID = .init()
                    }
                },
                label: label
            )
        } else {
            Menu(
                content: self.content,
                label: label
            )
        }
    }

    @ViewBuilder
    private func buttonContent() -> some View {
        let image = self.image()
            .sparkFrame(
                size: self.viewModel.sizes.imageSize,
                alignment: .center
            )
            .foregroundStyle(self.viewModel.colors.iconColor)

        let label = self.label()
            .foregroundStyle(self.viewModel.colors.tintColor)
            .font(self.viewModel.titleFontToken)
            .transition(
                .move(edge: self.alignment.isTrailingImage ? .leading : .trailing)
                .combined(with: .opacity)
            )
            .fixedSize()

        // Display the content from the current visibility
        // and the position.
        if self.alignment.isTrailingImage {
            if self.contentVisibility.showLabel {
                label
            }

            if self.contentVisibility.showImage {
                image
            }

        } else {
            if self.contentVisibility.showImage {
                image
            }

            if self.contentVisibility.showLabel {
                label
            }
        }
    }
}
