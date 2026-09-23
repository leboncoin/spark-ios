//
//  CardGetHeaderBorderOutlinedColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 11/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

struct CardGetHeaderBorderOutlinedColorsUseCase: CardGetHeaderVariantColorsUseCaseable {

    func execute(
        theme: any Theme,
        intent: CardIntent
    ) -> CardHeaderColors {
        let colors = theme.colors

        let background = colors.base.surface

        let foreground = switch intent {
        case .accent: colors.base.surface
        case .alert: colors.feedback.alert
        case .error: colors.feedback.error
        case .info: colors.feedback.info
        case .main: colors.main.main
        case .neutral: colors.feedback.neutral
        case .success: colors.feedback.success
        case .support: colors.support.support
        case .surface: colors.base.onSurface
        }

        return .init(
            background: background,
            foreground: foreground
        )
    }
}
