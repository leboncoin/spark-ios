//
//  AwarenessCardGetTypographiesUseCase.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol AwarenessCardGetTypographiesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> AwarenessCardTypographies
}

struct AwarenessCardGetTypographiesUseCase: AwarenessCardGetTypographiesUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> AwarenessCardTypographies {
        let typography = theme.typography

        return .init(
            titleFontToken: typography.subhead,
            descriptionFontToken: typography.body1
        )
    }
}
