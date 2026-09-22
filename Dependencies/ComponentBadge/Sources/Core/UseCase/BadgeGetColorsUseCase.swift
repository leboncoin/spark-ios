//
//  BadgeGetColorsUseCase.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol BadgeGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, intent: BadgeIntent) -> BadgeColors
}

final class BadgeGetColorsUseCase: BadgeGetColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, intent: BadgeIntent) -> BadgeColors {
        let colors = theme.colors
        let borderColor = colors.base.surface

        return switch intent {
        case .accent:
                .init(
                    background: colors.accent.accent,
                    border: borderColor,
                    foreground: colors.accent.onAccent
                )
        case .alert:
                .init(
                    background: colors.feedback.alert,
                    border: borderColor,
                    foreground: colors.feedback.onAlert
                )
        case .danger:
                .init(
                    background: colors.feedback.error,
                    border: borderColor,
                    foreground: colors.feedback.onError
                )
        case .info:
                .init(
                    background: colors.feedback.info,
                    border: borderColor,
                    foreground: colors.feedback.onInfo
                )
        case .neutral:
                .init(
                    background: colors.feedback.neutral,
                    border: borderColor,
                    foreground: colors.feedback.onNeutral
                )
        case .main:
                .init(
                    background: colors.main.main,
                    border: borderColor,
                    foreground: colors.main.onMain
                )
        case .support:
                .init(
                    background: colors.support.support,
                    border: borderColor,
                    foreground: colors.support.onSupport
                )
        case .success:
                .init(
                    background: colors.feedback.success,
                    border: borderColor,
                    foreground: colors.feedback.onSuccess
                )

        }
    }
}
