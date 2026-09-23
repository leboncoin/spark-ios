//
//  ChipColors.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct ChipColors: Equatable {

    // MARK: - Properties

    var background: any ColorToken = ColorTokenClear()
    var border: any ColorToken = ColorTokenClear()
    var content: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.background.equals(rhs.background) &&
        lhs.border.equals(rhs.border) &&
        lhs.content.equals(rhs.content)
    }
}
