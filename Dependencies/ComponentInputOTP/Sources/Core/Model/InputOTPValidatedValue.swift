//
//  InputOTPValidatedValue.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct InputOTPValidatedValue: Equatable {

    // MARK: - Properties

    var value: String
    // Indicate if the value passed contains invalid character.
    var hadInvalidCharacters: Bool = false
}
