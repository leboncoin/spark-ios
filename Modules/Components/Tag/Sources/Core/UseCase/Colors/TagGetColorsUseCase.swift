//
//  TagGetColorsUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 29/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TagGetColorsUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        intent: TagIntent,
        variant: TagVariant
    ) -> TagColors
}

struct TagGetColorsUseCase: TagGetColorsUseCaseable {

    // MARK: - Properties

    private let filledUseCase: any TagGetColorsVariantUseCaseable
    private let outlinedUseCase: any TagGetColorsVariantUseCaseable
    private let tintedUseCase: any TagGetColorsVariantUseCaseable

    // MARK: - Initialization

    init(
        filledUseCase: any TagGetColorsVariantUseCaseable = TagGetColorsFilledUseCase(),
        outlinedUseCase: any TagGetColorsVariantUseCaseable = TagGetColorsOutlinedUseCase(),
        tintedUseCase: any TagGetColorsVariantUseCaseable = TagGetColorsTintedUseCase()
    ) {
        self.filledUseCase = filledUseCase
        self.outlinedUseCase = outlinedUseCase
        self.tintedUseCase = tintedUseCase
    }

    // MARK: - Methods

    func execute(
        theme: any Theme,
        intent: TagIntent,
        variant: TagVariant
    ) -> TagColors {
        return switch variant {
        case .filled:
            self.filledUseCase.execute(theme: theme, intent: intent)

        case .outlined:
            self.outlinedUseCase.execute(theme: theme, intent: intent)

        case .tinted:
            self.tintedUseCase.execute(theme: theme, intent: intent)
        }
    }
}
