//
//  SliderTypographies.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct SliderTypographies: Equatable {

    // MARK: - Properties

    var titleFontToken: any TypographyFontToken = TypographyFontTokenClear()
    var valueFontToken: any TypographyFontToken = TypographyFontTokenClear()
    var rangeValuesFontToken: any TypographyFontToken = TypographyFontTokenClear()
}

// MARK: Hashable & Equatable

extension SliderTypographies {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.titleFontToken)
        hasher.combine(self.valueFontToken)
        hasher.combine(self.rangeValuesFontToken)
    }

    static func == (lhs: SliderTypographies, rhs: SliderTypographies) -> Bool {
        return lhs.titleFontToken.equals(rhs.titleFontToken) &&
        lhs.valueFontToken.equals(rhs.valueFontToken) &&
        lhs.rangeValuesFontToken.equals(rhs.rangeValuesFontToken)
    }
}
