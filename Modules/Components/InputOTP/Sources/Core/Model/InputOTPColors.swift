//
//  InputOTPColors.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 03/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct InputOTPColors: Equatable {

    // MARK: - Properties

    var separatorColorToken: any ColorToken = ColorTokenClear()

    // MARK: - Equatable

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.separatorColorToken.equals(rhs.separatorColorToken)
    }
}
