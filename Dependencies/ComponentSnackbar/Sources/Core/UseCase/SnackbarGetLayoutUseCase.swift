//
//  SnackbarGetLayoutUseCase.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SnackbarGetLayoutUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> SnackbarLayout
}

struct SnackbarGetLayoutUseCase: SnackbarGetLayoutUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> SnackbarLayout {
        let layout = theme.layout

        return SnackbarLayout(
            presentationPadding: layout.spacing.large,
            leadingPadding: layout.spacing.large,
            trailingPadding: layout.spacing.medium,
            horizontalSpacing: layout.spacing.medium,
            verticalPadding: layout.spacing.medium,
            verticalSpacing: layout.spacing.medium,
            verticalSubSpacing: layout.spacing.small
        )
    }
}
