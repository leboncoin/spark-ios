//
//  ButtonGetVariantFilledUseCase.swift
//  SparkComponentButtonTests
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

struct ButtonGetVariantFilledUseCase: ButtonGetVariantUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: ButtonIntent,
        isPressed: Bool
    ) -> ButtonColors {
        let colors = theme.colors

        let borderColor = ColorTokenDefault.clear

        switch intent {
        case .accent:
            return .init(
                tintColor: colors.accent.onAccent,
                backgroundColor: isPressed ? colors.states.accentPressed : colors.accent.accent,
                borderColor: borderColor
            )
        case .ai:
            return .init(
                tintColor: colors.ai.onAI,
                backgroundColor: isPressed ? colors.states.aiPressed : colors.ai.ai,
                borderColor: borderColor
            )
        case .alert:
            return .init(
                tintColor: colors.feedback.onAlert,
                backgroundColor: isPressed ? colors.states.alertPressed : colors.feedback.alert,
                borderColor: borderColor
            )
        case .danger:
            return .init(
                tintColor: colors.feedback.onError,
                backgroundColor: isPressed ? colors.states.errorPressed : colors.feedback.error,
                borderColor: borderColor
            )
        case .info:
            return .init(
                tintColor: colors.feedback.onInfo,
                backgroundColor: isPressed ? colors.states.infoPressed : colors.feedback.info,
                borderColor: borderColor
            )
        case .main:
            return .init(
                tintColor: colors.main.onMain,
                backgroundColor: isPressed ? colors.states.mainPressed : colors.main.main,
                borderColor: borderColor
            )
        case .neutral:
            return .init(
                tintColor: colors.feedback.onNeutral,
                backgroundColor: isPressed ? colors.states.neutralPressed : colors.feedback.neutral,
                borderColor: borderColor
            )
        case .success:
            return .init(
                tintColor: colors.feedback.onSuccess,
                backgroundColor: isPressed ? colors.states.successPressed : colors.feedback.success,
                borderColor: borderColor
            )
        case .support:
            return .init(
                tintColor: colors.support.onSupport,
                backgroundColor: isPressed ? colors.states.supportPressed : colors.support.support,
                borderColor: borderColor
            )
        case .surface:
            return .init(
                tintColor: colors.base.onSurface,
                backgroundColor: isPressed ? colors.states.surfacePressed : colors.base.surface,
                borderColor: borderColor
            )
        case .surfaceInverse:
            return .init(
                tintColor: colors.base.onSurfaceInverse,
                backgroundColor: isPressed ? colors.states.surfaceInversePressed : colors.base.surfaceInverse,
                borderColor: borderColor
            )
        }
    }
}
