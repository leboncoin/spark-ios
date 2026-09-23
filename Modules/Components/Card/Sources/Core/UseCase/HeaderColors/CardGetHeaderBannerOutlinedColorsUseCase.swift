//
//  CardGetHeaderBannerOutlinedColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 11/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

struct CardGetHeaderBannerOutlinedColorsUseCase: CardGetHeaderVariantColorsUseCaseable {

    func execute(
        theme: any Theme,
        intent: CardIntent
    ) -> CardHeaderColors {
        let colors = theme.colors

        return switch intent {
        case .accent: .init(
            background: colors.accent.accent,
            foreground: colors.accent.onAccent
        )

        case .alert: .init(
            background: colors.feedback.alert,
            foreground: colors.feedback.onAlert
        )

        case .error: .init(
            background: colors.feedback.error,
            foreground: colors.feedback.onError
        )

        case .info: .init(
            background: colors.feedback.info,
            foreground: colors.feedback.onInfo
        )

        case .main: .init(
            background: colors.main.main,
            foreground: colors.main.onMain
        )

        case .neutral: .init(
            background: colors.feedback.neutral,
            foreground: colors.feedback.onNeutral
        )

        case .success: .init(
            background: colors.feedback.success,
            foreground: colors.feedback.onSuccess
        )

        case .support: .init(
            background: colors.support.support,
            foreground: colors.support.onSupport
        )

        case .surface: .init(
            background: colors.base.surfaceInverse,
            foreground: colors.base.onSurfaceInverse
        )
        }
    }
}
