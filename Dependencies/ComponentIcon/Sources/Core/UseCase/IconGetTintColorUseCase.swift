//
//  IconGetTintColorUseCase.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol IconGetTintColorUseCaseable {
    // sourcery: theme = "Identical", return = "Identical"
    func execute(theme: any Theme, intent: IconIntent) -> any ColorToken
}

struct IconGetTintColorUseCase: IconGetTintColorUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: IconIntent
    ) -> any ColorToken {
        let colors = theme.colors

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
