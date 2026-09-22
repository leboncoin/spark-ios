//
//  TabAccessibilityColorsUseCase.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TabAccessibilityColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, intent: TabIntent) -> TabAccessibilityColors
}

struct TabAccessibilityColorsUseCase: TabAccessibilityColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, intent: TabIntent) -> TabAccessibilityColors {
        let colors = theme.colors

        return switch intent {
        case .main: .init(
            selectedTintColorToken: colors.main.onMain,
            selectedBackgroundColorToken: colors.main.main
        )

        case .support: .init(
            selectedTintColorToken: colors.support.onSupport,
            selectedBackgroundColorToken: colors.support.support
        )
        }
    }
}
