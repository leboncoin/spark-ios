//
//  InputOTPConfiguration.swift
//  SparkDemo
//
//  Created by robin.lemaire on 09/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
@_spi(SI_SPI) import SparkComponentInputOTP

class InputOTPConfiguration: ComponentConfiguration {

    // MARK: - Properties

    var digits: InputOTPDigits = .default
    var codeType: InputOTPCodeType = .default
    var onError: Bool = false
    var isCompletion: Bool = false

    // MARK: - Initialization

    required init() {
        super.init()

        self.isEnabled.showConfiguration = true
        self.accessibilityLabel.showConfiguration = true
    }

    // MARK: - Methods

    override func random() {
        self.digits = .random
        self.codeType = .random
        self.onError = .random()
        self.isCompletion = .random()
    }
}
