//
//  CircularMeterTypographies.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct CircularMeterTypographies: Equatable {

    // MARK: - Properties

    var valueFontToken: any TypographyFontToken = TypographyFontTokenClear()
    var contentFontToken: any TypographyFontToken = TypographyFontTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.valueFontToken.equals(rhs.valueFontToken) &&
        lhs.contentFontToken.equals(rhs.contentFontToken)
    }
}
