//
//  CardGetStateTintedColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

struct CardGetStateTintedColorsUseCase: CardGetStateColorsUseCaseable {

    func execute(
        theme: any Theme,
        intent: CardIntent
    ) -> CardStateColors {
        let colors = theme.colors

        return switch intent {
        case .accent: .init(
            background: colors.accent.accentContainer,
            pressed: colors.states.accentContainerPressed,
            foreground: colors.accent.onAccentContainer
        )

        case .alert: .init(
            background: colors.feedback.alertContainer,
            pressed: colors.states.alertContainerPressed,
            foreground: colors.feedback.onAlertContainer
        )

        case .error: .init(
            background: colors.feedback.errorContainer,
            pressed: colors.states.errorContainerPressed,
            foreground: colors.feedback.onErrorContainer
        )

        case .info: .init(
            background: colors.feedback.infoContainer,
            pressed: colors.states.infoContainerPressed,
            foreground: colors.feedback.onInfoContainer
        )

        case .main: .init(
            background: colors.main.mainContainer,
            pressed: colors.states.mainContainerPressed,
            foreground: colors.main.onMainContainer
        )

        case .neutral: .init(
            background: colors.feedback.neutralContainer,
            pressed: colors.states.neutralContainerPressed,
            foreground: colors.feedback.onNeutralContainer
        )

        case .success: .init(
            background: colors.feedback.successContainer,
            pressed: colors.states.successContainerPressed,
            foreground: colors.feedback.onSuccessContainer
        )

        case .support: .init(
            background: colors.support.supportContainer,
            pressed: colors.states.supportContainerPressed,
            foreground: colors.support.onSupportContainer
        )

        case .surface: .init(
            background: colors.base.surface,
            pressed: colors.states.surfacePressed,
            foreground: colors.base.onSurface
        )
        }
    }
}
