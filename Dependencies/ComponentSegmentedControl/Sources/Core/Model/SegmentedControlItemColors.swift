//
//  SegmentedControlItemColors.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct SegmentedControlItemColors: Equatable {

    // MARK: - Properties

    var backgroundColorToken: any ColorToken = ColorTokenClear()
    var contentColorToken: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.backgroundColorToken.equals(rhs.backgroundColorToken) &&
            lhs.contentColorToken.equals(rhs.contentColorToken)
    }
}
