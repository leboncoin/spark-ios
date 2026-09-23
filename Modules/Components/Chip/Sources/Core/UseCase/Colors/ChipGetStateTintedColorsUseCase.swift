//
//  ChipGetStateTintedColorsUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

struct ChipGetStateTintedColorsUseCase: ChipGetStateColorsUseCaseable {

    func execute(
        theme: any Theme,
        intent: ChipIntent
    ) -> ChipStateColors {
        let colors = theme.colors

        return switch intent {

        case .accent: .init(
            border: colors.accent.accentContainer,
            pressedBorder: colors.states.accentContainerPressed,
            selectedBorder: colors.accent.accent,
            content: colors.accent.onAccentContainer,
            selectedContent: colors.accent.onAccent,
            background: colors.accent.accentContainer,
            pressedBackground: colors.states.accentContainerPressed,
            selectedBackground: colors.accent.accent
        )

        case .alert: .init(
            border: colors.feedback.alertContainer,
            pressedBorder: colors.states.alertContainerPressed,
            selectedBorder: colors.feedback.alert,
            content: colors.feedback.onAlertContainer,
            selectedContent: colors.feedback.onAlert,
            background: colors.feedback.alertContainer,
            pressedBackground: colors.states.alertContainerPressed,
            selectedBackground: colors.feedback.alert
        )

        case .danger: .init(
            border: colors.feedback.errorContainer,
            pressedBorder: colors.states.errorContainerPressed,
            selectedBorder: colors.feedback.error,
            content: colors.feedback.onErrorContainer,
            selectedContent: colors.feedback.onError,
            background: colors.feedback.errorContainer,
            pressedBackground: colors.states.errorContainerPressed,
            selectedBackground: colors.feedback.error
        )

        case .info: .init(
            border: colors.feedback.infoContainer,
            pressedBorder: colors.states.infoContainerPressed,
            selectedBorder: colors.feedback.info,
            content: colors.feedback.onInfoContainer,
            selectedContent: colors.feedback.onInfo,
            background: colors.feedback.infoContainer,
            pressedBackground: colors.states.infoContainerPressed,
            selectedBackground: colors.feedback.info
        )

        case .main: .init(
            border: colors.main.mainContainer,
            pressedBorder: colors.states.mainContainerPressed,
            selectedBorder: colors.main.main,
            content: colors.main.onMainContainer,
            selectedContent: colors.main.onMain,
            background: colors.main.mainContainer,
            pressedBackground: colors.states.mainContainerPressed,
            selectedBackground: colors.main.main
        )

        case .neutral: .init(
            border: colors.feedback.neutralContainer,
            pressedBorder: colors.states.neutralContainerPressed,
            selectedBorder: colors.feedback.neutral,
            content: colors.feedback.onNeutralContainer,
            selectedContent: colors.feedback.onNeutral,
            background: colors.feedback.neutralContainer,
            pressedBackground: colors.states.neutralContainerPressed,
            selectedBackground: colors.feedback.neutral
        )

        case .success: .init(
            border: colors.feedback.successContainer,
            pressedBorder: colors.states.successContainerPressed,
            selectedBorder: colors.feedback.success,
            content: colors.feedback.onSuccessContainer,
            selectedContent: colors.feedback.onSuccess,
            background: colors.feedback.successContainer,
            pressedBackground: colors.states.successContainerPressed,
            selectedBackground: colors.feedback.success
        )

        case .support: .init(
            border: colors.support.supportContainer,
            pressedBorder: colors.states.supportContainerPressed,
            selectedBorder: colors.support.support,
            content: colors.support.onSupportContainer,
            selectedContent: colors.support.onSupport,
            background: colors.support.supportContainer,
            pressedBackground: colors.states.supportContainerPressed,
            selectedBackground: colors.support.support
        )

        case .surface: .init(
            border: ColorTokenDefault.clear,
            pressedBorder: colors.states.surfacePressed,
            selectedBorder: colors.base.surface,
            content: colors.base.surfaceInverse,
            selectedContent: colors.base.onSurface,
            background: colors.base.surface.opacity(theme.dims.dim1),
            pressedBackground: colors.states.surfacePressed,
            selectedBackground: colors.base.surface
        )
        }
    }
}
