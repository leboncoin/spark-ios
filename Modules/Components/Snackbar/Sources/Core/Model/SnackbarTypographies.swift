//
//  SnackbarTypographies.swift
//  SparkComponentSnackbar
//
//  Created by robin.lemaire on 13/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkTheming

struct SnackbarTypographies: Equatable {

    // MARK: - Properties

    var titleFontToken: any TypographyFontToken = TypographyFontTokenClear()
    var descriptionFontToken: any TypographyFontToken = TypographyFontTokenClear()
}

// MARK: - Hashable & Equatable

extension SnackbarTypographies {

    static func == (lhs: SnackbarTypographies, rhs: SnackbarTypographies) -> Bool {
        return lhs.titleFontToken.equals(rhs.titleFontToken) &&
        lhs.descriptionFontToken.equals(rhs.descriptionFontToken)
    }
}
