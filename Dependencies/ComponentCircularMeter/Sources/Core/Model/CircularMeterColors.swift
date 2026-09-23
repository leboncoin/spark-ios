//
//  CircularMeterColors.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct CircularMeterColors: Equatable {

    // MARK: - Properties

    var trackColorToken: any ColorToken = ColorTokenClear()
    var indicatorColorToken: any ColorToken = ColorTokenClear()
    var iconColorToken: any ColorToken = ColorTokenClear()
    var valueColorToken: any ColorToken = ColorTokenClear()
    var contentColorToken: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.trackColorToken.equals(rhs.trackColorToken) &&
        lhs.indicatorColorToken.equals(rhs.indicatorColorToken) &&
        lhs.iconColorToken.equals(rhs.iconColorToken) &&
        lhs.valueColorToken.equals(rhs.valueColorToken) &&
        lhs.contentColorToken.equals(rhs.contentColorToken)
    }
}
