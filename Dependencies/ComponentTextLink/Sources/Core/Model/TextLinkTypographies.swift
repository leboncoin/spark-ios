//
//  TextLinkTypographies.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct TextLinkTypographies: Equatable {

    // MARK: - Properties

    var normal: any TypographyFontToken = TypographyFontTokenClear()
    var highlight: any TypographyFontToken = TypographyFontTokenClear()

    // MARK: - Equatable

    static func == (lhs: TextLinkTypographies, rhs: TextLinkTypographies) -> Bool {
        return lhs.normal.font == rhs.normal.font &&
        lhs.normal.uiFont == rhs.normal.uiFont &&
        lhs.highlight.font == rhs.highlight.font &&
        lhs.highlight.uiFont == rhs.highlight.uiFont
    }
}
