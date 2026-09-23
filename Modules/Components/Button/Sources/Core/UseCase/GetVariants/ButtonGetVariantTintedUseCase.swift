//
//  ButtonGetVariantTintedUseCase.swift
//  SparkComponentButtonTests
//
//  Created by janniklas.freundt.ext on 16.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

struct ButtonGetVariantTintedUseCase: ButtonGetVariantUseCaseable {

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
                tintColor: colors.accent.onAccentContainer,
                backgroundColor: isPressed ? colors.states.accentContainerPressed : colors.accent.accentContainer,
                borderColor: borderColor
            )
        case .ai:
            return .init(
                tintColor: colors.ai.onAIContainer,
                backgroundColor: isPressed ? colors.states.aiContainerPressed : colors.ai.aiContainer,
                borderColor: borderColor
            )
        case .alert:
            return .init(
                tintColor: colors.feedback.onAlertContainer,
                backgroundColor: isPressed ? colors.states.alertContainerPressed : colors.feedback.alertContainer,
                borderColor: borderColor
            )
        case .danger:
            return .init(
                tintColor: colors.feedback.onErrorContainer,
                backgroundColor: isPressed ? colors.states.errorContainerPressed : colors.feedback.errorContainer,
                borderColor: borderColor
            )
        case .info:
            return .init(
                tintColor: colors.feedback.onInfoContainer,
                backgroundColor: isPressed ? colors.states.infoContainerPressed : colors.feedback.infoContainer,
                borderColor: borderColor
            )
        case .main:
            return .init(
                tintColor: colors.main.onMainContainer,
                backgroundColor: isPressed ? colors.states.mainContainerPressed : colors.main.mainContainer,
                borderColor: borderColor
            )
        case .neutral:
            return .init(
                tintColor: colors.feedback.onNeutralContainer,
                backgroundColor: isPressed ? colors.states.neutralContainerPressed : colors.feedback.neutralContainer,
                borderColor: borderColor
            )
        case .success:
            return .init(
                tintColor: colors.feedback.onSuccessContainer,
                backgroundColor: isPressed ? colors.states.successContainerPressed : colors.feedback.successContainer,
                borderColor: borderColor
            )
        case .support:
            return .init(
                tintColor: colors.support.onSupportContainer,
                backgroundColor: isPressed ? colors.states.supportContainerPressed : colors.support.supportContainer,
                borderColor: borderColor
            )
        case .surface:
            return .init(
                tintColor: colors.base.onBackgroundVariant,
                backgroundColor: isPressed ? colors.states.surfacePressed : colors.base.backgroundVariant,
                borderColor: borderColor
            )
        case .surfaceInverse:
            return .init(
                tintColor: colors.base.surfaceInverse,
                backgroundColor: isPressed ? colors.states.surfaceInversePressed : ColorTokenDefault.clear,
                borderColor: borderColor
            )
        }
    }
}
