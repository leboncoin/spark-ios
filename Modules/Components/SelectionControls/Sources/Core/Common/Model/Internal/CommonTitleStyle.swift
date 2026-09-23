//
//  CommonTitleStyle.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 30/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct CommonTitleStyle: Equatable {

    // MARK: - Properties

    var typography: any TypographyFontToken = TypographyFontTokenClear()
    var color: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: CommonTitleStyle, rhs: CommonTitleStyle) -> Bool {
        return lhs.typography.equals(rhs.typography) &&
        lhs.color.equals(rhs.color)
    }
}
