//
//  TagGetColorsFilledUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 26/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

struct TagGetColorsFilledUseCase: TagGetColorsVariantUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: TagIntent
    ) -> TagColors {
        let colors = theme.colors

        return switch intent {
        case .accent:
                .init(
                    backgroundColor: colors.accent.accent,
                    borderColor: colors.accent.accent,
                    tintColor: colors.accent.onAccent
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
                    backgroundColor: colors.feedback.alert,
                    borderColor: colors.feedback.alert,
                    tintColor: colors.feedback.onAlert
                )

        case .danger:
                .init(
                    backgroundColor: colors.feedback.error,
                    borderColor: colors.feedback.error,
                    tintColor: colors.feedback.onError
                )

        case .info:
                .init(
                    backgroundColor: colors.feedback.info,
                    borderColor: colors.feedback.info,
                    tintColor: colors.feedback.onInfo
                )

        case .main:
                .init(
                    backgroundColor: colors.main.main,
                    borderColor: colors.main.main,
                    tintColor: colors.main.onMain
                )

        case .neutral:
                .init(
                    backgroundColor: colors.feedback.neutral,
                    borderColor: colors.feedback.neutral,
                    tintColor: colors.feedback.onNeutral
                )

        case .success:
                .init(
                    backgroundColor: colors.feedback.success,
                    borderColor: colors.feedback.success,
                    tintColor: colors.feedback.onSuccess
                )

        case .support:
                .init(
                    backgroundColor: colors.support.support,
                    borderColor: colors.support.support,
                    tintColor: colors.support.onSupport
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
