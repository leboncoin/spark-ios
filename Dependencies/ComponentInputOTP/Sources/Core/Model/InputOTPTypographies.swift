//
//  InputOTPTypographies.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct InputOTPTypographies: Equatable {

    // MARK: - Properties

    var contentFontToken: any TypographyFontToken = TypographyFontTokenClear()

    // MARK: - Equatable

    static func == (lhs: InputOTPTypographies, rhs: InputOTPTypographies) -> Bool {
        return lhs.contentFontToken.font == rhs.contentFontToken.font &&
        lhs.contentFontToken.uiFont == rhs.contentFontToken.uiFont
    }
}
