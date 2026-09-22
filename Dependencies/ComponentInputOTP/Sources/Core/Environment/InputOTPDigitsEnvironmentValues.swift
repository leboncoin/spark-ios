//
//  InputOTPDigitsEnvironmentValues.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var inputOTPDigits: InputOTPDigits = .default
}

public extension View {

    /// Set the **digits** on the ``SparkInputOTP``.
    ///
    /// The default value for this property is *InputOTPDigits.default*.
    func sparkInputOTPDigits(_ digits: InputOTPDigits) -> some View {
        self.environment(\.inputOTPDigits, digits)
    }
}
