//
//  String+LocalizedExtension.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 09/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension String {

    // MARK: - Accessibility Actions

    static let accessibilityClearAllAction = String(key: "accessibility_clear_all_action")
    static let accessibilityPasteAction = String(key: "accessibility_paste_action")

    // MARK: - Accessibility Label

    static func accessibilityInputOTPLabel(
        digits: Int,
        codeType: InputOTPCodeType
    ) -> String {
        let stringKey = switch codeType {
        case .number:
            String(key: "accessibility_input_otp_label_number")
        case .letter:
            String(key: "accessibility_input_otp_label_letter")
        case .alphanumeric:
            String(key: "accessibility_input_otp_label_alphanumeric")
        }

        return String(
            format: stringKey,
            digits
        )
    }

    // MARK: - Accessibility Value

    static func accessibilityInputOTPValueComplete(
        value: String,
        codeType: InputOTPCodeType
    ) -> String {
        let stringKey = switch codeType {
        case .number:
            String(key: "accessibility_input_otp_value_complete_number")
        case .letter:
            String(key: "accessibility_input_otp_value_complete_letter")
        case .alphanumeric:
            String(key: "accessibility_input_otp_value_complete_alphanumeric")
        }

        return String(
            format: stringKey,
            value
        )
    }

    static func accessibilityInputOTPValueProgress(
        value: String,
        filled: Int,
        total: Int,
        codeType: InputOTPCodeType
    ) -> String {
        let stringKey = switch codeType {
        case .number:
            String(key: "accessibility_input_otp_value_progress_number")
        case .letter:
            String(key: "accessibility_input_otp_value_progress_letter")
        case .alphanumeric:
            String(key: "accessibility_input_otp_value_progress_alphanumeric")
        }

        return String(
            format: stringKey,
            filled,
            total,
            value
        )
    }

    // MARK: - Accessibility Hint

    static func accessibilityInputOTPHintDefault(codeType: InputOTPCodeType) -> String {
        return switch codeType {
        case .number:
            String(key: "accessibility_input_otp_hint_number")
        case .letter:
            String(key: "accessibility_input_otp_hint_letter")
        case .alphanumeric:
            String(key: "accessibility_input_otp_hint_alphanumeric")
        }
    }

    static let accessibilityInputOTPHintError = String(key: "accessibility_input_otp_hint_error")
    static let accessibilityInputOTPHintComplete = String(key: "accessibility_input_otp_hint_complete")

    // MARK: - Context Menu

    static let contextMenuPasteAction = String(key: "context_menu_paste_action")
}

// MARK: - Extension

private extension String {

    init(key: LocalizationValue) {
        self.init(localized: key, bundle: .current)
    }
}
