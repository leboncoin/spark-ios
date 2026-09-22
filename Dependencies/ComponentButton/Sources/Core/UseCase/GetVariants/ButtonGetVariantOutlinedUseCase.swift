//
//  ButtonGetVariantOutlinedUseCase.swift
//  SparkComponentButton
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

struct ButtonGetVariantOutlinedUseCase: ButtonGetVariantUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: ButtonIntent,
        isPressed: Bool
    ) -> ButtonColors {
        let colors = theme.colors
        let dim5 = theme.dims.dim5

        switch intent {
        case .accent:
            return .init(
                tintColor: colors.accent.accent,
                backgroundColor: isPressed ? colors.accent.accent.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: colors.accent.accent
            )
        case .ai:
            return .init(
                tintColor: colors.ai.ai,
                backgroundColor: isPressed ? colors.ai.ai.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: colors.ai.ai
            )
        case .alert:
            return .init(
                tintColor: colors.feedback.alert,
                backgroundColor: isPressed ? colors.feedback.alert.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: colors.feedback.alert
            )
        case .danger:
            return .init(
                tintColor: colors.feedback.error,
                backgroundColor: isPressed ? colors.feedback.error.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: colors.feedback.error
            )
        case .info:
            return .init(
                tintColor: colors.feedback.info,
                backgroundColor: isPressed ? colors.feedback.info.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: colors.feedback.info
            )
        case .main:
            return .init(
                tintColor: colors.main.main,
                backgroundColor: isPressed ? colors.main.main.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: colors.main.main
            )
        case .neutral:
            return .init(
                tintColor: colors.feedback.neutral,
                backgroundColor: isPressed ? colors.feedback.neutral.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: colors.feedback.neutral
            )
        case .success:
            return .init(
                tintColor: colors.feedback.success,
                backgroundColor: isPressed ? colors.feedback.success.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: colors.feedback.success
            )
        case .support:
            return .init(
                tintColor: colors.support.support,
                backgroundColor: isPressed ? colors.support.support.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: colors.support.support
            )
        case .surface:
            return .init(
                tintColor: colors.base.surface,
                backgroundColor: isPressed ? colors.base.surface.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: colors.base.surface
            )
        case .surfaceInverse:
            return .init(
                tintColor: colors.base.surfaceInverse,
                backgroundColor: isPressed ? colors.base.surfaceInverse.opacity(dim5) : ColorTokenDefault.clear,
                borderColor: colors.base.surfaceInverse
            )
        }
    }
}
