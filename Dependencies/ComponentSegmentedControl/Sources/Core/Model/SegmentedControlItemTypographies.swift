//
//  SegmentedControlItemTypographies.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct SegmentedControlItemTypographies: Equatable {

    // MARK: - Properties

    var textFontToken: any TypographyFontToken = TypographyFontTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.textFontToken.equals(rhs.textFontToken)
    }
}
