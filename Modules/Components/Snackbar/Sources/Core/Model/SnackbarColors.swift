//
//  SnackbarColors.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct SnackbarColors: Equatable {

    // MARK: - Properties

    var tintColorToken: any ColorToken = ColorTokenClear()
    var backgroundColorToken: any ColorToken = ColorTokenClear()
    var borderColorToken: any ColorToken = ColorTokenClear()
}

// MARK: Hashable & Equatable

extension SnackbarColors {

    static func == (lhs: SnackbarColors, rhs: SnackbarColors) -> Bool {
        return lhs.tintColorToken.equals(rhs.tintColorToken) &&
        lhs.backgroundColorToken.equals(rhs.backgroundColorToken) &&
        lhs.borderColorToken.equals(rhs.borderColorToken)
    }
}
