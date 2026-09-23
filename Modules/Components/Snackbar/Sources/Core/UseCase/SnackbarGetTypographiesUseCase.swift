//
//  SnackbarGetTypographiesUseCase.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SnackbarGetTypographiesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> SnackbarTypographies
}

struct SnackbarGetTypographiesUseCase: SnackbarGetTypographiesUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> SnackbarTypographies {
        let typography = theme.typography

        return SnackbarTypographies(
            titleFontToken: typography.body1Highlight,
            descriptionFontToken: typography.body2
        )
    }
}
