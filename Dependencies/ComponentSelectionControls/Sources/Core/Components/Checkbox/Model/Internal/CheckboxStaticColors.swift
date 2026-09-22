//
//  CheckboxStaticColors.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct CheckboxStaticColors: Equatable {

    // MARK: - Properties

    var iconForeground: any ColorToken = ColorTokenClear()
    var hover: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: CheckboxStaticColors, rhs: CheckboxStaticColors) -> Bool {
        return lhs.iconForeground.equals(rhs.iconForeground) &&
        lhs.hover.equals(rhs.hover)
    }
}
