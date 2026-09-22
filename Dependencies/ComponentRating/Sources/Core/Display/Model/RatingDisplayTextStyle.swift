//
//  RatingDisplayTextStyles.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct RatingDisplayTextStyle: Equatable {

    // MARK: - Properties

    var fontToken: any TypographyFontToken = TypographyFontTokenClear()
    var colorToken: any ColorToken = ColorTokenClear()
}

// MARK: Hashable & Equatable

extension RatingDisplayTextStyle {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.fontToken)
        hasher.combine(self.colorToken)
    }

    static func == (lhs: RatingDisplayTextStyle, rhs: RatingDisplayTextStyle) -> Bool {
        return lhs.fontToken.equals(rhs.fontToken) &&
        lhs.colorToken.equals(rhs.colorToken)
    }
}
