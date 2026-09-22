//
//  TextLinkGetHoverStyleUseCaseDeprecated.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 22/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
@available(*, deprecated, message: "Not used by the new SparkTextLink or SparkUITextLink")
protocol TextLinkGetHoverStyleUseCaseDeprecatedable {

    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: TextLinkIntent
    ) -> TextLinkHoverStyle
}

struct TextLinkGetHoverStyleUseCaseDeprecated: TextLinkGetHoverStyleUseCaseDeprecatedable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: TextLinkIntent
    ) -> TextLinkHoverStyle {
        let colors = theme.colors
        let backgroundColor = switch intent {
        case .accent, .accentContainer, .onAccentContainer: colors.accent.accent
        case .alert, .alertContainer: colors.feedback.alert
        case .danger, .dangerContainer: colors.feedback.error
        case .info, .infoContainer: colors.feedback.info
        case .main, .mainContainer: colors.main.main
        case .neutral, .neutralContainer: colors.feedback.neutral
        case .surface, .onSurface: colors.base.surface
        case .success, .successContainer: colors.feedback.success
        case .support, .supportContainer: colors.support.support
        case .custom(let colorToken): colorToken
        }

        return .init(
            horizontalPadding: theme.layout.spacing.medium,
            verticalPadding: theme.layout.spacing.small,
            cornerRadius: theme.border.radius.medium,
            backgroundColor: backgroundColor,
            dim: theme.dims.dim5
        )
    }
}
