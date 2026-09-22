//
//  InputOTPOnErrorEnvironmentValues.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var inputOTPOnError: Bool = false
}

public extension View {

    /// Set the **on error** state on the ``SparkInputOTP``.
    ///
    /// The default value for this property is *false*.
    func sparkInputOTPOnError(_ onError: Bool) -> some View {
        self.environment(\.inputOTPOnError, onError)
    }
}
