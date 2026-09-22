//
//  RatingColors.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct RatingColors: Equatable {

    // MARK: - Properties

    var filledStarTintColorToken: any ColorToken = ColorTokenClear()
    var strokeStarTintColorToken: any ColorToken = ColorTokenClear()
}

// MARK: Hashable & Equatable

extension RatingColors {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.filledStarTintColorToken)
        hasher.combine(self.strokeStarTintColorToken)
    }

    static func == (lhs: RatingColors, rhs: RatingColors) -> Bool {
        return lhs.filledStarTintColorToken.equals(rhs.filledStarTintColorToken) &&
        lhs.strokeStarTintColorToken.equals(rhs.strokeStarTintColorToken)
    }
}
