//
//  ChipGetStateOutlinedColorsUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

struct ChipGetStateOutlinedColorsUseCase: ChipGetStateColorsUseCaseable {

    func execute(
        theme: any Theme,
        intent: ChipIntent
    ) -> ChipStateColors {
        let colors = theme.colors
        let opacity = theme.dims.dim5

        return switch intent {
        case .accent: .init(
            border: colors.accent.accent,
            pressedBorder: colors.accent.accent,
            selectedBorder: colors.accent.accent,
            content: colors.accent.accent,
            selectedContent: colors.accent.accent,
            background: ColorTokenDefault.clear,
            pressedBackground: colors.accent.accent.opacity(opacity),
            selectedBackground: colors.accent.accentContainer
        )

        case .alert: .init(
            border: colors.feedback.alert,
            pressedBorder: colors.feedback.alert,
            selectedBorder: colors.feedback.alert,
            content: colors.feedback.alert,
            selectedContent: colors.feedback.alert,
            background: ColorTokenDefault.clear,
            pressedBackground: colors.feedback.alert.opacity(opacity),
            selectedBackground: colors.feedback.alertContainer
        )

        case .danger: .init(
            border: colors.feedback.error,
            pressedBorder: colors.feedback.error,
            selectedBorder: colors.feedback.error,
            content: colors.feedback.error,
            selectedContent: colors.feedback.error,
            background: ColorTokenDefault.clear,
            pressedBackground: colors.feedback.error.opacity(opacity),
            selectedBackground: colors.feedback.errorContainer
        )

        case .main: .init(
            border: colors.main.main,
            pressedBorder: colors.main.main,
            selectedBorder: colors.main.main,
            content: colors.main.main,
            selectedContent: colors.main.main,
            background: ColorTokenDefault.clear,
            pressedBackground: colors.main.main.opacity(opacity),
            selectedBackground: colors.main.mainContainer
        )

        case .info: .init(
            border: colors.feedback.info,
            pressedBorder: colors.feedback.info,
            selectedBorder: colors.feedback.info,
            content: colors.feedback.info,
            selectedContent: colors.feedback.info,
            background: ColorTokenDefault.clear,
            pressedBackground: colors.feedback.info.opacity(opacity),
            selectedBackground: colors.feedback.infoContainer
        )

        case .neutral: .init(
            border: colors.feedback.neutral,
            pressedBorder: colors.feedback.neutral,
            selectedBorder: colors.feedback.neutral,
            content: colors.feedback.neutral,
            selectedContent: colors.feedback.neutral,
            background: ColorTokenDefault.clear,
            pressedBackground: colors.feedback.neutral.opacity(opacity),
            selectedBackground: colors.feedback.neutralContainer
        )

        case .success: .init(
            border: colors.feedback.success,
            pressedBorder: colors.feedback.success,
            selectedBorder: colors.feedback.success,
            content: colors.feedback.success,
            selectedContent: colors.feedback.success,
            background: ColorTokenDefault.clear,
            pressedBackground: colors.feedback.success.opacity(opacity),
            selectedBackground: colors.feedback.successContainer
        )

        case .support: .init(
            border: colors.support.support,
            pressedBorder: colors.support.support,
            selectedBorder: colors.support.support,
            content: colors.support.support,
            selectedContent: colors.support.support,
            background: ColorTokenDefault.clear,
            pressedBackground: colors.support.support.opacity(opacity),
            selectedBackground: colors.support.supportContainer
        )

        case .surface: .init(
            border: colors.base.onSurface,
            pressedBorder: colors.base.onSurface,
            selectedBorder: colors.base.onSurface,
            content: colors.base.onSurface,
            selectedContent: colors.base.onSurface,
            background: ColorTokenDefault.clear,
            pressedBackground: colors.base.onSurface.opacity(opacity),
            selectedBackground: colors.base.surface
        )
        }
    }
}
