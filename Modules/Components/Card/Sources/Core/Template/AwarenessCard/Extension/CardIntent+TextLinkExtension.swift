//
//  CardIntent+ButtonExtension.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 11/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkComponentTextLink
import SparkTheming

extension CardIntent {

    func textLinkIntent(theme: any Theme) -> TextLinkIntent {
        switch self {
        case .accent: .custom(theme.colors.accent.onAccentContainer)
        case .alert:  .custom(theme.colors.feedback.onAlertContainer)
        case .error:  .custom(theme.colors.feedback.onErrorContainer)
        case .info:  .custom(theme.colors.feedback.onInfoContainer)
        case .main:  .custom(theme.colors.main.onMainContainer)
        case .neutral: .custom(theme.colors.feedback.onNeutralContainer)
        case .success:  .custom(theme.colors.feedback.onSuccessContainer)
        case .support: .custom(theme.colors.support.onSupportContainer)
        case .surface: .default
        }
    }
}
