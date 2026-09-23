//
//  ChipGetColorsUseCaseDeprecated.swift
//  SparkDemo
//
//  Created by michael.zimmermann on 03.05.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI
import Foundation
import SparkTheming

/// A use case to calculate the colors of a chip depending on the theme, variant and intent
// sourcery: AutoMockable
protocol ChipGetColorsUseCaseDeprecatedable {
    /// Function `execute` calculates the chip colors
    ///
    /// Parameters:
    ///   - theme: The spark theme.
    ///   - variant: The variant of the chip, if it is outlined, filled, etc.
    ///   - intent: The intent color, e.g. main, support.
    ///   - state: The current state of the chip
    /// Returns:
    ///       ChipColors: all the colors used for the chip
    func execute(theme: any Theme,
                 variant: ChipVariant,
                 intent: ChipIntent,
                 state: ChipState
    ) -> ChipStateColorsDeprecated
}

/// ChipGetColorsUseCaseDeprecated: A use case to calculate the colors of a chip depending on the theme, variand and intent
struct ChipGetColorsUseCaseDeprecated: ChipGetColorsUseCaseDeprecatedable {
    // MARK: - Properties
    private let outlinedIntentColorsUseCase: any ChipGetIntentColorsUseCaseableDeprecated
    private let tintedIntentColorsUseCase: any ChipGetIntentColorsUseCaseableDeprecated

    // MARK: - Initializer
    /// Initializer
    ///
    /// Parameters:
    /// - outlinedIntentColorsUseCase: A use case to calculate the intent colors of outlined chips.
    /// - tintedIntentColorsUseCase: A use case to calculate the intent colors of tinted chips.
    init(outlinedIntentColorsUseCase: any ChipGetIntentColorsUseCaseableDeprecated = ChipGetOutlinedIntentColorsUseCaseDeprecated(),
         tintedIntentColorsUseCase: any ChipGetIntentColorsUseCaseableDeprecated = ChipGetTintedIntentColorsUseCaseDeprecated()
    ) {
        self.outlinedIntentColorsUseCase = outlinedIntentColorsUseCase
        self.tintedIntentColorsUseCase = tintedIntentColorsUseCase

    }

    // MARK: - Functions

    /// The funcion execute calculates the chip colors based on the parameters.
    ///
    /// Parameters:
    /// - theme: The current theme to be used
    /// - variant: The variant of the chip, whether it's filled, outlined, etc.
    /// - intent: The intent color of the chip, e.g. main, support
    /// - state: The current state of the chip, e.g. selected, enabled, pressed
    func execute(theme: any Theme,
                 variant: ChipVariant,
                 intent: ChipIntent,
                 state: ChipState) -> ChipStateColorsDeprecated {

        let intentUseCase: ChipGetIntentColorsUseCaseableDeprecated = variant == .tinted ? self.tintedIntentColorsUseCase : self.outlinedIntentColorsUseCase

        let colors = intentUseCase.execute(theme: theme, intent: intent)

        if state.isPressed {
            return .init(
                background: colors.pressedBackground,
                border: colors.border,
                foreground: colors.text)
        }

        var stateColors = ChipStateColorsDeprecated(
            background: colors.background,
            border: colors.border,
            foreground: colors.text)

        if state.isSelected {
            stateColors.background = colors.selectedBackground
            stateColors.foreground = colors.selectedText
        }

        if state.isDisabled {
            if let backgroundColor = colors.disabledBackground {
                stateColors.background = backgroundColor
            }
            stateColors.opacity = theme.dims.dim3
        }

        return stateColors
    }
}
