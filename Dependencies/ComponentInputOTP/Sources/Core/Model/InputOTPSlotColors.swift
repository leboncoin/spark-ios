//
//  InputOTPSlotColors.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct InputOTPSlotColors: Equatable {

    // MARK: - Properties

    var contentColorToken: any ColorToken = ColorTokenClear()
    var borderColorToken: any ColorToken = ColorTokenClear()
    var backgroundColorToken: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.contentColorToken.equals(rhs.contentColorToken) &&
        lhs.borderColorToken.equals(rhs.borderColorToken) &&
        lhs.backgroundColorToken.equals(rhs.backgroundColorToken)
    }
}
