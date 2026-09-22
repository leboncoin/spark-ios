//
//  View+AccessibilityHintExtension.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 09/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    func accessibilityHint(
        value: String,
        digits: InputOTPDigits,
        codeType: InputOTPCodeType,
        onError: Bool
    ) -> some View {
        let hint = if onError {
            String.accessibilityInputOTPHintError
        } else if value.count == digits.rawValue {
            String.accessibilityInputOTPHintComplete
        } else {
            String.accessibilityInputOTPHintDefault(codeType: codeType)
        }

        return self.accessibilityHint(hint)
    }
}
