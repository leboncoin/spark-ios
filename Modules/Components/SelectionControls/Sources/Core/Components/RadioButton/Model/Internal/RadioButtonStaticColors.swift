//
//  RadioButtonStaticColors.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct RadioButtonStaticColors: Equatable {

    // MARK: - Properties

    var dot: any ColorToken = ColorTokenClear()
    var hover: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: RadioButtonStaticColors, rhs: RadioButtonStaticColors) -> Bool {
        return lhs.dot.equals(rhs.dot) &&
        lhs.hover.equals(rhs.hover)
    }
}
