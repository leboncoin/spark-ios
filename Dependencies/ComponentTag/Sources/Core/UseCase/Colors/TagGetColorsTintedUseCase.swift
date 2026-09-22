//
//  TagGetColorsTintedUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 26/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

struct TagGetColorsTintedUseCase: TagGetColorsVariantUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: TagIntent
    ) -> TagColors {
        let colors = theme.colors

        return switch intent {
        case .accent:
                .init(
                    backgroundColor: colors.accent.accentContainer,
                    borderColor: colors.accent.accentContainer,
                    tintColor: colors.accent.onAccentContainer
                )

        case .ai:
                .init(
                    backgroundColor: colors.ai.aiContainer,
                    borderColor: colors.ai.ai,
                    iconColor: colors.ai.ai,
                    textColor: colors.ai.onAIContainer
                )

        case .alert:
                .init(
                    backgroundColor: colors.feedback.alertContainer,
                    borderColor: colors.feedback.alertContainer,
                    tintColor: colors.feedback.onAlertContainer
                )

        case .danger:
                .init(
                    backgroundColor: colors.feedback.errorContainer,
                    borderColor: colors.feedback.errorContainer,
                    tintColor: colors.feedback.onErrorContainer
                )

        case .info:
                .init(
                    backgroundColor: colors.feedback.infoContainer,
                    borderColor: colors.feedback.infoContainer,
                    tintColor: colors.feedback.onInfoContainer
                )

        case .main:
                .init(
                    backgroundColor: colors.main.mainContainer,
                    borderColor: colors.main.mainContainer,
                    tintColor: colors.main.onMainContainer
                )

        case .neutral:
                .init(
                    backgroundColor: colors.feedback.neutralContainer,
                    borderColor: colors.feedback.neutralContainer,
                    tintColor: colors.feedback.onNeutralContainer
                )

        case .success:
                .init(
                    backgroundColor: colors.feedback.successContainer,
                    borderColor: colors.feedback.successContainer,
                    tintColor: colors.feedback.onSuccessContainer
                )

        case .support:
                .init(
                    backgroundColor: colors.support.supportContainer,
                    borderColor: colors.support.supportContainer,
                    tintColor: colors.support.onSupportContainer
                )

        case .surface:
                .init(
                    backgroundColor: colors.base.surface,
                    borderColor: colors.base.surface,
                    tintColor: colors.base.onSurface
                )
        }
    }
}
