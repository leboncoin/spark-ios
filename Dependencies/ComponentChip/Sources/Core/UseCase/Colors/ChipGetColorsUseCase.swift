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

    // MARK: - Properties

    private let getStateOutlinedColorsUseCase: ChipGetStateColorsUseCaseable
    private let getStateTintedColorsUseCase: ChipGetStateColorsUseCaseable

    // MARK: - Initialization

    init(
        getStateOutlinedColorsUseCase: ChipGetStateColorsUseCaseable = ChipGetStateOutlinedColorsUseCase(),
        getStateTintedColorsUseCase: ChipGetStateColorsUseCaseable = ChipGetStateTintedColorsUseCase()
    ) {
        self.getStateOutlinedColorsUseCase = getStateOutlinedColorsUseCase
        self.getStateTintedColorsUseCase = getStateTintedColorsUseCase
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: ChipIntent,
        variant: ChipVariant,
        isSelected: Bool,
        isPressed: Bool
    ) -> ChipColors {
        let stateColors = switch variant {
        case .dashed, .outlined:
            self.getStateOutlinedColorsUseCase.execute(
                theme: theme,
                intent: intent
            )
        case .tinted:
            self.getStateTintedColorsUseCase.execute(
                theme: theme,
                intent: intent
            )
        }

        return switch (isSelected, isPressed) {
            // Pressed
        case (_, true): .init(
            background: stateColors.pressedBackground,
            border: stateColors.pressedBorder,
            content: stateColors.content
        )

            // Selected
        case (true, false): .init(
            background: stateColors.selectedBackground,
            border: stateColors.selectedBorder,
            content: stateColors.selectedContent
        )

            // Other
        case (false, false): .init(
            background: stateColors.background,
            border: stateColors.border,
            content: stateColors.content
        )
        }
    }
}
