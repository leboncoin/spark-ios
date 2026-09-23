//
//  SparkCard.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

/// A cards display content and actions about a single subject.
///
/// A card is a block that groups related info (text, image, button). It helps show content clearly, compactly, and in a scannable way.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkCard(
///             content: {
///                 VStack(alignment: .leading) {
///                     HStack {
///                         Image(systemName: "info.circle")
///                         Text("Welcome on Card")
///                     }
///
///                     Text("Nam eu sapien finibus, auctor purusan varius, sagittis turpis. Sed ipsum elit, lacinia id porta ut, bibendum at risus.")
///                         .multilineTextAlignment(.leading)
///                 }
///             }
///             action: {
///                 // Your optional action
///             }
///         )
///         .sparkTheme(self.theme)
///         .sparkCardIntent(.success)
///         .sparkCardIsHighlighted(true)
///         .sparkCardIsPadding(true)
///         .sparkCardVariant(.tinted)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component use some EnvironmentValues :
/// - **theme** : ``sparkTheme(_:)`` (View extension)
/// - **intent**: ``sparkCardIntent(_:)``(View extension)
/// - **isHighlighted**: ``sparkCardIsHighlighted(_:)``(View extension)
/// - **isPadding**: ``sparkCardIsPadding(_:)``(View extension)
/// - **variant**: ``sparkCardVariant(_:)``(View extension)
///
/// > If theses values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// You need to manage yourself the accessibility of the component because Spark doesn't know the context of the content.
///
/// If an action is provided, the card will be treated as a button.
///
/// ## Rendering
///
/// ### Header
///
/// | Default | Is highlighted |
/// |:---:|:---:|
/// | ![Default](card_classic.png) | ![is highlight](card_with_highlight.png) |
///
/// ### With Header
///
/// | Banner | Border |
/// |:---:|:---:|
/// | ![Banner header](card_with_banner_header.png) | ![Border header](card_with_border_header.png) |
///
public struct SparkCard<Content, Header>: View where Content: View, Header: View {

    // MARK: - Properties

    private let content: () -> Content
    private let isHeader: Bool
    private let header: () -> Header
    private var action: (() -> Void)?

    @Environment(\.theme) private var theme
    @Environment(\.cardIntent) private var intent
    @Environment(\.cardIsHighlighted) private var isHighlighted
    @Environment(\.cardPadding) private var padding
    @Environment(\.cardVariant) private var variant
    @Environment(\.cardHeaderPosition) private var headerPosition
    @Environment(\.isEnabled) private var isEnabled

    @StateObject private var viewModel = CardViewModel()

    @State private var feedbackID: UUID = UUID()
    @State var borderHeaderSize: CGSize = .zero

    // MARK: - Initialization

    init(
        isHeader: Bool,
        @ViewBuilder header: @escaping () -> Header,
        @ViewBuilder content: @escaping () -> Content,
        action: (() -> Void)? = nil
    ) {
        self.isHeader = isHeader
        self.header = header
        self.content = content
        self.action = action
    }

    // MARK: - View

    public var body: some View {
        Group {
            if let action {
                Button(action: {
                    action()
                    self.feedbackID = .init()
                }, label: self.mainContent)
                .buttonStyle(PressedButtonStyle(isPressed: self.$viewModel.isPressed))
            } else {
                self.mainContent()
            }
        }
        .accessibilityIdentifier(CardAccessibilityIdentifier.view)
        .accessibilityElement(children: .contain)
        .sparkSensoryFeedback(.selection, trigger: self.feedbackID)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme.value,
                intent: self.intent,
                isEnabled: self.isEnabled,
                padding: self.padding,
                variant: self.variant,
                isHeader: self.isHeader,
                headerPosition: self.headerPosition
            )
        }
        .onChange(of: self.theme) { theme in
            self.viewModel.theme = theme.value
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.isEnabled) { isEnabled in
            self.viewModel.isEnabled = isEnabled
        }
        .onChange(of: self.padding) { padding in
            self.viewModel.padding = padding
        }
        .onChange(of: self.variant) { variant in
            self.viewModel.variant = variant
        }
        .onChange(of: self.isHeader) { isHeader in
            self.viewModel.isHeader = isHeader
        }
        .onChange(of: self.headerPosition) { headerPosition in
            self.viewModel.headerPosition = headerPosition
        }
    }

    private func mainContent() -> some View {
        VStack(spacing: .zero) {
            // Header
            if self.headerPosition == .banner {
                self.stylizedHeader()
            }

            // Content
            self.content()
                .foregroundStyle(self.viewModel.colors.foreground)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(
                    .top,
                    self.viewModel.layout.isHeaderBottonPadding ? self.borderHeaderSize.height / 2 : 0
                )
                .sparkPadding(self.viewModel.layout.padding)

        }
        .background(self.viewModel.colors.background)
        .sparkBorder(
            width: self.viewModel.border.width,
            radius: self.viewModel.border.radius,
            isHighlighted: self.isHighlighted,
            colorToken: self.viewModel.colors.border
        )
        .overlay(alignment: .top) {

            if self.headerPosition == .border {
                self.stylizedHeader()
                    .sparkPadding(.horizontal, self.viewModel.layout.padding)
                    .offset(y: -self.borderHeaderSize.height / 2)
                    .onGeometryChange(for: CGSize.self) { proxy in
                        proxy.size
                    } action: { newValue in
                        self.borderHeaderSize = newValue
                    }
            }
        }
        .dimmedOverlay(self.viewModel.dim) {
            self.viewModel.colors.dimBackground.color
                .sparkCornerRadius(
                    self.viewModel.border.radius,
                    isHighlighted: self.isHighlighted
                )
        }
    }

    private func stylizedHeader() -> some View {
        HStack(spacing: .zero) {
            if self.headerPosition.betweenSpaces {
                Spacer()
            }

            self.header()
                .foregroundStyle(self.viewModel.headerColors.foreground)
                .font(self.viewModel.typographies.headerFontToken)
                .sparkPadding(.vertical, self.viewModel.layout.headerVerticalPadding)
                .sparkPadding(.horizontal, self.viewModel.layout.headerHorizontalPadding)

            if self.headerPosition.betweenSpaces {
                Spacer()
            }
        }
        .background(self.viewModel.headerColors.background)
        .sparkCornerRadius(self.viewModel.border.headerRadius)
    }
}
