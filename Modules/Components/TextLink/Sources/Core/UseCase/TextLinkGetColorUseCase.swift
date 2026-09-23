//
//  TextLinkGetColorUseCase.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 20/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TextLinkGetColorUseCaseable {

    // sourcery: theme = "Identical", return = "Identical"
    func execute(
        theme: any Theme,
        intent: TextLinkIntent,
        isHighlighted: Bool
    ) -> any ColorToken
}

struct TextLinkGetColorUseCase: TextLinkGetColorUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: TextLinkIntent,
        isHighlighted: Bool
    ) -> any ColorToken {
        let colors = theme.colors

        return switch intent {
        case .accent:
            isHighlighted ? colors.states.accentPressed : colors.accent.accent
        case .alert:
            isHighlighted ? colors.states.alertPressed : colors.feedback.alert
        case .danger:
            isHighlighted ? colors.states.errorPressed : colors.feedback.error
        case .info:
            isHighlighted ? colors.states.infoPressed : colors.feedback.info
        case .main:
            isHighlighted ? colors.states.mainPressed : colors.main.main
        case .neutral:
            isHighlighted ? colors.states.neutralPressed : colors.feedback.neutral
        case .success:
            isHighlighted ? colors.states.successPressed : colors.feedback.success
        case .support:
            isHighlighted ? colors.states.supportPressed : colors.support.support
        case .custom(let colorToken):
            colorToken

            // Deprecated cases
        case .accentContainer, .onAccentContainer: colors.accent.onAccentContainer
        case .alertContainer: colors.feedback.onAlertContainer
        case .dangerContainer: colors.feedback.onErrorContainer
        case .infoContainer: colors.feedback.onInfoContainer
        case .mainContainer: colors.main.onMainContainer
        case .neutralContainer: colors.feedback.onNeutralContainer
        case .surface: colors.base.onSurface
        case .onSurface: colors.base.onSurface
        case .successContainer: colors.feedback.onSuccessContainer
        case .supportContainer: colors.support.onSupportContainer
        }
    }
}
