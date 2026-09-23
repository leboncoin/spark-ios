//
//  DividerGetColorsUseCase.swift
//  SparkComponentDivider
//
//  Created by robin.lemaire on 12/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol DividerGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: DividerIntent
    ) -> DividerColors
}

struct DividerGetColorsUseCase: DividerGetColorsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: DividerIntent
    ) -> DividerColors {
        let colors = theme.colors

        let separatorColor = switch intent {
        case .outline: colors.base.outline
        case .outlineHigh: colors.base.outlineHigh
        default: colors.base.outline
        }

        return .init(
            text: colors.base.onSurface,
            separator: separatorColor
        )
    }
}
