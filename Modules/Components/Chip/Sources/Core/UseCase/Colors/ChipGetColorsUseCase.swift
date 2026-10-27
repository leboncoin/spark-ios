//
//  ChipGetColorsUseCase.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ChipGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: ChipIntent,
        variant: ChipVariant,
        isSelected: Bool,
        isPressed: Bool
    ) -> ChipColors
}

final class ChipGetColorsUseCase: ChipGetColorsUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: ChipIntent,
        variant: ChipVariant,
        isSelected: Bool,
        isPressed: Bool
    ) -> ChipColors {
        let token = ChipToken.Colors(theme: theme)

        return .init(
            background: token.background(
                intent: intent,
                variant: variant,
                isSelected: isSelected,
                isPressed: isPressed
            ),
            border: token.border(
                intent: intent,
                variant: variant,
                isSelected: isSelected,
                isPressed: isPressed
            ),
            content: token.content(
                intent: intent,
                variant: variant,
                isSelected: isSelected,
                isPressed: isPressed
            )
        )
    }
}
