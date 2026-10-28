//
//  ComponentToken+InputOTP.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

public extension ComponentToken {

    /// The token values of the InputOTP component derived from the theme.
    var inputOTP: InputOTPToken {
        return .init(theme: self.theme)
    }
}
