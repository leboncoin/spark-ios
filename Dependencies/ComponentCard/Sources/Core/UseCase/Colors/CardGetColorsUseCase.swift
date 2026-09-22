//
//  CardGetColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CardGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: CardIntent,
        variant: CardVariant,
        isPressed: Bool
    ) -> CardColors
}

final class CardGetColorsUseCase: CardGetColorsUseCaseable {

    // MARK: - Properties

    private let getStateOutlinedColorsUseCase: CardGetStateColorsUseCaseable
    private let getStateTintedColorsUseCase: CardGetStateColorsUseCaseable

    // MARK: - Initialization

    init(
        getStateOutlinedColorsUseCase: CardGetStateColorsUseCaseable = CardGetStateOutlinedColorsUseCase(),
        getStateTintedColorsUseCase: CardGetStateColorsUseCaseable = CardGetStateTintedColorsUseCase()
    ) {
        self.getStateOutlinedColorsUseCase = getStateOutlinedColorsUseCase
        self.getStateTintedColorsUseCase = getStateTintedColorsUseCase
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: CardIntent,
        variant: CardVariant,
        isPressed: Bool
    ) -> CardColors {
        let colors = theme.colors

        let stateColors = switch variant {
        case .outlined:
            self.getStateOutlinedColorsUseCase.execute(
                theme: theme,
                intent: intent
            )
        case .tinted, .filled:
            self.getStateTintedColorsUseCase.execute(
                theme: theme,
                intent: intent
            )
        }

        let dimBackground = colors.base.surface

        return if isPressed {
            .init(
                background: stateColors.pressedBackground,
                foreground: stateColors.foreground,
                dimBackground: dimBackground,
                border: stateColors.pressedBorder
            )
        } else {
            .init(
                background: stateColors.background,
                foreground: stateColors.foreground,
                dimBackground: dimBackground,
                border: stateColors.border
            )
        }
    }
}
