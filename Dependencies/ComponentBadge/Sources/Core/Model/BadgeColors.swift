//
//  BadgeColors.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 09/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct BadgeColors: Equatable {

    // MARK: - Properties

    var background: any ColorToken = ColorTokenClear()
    var border: any ColorToken = ColorTokenClear()
    var foreground: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.background.equals(rhs.background) &&
        lhs.border.equals(rhs.border) &&
        lhs.foreground.equals(rhs.foreground)
    }
}
