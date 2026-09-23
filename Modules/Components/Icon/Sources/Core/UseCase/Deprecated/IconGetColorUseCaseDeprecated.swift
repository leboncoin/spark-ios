//
//  IconGetColorUseCaseDeprecated.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable
@available(*, deprecated, message: "Not used anymore by the new SparkIcon or SparkUIIcon")
protocol IconGetColorUseCaseDeprecatedable {
    func execute(for intent: IconIntent, colors: any Colors) -> any ColorToken
}

struct IconGetColorUseCaseDeprecated: IconGetColorUseCaseDeprecatedable {

    // MARK: - Methods

    func execute(for intent: IconIntent, colors: any Colors) -> any ColorToken {
        return switch intent {
        case .accent: colors.accent.accent
        case .alert: colors.feedback.alert
        case .error: colors.feedback.error
        case .info: colors.feedback.info
        case .main: colors.main.main
        case .neutral: colors.feedback.neutral
        case .success: colors.feedback.success
        case .support: colors.support.support
        case .custom(let colorToken): colorToken
        }
    }
}
