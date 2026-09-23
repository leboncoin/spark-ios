//
//  SparkTextLink.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A textlink is a reference to a resource.
///
/// It can be external (e.g. a different web page) or internal (e.g. a specific element in the current page).
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTextLink(
///             "My TextLink",
///             image: Image(systemName: "pencil"),
///             action: {
///                 // Your action
///             }
///         )
///         .sparkTheme(self.theme)
///         .sparkTextLinkAlignment(.leadingImage)
///         .sparkTextLinkHighlightRange(NSRange(location: 0, length: 2))
///         .sparkTextLinkIntent(.main)
///         .sparkTextLinkTypography(.callout)
///         .sparkTextLinkVariant(.underline)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **alignment**: ``sparkTextLinkAlignment(_:)``(View extension)
/// - **highlightRange**: ``sparkTextLinkHighlightRange(_:)``(View extension)
/// - **intent**: ``sparkTextLinkIntent(_:)``(View extension)
/// - **typography**: ``sparkTextLinkTypography(_:)``(View extension)
/// - **variant**: ``sparkTextLinkVariant(_:)``(View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Other Properties
///
/// You can also define a number of line and the alignement of the text like this :
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTextLink(
///             "My TextLink",
///             image: Image(systemName: "pencil"),
///             action: {
///                 // Your action
///             }
///         )
///         .multilineTextAlignment(.leading)
///         .lineLimit(2)
///     }
/// }
/// ```
///
/// ## Accessibility
///
/// By default, the **accessibilityLabel** is equals to the text.
/// To override this value, you need to set a new **accessibilityLabel**.
///
/// The image is not accessible.
///
/// ## Rendering
///
/// - With image:
/// ![TextLink rendering.](textlink_with_image.png)
///
/// - Without image:
/// ![TextLink rendering.](textlink_without_image.png)
///
/// - With a long text:
/// ![TextLink rendering.](textlink_with_long_text.png)
///
public struct SparkTextLink: View {

    // MARK: - Properties

    private let text: String
    private let image: Image?

    @Environment(\.theme) private var theme
    @Environment(\.textLinkAlignment) private var alignment
    @Environment(\.textLinkHighlightRange) private var highlightRange
    @Environment(\.textLinkIntent) private var intent
    @Environment(\.textLinkTypography) private var typography
    @Environment(\.textLinkVariant) private var variant

    @StateObject private var viewModel = TextLinkViewModel()

    private var action: () -> Void

    @Environment(\.sizeCategory) var sizeCategory

    @State private var feedbackID: UUID = UUID()

    // MARK: - Initialization

    /// Create a textlink with an image.
    ///
    /// - Parameters:
    ///   - text: The text. Use also in the *accessibilityLabel*.
    ///   - image: The image.
    ///   - action: The action on tap.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTextLink(
    ///             "My TextLink",
    ///             image: Image(systemName: "pencil"),
    ///             action: {
    ///                 // Your action
    ///             }
    ///         )
    ///         .sparkTheme(self.theme)
    ///         .sparkTextLinkAlignment(.leadingImage)
    ///         .sparkTextLinkHighlightRange(NSRange(location: 0, length: 2))
    ///         .sparkTextLinkIntent(.main)
    ///         .sparkTextLinkTypography(.callout)
    ///         .sparkTextLinkVariant(.underline)
    ///     }
    /// }
    /// ```
    ///
    /// ## Rendering
    ///
    /// ![TextLink rendering.](textlink_with_image.png)
    public init(
        _ text: String,
        image: Image? = nil,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.image = image
        self.action = action
    }

    // MARK: - View

    public var body: some View {
        Button(action: {
            self.action()
            self.feedbackID = .init()
        }) {
            self.content()
        }
        .buttonStyle(PressedButtonStyle(
            isPressed: self.$viewModel.isHighlighted,
            animationDuration: TextLinkConstants.animationDuration
        ))
        .overlay {
            VStack {
                if self.viewModel.isHighlighted {
                    GeometryReader { proxy in
                        RoundedRectangle(cornerRadius: self.viewModel.hoverStyle.cornerRadius)
                            .path(in: .init(
                                origin: .init(
                                    x: -self.viewModel.hoverStyle.horizontalPadding,
                                    y: -self.viewModel.hoverStyle.verticalPadding
                                ),
                                size: .init(
                                    width: proxy.size.width + self.viewModel.hoverStyle.horizontalPadding * 2,
                                    height: proxy.size.height + self.viewModel.hoverStyle.verticalPadding * 2
                                )
                            ))
                            .fill(self.viewModel.hoverStyle.backgroundColor)
                            .opacity(self.viewModel.hoverStyle.dim)
                    }
                } else {
                    EmptyView()
                }
            }
            .optionalAnimation(
                .easeOut(duration: TextLinkConstants.animationDuration),
                value: self.viewModel.isHighlighted
            )
        }
        .accessibilityIdentifier(TextLinkAccessibilityIdentifier.view)
        .accessibilityLabel(self.text)
        .accessibilityRemoveTraits(.isButton)
        .accessibilityAddTraits(.isLink)
        .accessibilityShowsLargeContentViewer()
        .sparkSensoryFeedback(.selection, trigger: self.feedbackID)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                intent: self.intent,
                text: self.text,
                textHighlightRange: self.highlightRange.value,
                typography: self.typography,
                variant: self.variant
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = self.theme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.text) { text in
            self.viewModel.text = text
        }
        .onChange(of: self.highlightRange) { highlightRange in
            self.viewModel.textHighlightRange = highlightRange.value
        }
        .onChange(of: self.typography) { typography in
            self.viewModel.typography = typography
        }
        .onChange(of: self.variant) { variant in
            self.viewModel.variant = variant
        }
    }

    // MARK: - View Builder

    @ViewBuilder
    private func content() -> some View {
        SparkHStack(
            alignment: .top,
            spacing: self.viewModel.spacing
        ) {
            if self.alignment.isTrailingImage {
                self.textView()
                self.imageView()
            } else {
                self.imageView()
                self.textView()
            }
        }
        .opacity(self.viewModel.dim)
    }

    @ViewBuilder
    private func imageView() -> some View {
        self.image?
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(
                width: self.viewModel.imageSize.size,
                height: self.viewModel.imageSize.size,
                alignment: .center
            )
            .padding(.init(
                vertical: self.viewModel.imageSize.padding,
                horizontal: .zero
            ))
            .foregroundStyle(self.viewModel.imageColor)
            .accessibilityIdentifier(TextLinkAccessibilityIdentifier.image)
            .accessibilityHidden(true)
    }

    @ViewBuilder
    private func textView() -> some View {
        Text(self.viewModel.attributedString)
        .accessibilityIdentifier(TextLinkAccessibilityIdentifier.text)
        .onChange(of: self.sizeCategory) { _ in
            self.viewModel.contentSizeCategoryDidUpdate()
        }
    }
}
