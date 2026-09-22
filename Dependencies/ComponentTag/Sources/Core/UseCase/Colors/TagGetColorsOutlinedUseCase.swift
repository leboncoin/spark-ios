//
//  TagGetColorsOutlinedUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 26/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

struct TagGetColorsOutlinedUseCase: TagGetColorsVariantUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: TagIntent
    ) -> TagColors {
        let colors = theme.colors

        return switch intent {
        case .accent:
                .init(
                    backgroundColor: ColorTokenDefault.clear,
                    borderColor: colors.accent.accent,
                    tintColor: colors.accent.accent
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
                    backgroundColor: ColorTokenDefault.clear,
                    borderColor: colors.feedback.alert,
                    tintColor: colors.feedback.alert
                )

        case .danger:
                .init(
                    backgroundColor: ColorTokenDefault.clear,
                    borderColor: colors.feedback.error,
                    tintColor: colors.feedback.error
                )

        case .info:
                .init(
                    backgroundColor: ColorTokenDefault.clear,
                    borderColor: colors.feedback.info,
                    tintColor: colors.feedback.info
                )

        case .main:
                .init(
                    backgroundColor: ColorTokenDefault.clear,
                    borderColor: colors.main.main,
                    tintColor: colors.main.main
                )

        case .neutral:
                .init(
                    backgroundColor: ColorTokenDefault.clear,
                    borderColor: colors.feedback.neutral,
                    tintColor: colors.feedback.neutral
                )

        case .success:
                .init(
                    backgroundColor: ColorTokenDefault.clear,
                    borderColor: colors.feedback.success,
                    tintColor: colors.feedback.success
                )

        case .support:
                .init(
                    backgroundColor: ColorTokenDefault.clear,
                    borderColor: colors.support.support,
                    tintColor: colors.support.support
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
