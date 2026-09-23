//
//  SliderColors.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct SliderColors: Equatable {

    // MARK: - Properties

    var tintColorToken: any ColorToken = ColorTokenClear()
    var titleColorToken: any ColorToken = ColorTokenClear()
    var valueColorToken: any ColorToken = ColorTokenClear()
    var rangeValuesColorToken: any ColorToken = ColorTokenClear()
}

// MARK: Hashable & Equatable

extension SliderColors {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.tintColorToken)
        hasher.combine(self.titleColorToken)
        hasher.combine(self.valueColorToken)
        hasher.combine(self.rangeValuesColorToken)
    }

    static func == (lhs: SliderColors, rhs: SliderColors) -> Bool {
        return lhs.tintColorToken.equals(rhs.tintColorToken) &&
        lhs.titleColorToken.equals(rhs.titleColorToken) &&
        lhs.valueColorToken.equals(rhs.valueColorToken) &&
        lhs.rangeValuesColorToken.equals(rhs.rangeValuesColorToken)
    }
}
