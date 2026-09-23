//
//  ToggleDynamicColors.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct ToggleDynamicColors: Equatable {

    // MARK: - Properties

    var background: any ColorToken = ColorTokenClear()
    var dotForeground: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: ToggleDynamicColors, rhs: ToggleDynamicColors) -> Bool {
        return lhs.background.equals(rhs.background) &&
        lhs.dotForeground.equals(rhs.dotForeground)
    }
}
