//
//  CardColors.swift
//  SparkComponentCard
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct CardColors: Equatable {

    // MARK: - Properties

    var background: any ColorToken = ColorTokenClear()
    var foreground: any ColorToken = ColorTokenClear()
    var dimBackground: any ColorToken = ColorTokenClear()
    var border: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.background.equals(rhs.background) &&
        lhs.foreground.equals(rhs.foreground) &&
        lhs.dimBackground.equals(rhs.dimBackground) &&
        lhs.border.equals(rhs.border)
    }
}
