//
//  CardTypographies.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 11/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct CardTypographies: Equatable {

    // MARK: - Properties

    var headerFontToken: any TypographyFontToken = TypographyFontTokenClear()

    // MARK: - Equatable

    static func == (lhs: CardTypographies, rhs: CardTypographies) -> Bool {
        return lhs.headerFontToken.font == rhs.headerFontToken.font &&
        lhs.headerFontToken.uiFont == rhs.headerFontToken.uiFont
    }
}
