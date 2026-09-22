//
//  View+AccessibilityLabelExtension.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 09/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    func accessibilityLabel(
        digits: InputOTPDigits,
        codeType: InputOTPCodeType
    ) -> some View {
        let label = String.accessibilityInputOTPLabel(
            digits: digits.rawValue,
            codeType: codeType
        )

        return self.accessibilityLabel(label)
    }
}
