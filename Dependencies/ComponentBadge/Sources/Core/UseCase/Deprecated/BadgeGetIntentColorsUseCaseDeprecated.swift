//
//  BadgeGetIntentColorsUseCaseDeprecated.swift
//  SparkComponentBadge
//
//  Created by alex.vecherov on 10.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable
protocol BadgeGetIntentColorsUseCaseDeprecatedableDeprecated {
    func execute(intentType: BadgeIntentType,
                 on colors: any Colors) -> BadgeColorsDeprecated
}

@available(*, deprecated, message: "Not used anymore by the new SparkBadge or SparkUIBadge")
final class BadgeGetIntentColorsUseCaseDeprecated: BadgeGetIntentColorsUseCaseDeprecatedableDeprecated {

    // MARK: - Methods

    func execute(intentType: BadgeIntentType,
                 on colors: any Colors) -> BadgeColorsDeprecated {
        let surfaceColor = colors.base.surface

        switch intentType {
        case .accent:
            return BadgeColorsDeprecated(
                backgroundColor: colors.accent.accent,
                borderColor: surfaceColor,
                foregroundColor: colors.accent.onAccent
            )
        case .alert:
            return BadgeColorsDeprecated(
                backgroundColor: colors.feedback.alert,
                borderColor: surfaceColor,
                foregroundColor: colors.feedback.onAlert
            )
        case .danger:
            return BadgeColorsDeprecated(
                backgroundColor: colors.feedback.error,
                borderColor: surfaceColor,
                foregroundColor: colors.feedback.onError
            )
        case .info:
            return BadgeColorsDeprecated(
                backgroundColor: colors.feedback.info,
                borderColor: surfaceColor,
                foregroundColor: colors.feedback.onInfo
            )
        case .neutral:
            return BadgeColorsDeprecated(
                backgroundColor: colors.feedback.neutral,
                borderColor: surfaceColor,
                foregroundColor: colors.feedback.onNeutral
            )
        case .main:
            return BadgeColorsDeprecated(
                backgroundColor: colors.main.main,
                borderColor: surfaceColor,
                foregroundColor: colors.main.onMain
            )
        case .support:
            return BadgeColorsDeprecated(
                backgroundColor: colors.support.support,
                borderColor: surfaceColor,
                foregroundColor: colors.support.onSupport
            )
        case .success:
            return BadgeColorsDeprecated(
                backgroundColor: colors.feedback.success,
                borderColor: surfaceColor,
                foregroundColor: colors.feedback.onSuccess
            )

        }
    }
}
