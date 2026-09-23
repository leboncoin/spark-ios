//
//  SegmentedControlColors.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct SegmentedControlColors: Equatable {

    // MARK: - Properties

    var backgroundColorToken: any ColorToken = ColorTokenClear()
    var borderColorToken: any ColorToken = ColorTokenClear()
    var separatorColorToken: any ColorToken = ColorTokenClear()
    var selectedItemBackgroundColorToken: any ColorToken = ColorTokenClear()
    var selectedItemBorderColorToken: any ColorToken = ColorTokenClear()
    var accessibilitySelectedTintColorToken: any ColorToken = ColorTokenClear()
    var accessibilitySelectedBackgroundColorToken: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.backgroundColorToken.equals(rhs.backgroundColorToken) &&
            lhs.borderColorToken.equals(rhs.borderColorToken) &&
            lhs.separatorColorToken.equals(rhs.separatorColorToken) &&
            lhs.selectedItemBackgroundColorToken.equals(rhs.selectedItemBackgroundColorToken) &&
            lhs.selectedItemBorderColorToken.equals(rhs.selectedItemBorderColorToken) &&
            lhs.accessibilitySelectedTintColorToken.equals(rhs.accessibilitySelectedTintColorToken) &&
            lhs.accessibilitySelectedBackgroundColorToken.equals(rhs.accessibilitySelectedBackgroundColorToken)
    }
}
