//
//  AvatarTypographies.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct AvatarTypographies: Equatable {

    // MARK: - Properties

    var placeholderFontToken: any TypographyFontToken = TypographyFontTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.placeholderFontToken.equals(rhs.placeholderFontToken)
    }
}
