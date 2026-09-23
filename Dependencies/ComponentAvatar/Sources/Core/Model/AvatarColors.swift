//
//  AvatarColors.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 29/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct AvatarColors: Equatable {

    // MARK: - Properties

    var backgroundColorToken: any ColorToken = ColorTokenClear()
    var borderColorToken: any ColorToken = ColorTokenClear()
    var placeholderTintColorToken: any ColorToken = ColorTokenClear()
    var actionBackgroundColorToken: any ColorToken = ColorTokenClear()
    var actionTintColorToken: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.backgroundColorToken.equals(rhs.backgroundColorToken) &&
        lhs.borderColorToken.equals(rhs.borderColorToken) &&
        lhs.placeholderTintColorToken.equals(rhs.placeholderTintColorToken) &&
        lhs.actionBackgroundColorToken.equals(rhs.actionBackgroundColorToken) &&
        lhs.actionTintColorToken.equals(rhs.actionTintColorToken)
    }
}
