//
//  DividerViewModelDeprecated.swift
//  SparkComponentDivider
//
//  Created by louis.borlee on 17/07/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable
protocol DividierGetColorsUseCasableDeprecated {
    func execute(
        colors: any Colors,
        intent: DividerIntent
    ) -> DividerColors
}

@available(*, deprecated, message: "Not used anymore by SparkDivider or SparkUIDivider")
struct DividerGetColorsUseCaseDeprecated: DividierGetColorsUseCasableDeprecated {
    func execute(colors: any Colors, intent: DividerIntent) -> DividerColors {
        let separatorColor = switch intent {
        case .outline: colors.base.outline
        case .outlineHigh: colors.base.outlineHigh
        case .accent: colors.accent.onAccentContainer
        case .success: colors.feedback.onSuccessContainer
        case .alert: colors.feedback.onAlertContainer
        case .error: colors.feedback.onErrorContainer
        case .info: colors.feedback.onInfoContainer
        case .neutral: colors.feedback.onNeutralContainer
        case .main: colors.main.onMainContainer
        case .support: colors.support.onSupportContainer
        }

        let textColor = switch intent {
        case .outline, .outlineHigh: colors.base.onSurface
        default: separatorColor
        }

        return .init(
            text: textColor,
            separator: separatorColor
        )
    }
}
