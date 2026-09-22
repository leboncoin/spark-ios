//
//  CardGetHeaderColorsUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 11/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CardGetHeaderColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: CardIntent,
        variant: CardVariant,
        headerPosition: CardHeaderPosition
    ) -> CardHeaderColors
}

struct CardGetHeaderColorsUseCase: CardGetHeaderColorsUseCaseable {

    // MARK: - Properties

    private let getBannerOutlinedColorsUseCase: CardGetHeaderVariantColorsUseCaseable
    private let getBorderOutlinedColorsUseCase: CardGetHeaderVariantColorsUseCaseable
    private let getTintedColorsUseCase: CardGetHeaderVariantColorsUseCaseable

    // MARK: - Initialization

    init(
        getBannerOutlinedColorsUseCase: CardGetHeaderVariantColorsUseCaseable = CardGetHeaderBannerOutlinedColorsUseCase(),
        getBorderOutlinedColorsUseCase: CardGetHeaderVariantColorsUseCaseable = CardGetHeaderBorderOutlinedColorsUseCase(),
        getTintedColorsUseCase: CardGetHeaderVariantColorsUseCaseable = CardGetHeaderTintedColorsUseCase()
    ) {
        self.getBannerOutlinedColorsUseCase = getBannerOutlinedColorsUseCase
        self.getBorderOutlinedColorsUseCase = getBorderOutlinedColorsUseCase
        self.getTintedColorsUseCase = getTintedColorsUseCase
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: CardIntent,
        variant: CardVariant,
        headerPosition: CardHeaderPosition
    ) -> CardHeaderColors {
        return switch (variant, headerPosition) {
        case (.outlined, .banner):
            self.getBannerOutlinedColorsUseCase.execute(
                theme: theme,
                intent: intent
            )
        case (.outlined, .border):
            self.getBorderOutlinedColorsUseCase.execute(
                theme: theme,
                intent: intent
            )
        default:
            self.getTintedColorsUseCase.execute(
                theme: theme,
                intent: intent
            )
        }
    }
}
