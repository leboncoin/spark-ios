//
//  CardGetTypographiesUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 11/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol CardGetTypographiesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        headerPosition: CardHeaderPosition
    ) -> CardTypographies
}

struct CardGetTypographiesUseCase: CardGetTypographiesUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        headerPosition: CardHeaderPosition
    ) -> CardTypographies {
        let typography = theme.typography

        return switch headerPosition {
        case .banner: .init(headerFontToken: typography.body2Highlight)
        case .border: .init(headerFontToken: typography.captionHighlight)
        }
    }
}
