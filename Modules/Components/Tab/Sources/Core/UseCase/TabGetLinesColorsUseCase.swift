//
//  TabGetLinesColorsUseCase.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TabGetLinesColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, intent: TabIntent) -> TabLinesColors
}

struct TabGetLinesColorsUseCase: TabGetLinesColorsUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, intent: TabIntent) -> TabLinesColors {
        let colors = theme.colors

        let selectedColorToken: any ColorToken = switch intent {
        case .main: colors.main.main
        case .support: colors.support.support
        }

        return TabLinesColors(
            colorToken: colors.base.outline,
            selectedColorToken: selectedColorToken
        )
    }
}
