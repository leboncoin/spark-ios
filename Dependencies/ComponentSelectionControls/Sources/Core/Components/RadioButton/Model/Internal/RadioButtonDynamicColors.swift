//
//  RadioButtonDynamicColors.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct RadioButtonDynamicColors: Equatable {

    // MARK: - Properties

    var circle: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: RadioButtonDynamicColors, rhs: RadioButtonDynamicColors) -> Bool {
        return lhs.circle.equals(rhs.circle)
    }
}
