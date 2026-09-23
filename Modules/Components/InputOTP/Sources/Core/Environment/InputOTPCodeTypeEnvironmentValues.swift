//
//  InputOTPCodeTypeEnvironmentValues.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 05/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var inputOTPCodeType: InputOTPCodeType = .default
}

public extension View {

    /// Set the **code type** on the ``SparkInputOTP``.
    ///
    /// The default value for this property is *InputOTPCodeType.default*.
    func sparkInputOTPCodeType(_ codeType: InputOTPCodeType) -> some View {
        self.environment(\.inputOTPCodeType, codeType)
    }
}
