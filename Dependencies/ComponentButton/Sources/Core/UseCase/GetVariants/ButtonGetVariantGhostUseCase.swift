//
//  ButtonGetVariantGhostUseCase.swift
//  SparkComponentButtonTests
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

struct ButtonGetVariantGhostUseCase: ButtonGetVariantUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: ButtonIntent,
        isPressed: Bool
    ) -> ButtonColors {
        let colors = theme.colors
        let dim5 = theme.dims.dim5

        let borderColor = ColorTokenDefault.clear

        switch intent {
        case .accent:
            return .init(
                tintColor: colors.accent.onAccentContainer,
                backgroundColor: isPressed ? colors.accent.accent.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        case .ai:
            return .init(
                tintColor: colors.ai.onAIContainer,
                backgroundColor: isPressed ? colors.ai.ai.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        case .alert:
            return .init(
                tintColor: colors.feedback.onAlertContainer,
                backgroundColor: isPressed ? colors.feedback.alert.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        case .danger:
            return .init(
                tintColor: colors.feedback.onErrorContainer,
                backgroundColor: isPressed ? colors.feedback.error.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        case .info:
            return .init(
                tintColor: colors.feedback.onInfoContainer,
                backgroundColor: isPressed ? colors.feedback.info.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        case .main:
            return .init(
                tintColor: colors.main.onMainContainer,
                backgroundColor: isPressed ? colors.main.main.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        case .neutral:
            return .init(
                tintColor: colors.feedback.onNeutralContainer,
                backgroundColor: isPressed ? colors.feedback.neutral.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        case .success:
            return .init(
                tintColor: colors.feedback.onSuccessContainer,
                backgroundColor: isPressed ? colors.feedback.success.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        case .support:
            return .init(
                tintColor: colors.support.onSupportContainer,
                backgroundColor: isPressed ? colors.support.support.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        case .surface:
            return .init(
                tintColor: colors.base.surface,
                backgroundColor: isPressed ? colors.base.surface.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        case .surfaceInverse:
            return .init(
                tintColor: colors.base.surfaceInverse,
                backgroundColor: isPressed ? colors.base.surfaceInverse.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        }
    }
}
