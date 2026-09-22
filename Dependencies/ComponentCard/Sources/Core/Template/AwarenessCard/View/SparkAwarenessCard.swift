//
//  SparkAwarenessCard.swift
//  SparkComponentTemplates
//
//  Created by robin.lemaire on 16/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon
import SparkComponentButton
import SparkComponentTextLink

/// An awareness card displays important information with an icon, title, description, and action.
///
/// An awareness card is a specialized component designed to draw user attention to important messages, alerts, or notifications.
/// It typically contains an icon, text content, and optional actions arranged horizontally for better visibility.
///
/// ## Example of usage
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkAwarenessCard(
///             icon: Image(systemName: "info.circle"),
///             title: "Important Update",
///             description: "Your account has been updated. Please review the changes.",
///             actionLabel: {
///                 SparkTextLink("Learn More") {
///                     // Handle action
///                 }
///             }
///         )
///         .sparkTheme(theme)
///         .sparkCardIntent(.info)
///     }
/// }
/// ```
///
/// ## EnvironmentValues
///
/// This component uses some EnvironmentValues:
/// - **theme**: ``sparkTheme(_:)`` (View extension)
/// You can also check the EnvironmentValues used by the ``SparkCard``
///
/// > If these values are not set, default values will be applied.
///
/// > **YOU MUST PROVIDE ``sparkTheme(_:)``**
///
/// ## Accessibility
///
/// You need to manage the accessibility of the component yourself because Spark doesn't know the context of the content.
///
/// The awareness card automatically applies the accessibility identifier ``AwarenessCardAccessibilityIdentifier/view``.
///
/// ## Rendering
///
///  ![Classic](awareness_card_classic.png) 
///
public struct SparkAwarenessCard<TitleLabel, DescriptionLabel, ActionLabel>: View where TitleLabel: View, DescriptionLabel: View, ActionLabel: View {

    // MARK: - Properties

    private let icon: Image?
    private let titleLabel: () -> TitleLabel
    private let descriptionlabel: () -> DescriptionLabel
    private let actionLabel: () -> ActionLabel

    @Environment(\.theme) private var theme
    @Environment(\.cardIntent) private var intent
    @Environment(\.sizeCategory) var sizeCategory

    @StateObject private var viewModel = AwarenessCardViewModel()

    // MARK: - Initialization

    /// Creates an awareness card with all components.
    ///
    /// - Parameters:
    ///   - icon: The optional icon of the awareness card.
    ///   - titleLabel: The title label of the awareness card.
    ///   - descriptionLabel: The description label of the awareness card.
    ///   - actionLabel: The action label of the awareness card.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// SparkAwarenessCard(
    ///     icon: Image(systemName: "info.circle"),
    ///     titleLabel: {
    ///         Text("Important Notice")
    ///             .fontWeight(.bold)
    ///     },
    ///     descriptionLabel: {
    ///         Text("Please read this information carefully.")
    ///     },
    ///     actionLabel: {
    ///         SparkButton("Learn More") {
    ///             // Handle action
    ///         }
    ///     }
    /// )
    /// .sparkTheme(theme)
    /// .sparkCardIntent(.info)
    /// ```
    ///
    /// ## Rendering
    ///
    ///  ![Classic](awareness_card_classic.png)
    ///
    public init(
        icon: Image? = nil,
        @ViewBuilder titleLabel: @escaping () -> TitleLabel,
        @ViewBuilder descriptionLabel: @escaping () -> DescriptionLabel,
        @ViewBuilder actionLabel: @escaping () -> ActionLabel
    ) {
        self.icon = icon
        self.titleLabel = titleLabel
        self.descriptionlabel = descriptionLabel
        self.actionLabel = actionLabel
    }

    // MARK: - View

    public var body: some View {
        SparkCard {
            SparkHStack(alignment: .top, spacing: self.viewModel.layout.horizontalSpacing) {
                // Icon
                if !self.sizeCategory.isAccessibilityCategory {
                    self.icon?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .sparkFrame(
                            size: AwarenessCardConstants.iconSize,
                            relativeTo: .body
                        )
                        .accessibilityHidden(true)
                }

                SparkVStack(alignment: .leading, spacing: self.viewModel.layout.verticalSpacing) {
                    // Title
                    self.titleLabel()
                        .font(self.viewModel.typographies.titleFontToken)

                    // Description
                    self.descriptionlabel()
                        .font(self.viewModel.typographies.descriptionFontToken)

                    Spacer(minLength: 0)

                    // Action
                    self.actionLabel()
                        .sparkButtonIntent(self.intent.buttonIntent)
                        .sparkTextLinkIntent(self.intent.textLinkIntent(theme: self.theme.value))
                        .sparkTextLinkTypography(AwarenessCardConstants.textLinkTypography)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .sparkCardPadding(.all)
        .accessibilityIdentifier(AwarenessCardAccessibilityIdentifier.view)
        .onAppear {
            self.viewModel.setup(theme: self.theme.value)
        }
        .onChange(of: self.theme) { newTheme in
            self.viewModel.theme = newTheme.value
        }
    }
}

