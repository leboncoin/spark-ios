//
//  CardGetStateOutlinedColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

struct CardGetStateOutlinedColorsUseCase: CardGetStateColorsUseCaseable {

    func execute(
        theme: any Theme,
        intent: CardIntent
    ) -> CardStateColors {
        let colors = theme.colors
        let opacity = theme.dims.dim5

        return switch intent {
        case .accent: .init(
            border: colors.accent.accent,
            pressedBorder: colors.accent.accent,
            background: colors.base.surface,
            pressedBackground: colors.accent.accent.opacity(opacity),
            foreground: colors.base.onSurface
        )

        case .alert: .init(
            border: colors.feedback.alert,
            pressedBorder: colors.feedback.alert,
            background: colors.base.surface,
            pressedBackground: colors.feedback.alert.opacity(opacity),
            foreground: colors.base.onSurface
        )

        case .error: .init(
            border: colors.feedback.error,
            pressedBorder: colors.feedback.error,
            background: colors.base.surface,
            pressedBackground: colors.feedback.error.opacity(opacity),
            foreground: colors.base.onSurface
        )

        case .main: .init(
            border: colors.main.main,
            pressedBorder: colors.main.main,
            background: colors.base.surface,
            pressedBackground: colors.main.main.opacity(opacity),
            foreground: colors.base.onSurface
        )

        case .info: .init(
            border: colors.feedback.info,
            pressedBorder: colors.feedback.info,
            background: colors.base.surface,
            pressedBackground: colors.feedback.info.opacity(opacity),
            foreground: colors.base.onSurface
        )

        case .neutral: .init(
            border: colors.feedback.neutral,
            pressedBorder: colors.feedback.neutral,
            background: colors.base.surface,
            pressedBackground: colors.feedback.neutral.opacity(opacity),
            foreground: colors.base.onSurface
        )

        case .success: .init(
            border: colors.feedback.success,
            pressedBorder: colors.feedback.success,
            background: colors.base.surface,
            pressedBackground: colors.feedback.success.opacity(opacity),
            foreground: colors.base.onSurface
        )

        case .support: .init(
            border: colors.support.support,
            pressedBorder: colors.support.support,
            background: colors.base.surface,
            pressedBackground: colors.support.support.opacity(opacity),
            foreground: colors.base.onSurface
        )

        case .surface: .init(
            border: colors.base.outline,
            pressedBorder: colors.base.outline,
            background: colors.base.surface,
            pressedBackground: colors.base.onSurface.opacity(opacity),
            foreground: colors.base.onSurface
        )
        }
    }
}
