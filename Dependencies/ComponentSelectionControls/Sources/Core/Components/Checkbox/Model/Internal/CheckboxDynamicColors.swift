//
//  CheckboxDynamicColors.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct CheckboxDynamicColors: Equatable {

    // MARK: - Properties

    var background: any ColorToken = ColorTokenClear()
    var border: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: CheckboxDynamicColors, rhs: CheckboxDynamicColors) -> Bool {
        return lhs.background.equals(rhs.background) &&
        lhs.border.equals(rhs.border)
    }
}
