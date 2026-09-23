//
//  ToggleStaticColors.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 02/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct ToggleStaticColors: Equatable {

    // MARK: - Properties

    var dotBackground: any ColorToken = ColorTokenClear()
    var hover: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: ToggleStaticColors, rhs: ToggleStaticColors) -> Bool {
        return lhs.dotBackground.equals(rhs.dotBackground) &&
        lhs.hover.equals(rhs.hover)
    }
}
