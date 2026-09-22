//
//  SnackbarGetBorderUseCase.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol SnackbarGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme) -> SnackbarBorder
}

struct SnackbarGetBorderUseCase: SnackbarGetBorderUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme) -> SnackbarBorder {
        let border = theme.border

        return SnackbarBorder(
            width: border.width.small,
            radius: border.radius.large
        )
    }
}
