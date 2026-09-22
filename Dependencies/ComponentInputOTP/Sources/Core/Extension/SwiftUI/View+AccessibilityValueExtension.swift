//
//  View+AccessibilityValueExtension.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 09/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

extension View {

    func accessibilityValue(
        value: String,
        digits: InputOTPDigits,
        codeType: InputOTPCodeType,
        onError: Bool
    ) -> some View {
        let filledCount = value.count
        let totalCount = digits.rawValue

        let value: String = if filledCount == 0 {
            ""
        } else if filledCount == totalCount {
            String.accessibilityInputOTPValueComplete(
                value: value,
                codeType: codeType
            )
        } else {
            String.accessibilityInputOTPValueProgress(
                value: value,
                filled: filledCount,
                total: totalCount,
                codeType: codeType
            )
        }

        return self.accessibilityValue(value)
    }
}
