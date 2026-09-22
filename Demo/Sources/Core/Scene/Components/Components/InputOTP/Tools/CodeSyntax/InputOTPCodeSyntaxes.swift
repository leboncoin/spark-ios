//
//  InputOTPCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 09/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

struct InputOTPCodeSyntaxes {

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic (6 digits)", code: Self.basic),
            .init(title: "With 4 digits", code: Self.fourDigits),
            .init(title: "With 8 digits", code: Self.eightDigits),
            .init(title: "With code type", code: Self.withCodeType),
            .init(title: "With error state", code: Self.withError),
            .init(title: "With completion handler", code: Self.withCompletion),
            .init(title: "Full configuration", code: Self.fullConfiguration)
        ]
    }()

    private static var basic: String {
        """
        SparkInputOTP(value: $otpValue)
            .sparkTheme(theme)
        """
    }

    private static var fourDigits: String {
        """
        SparkInputOTP(value: $otpValue)
            .sparkTheme(theme)
            .sparkInputOTPDigits(.four)
        """
    }

    private static var eightDigits: String {
        """
        SparkInputOTP(value: $otpValue)
            .sparkTheme(theme)
            .sparkInputOTPDigits(.eight)
        """
    }

    private static var withCodeType: String {
        """
        SparkInputOTP(value: $otpValue)
            .sparkTheme(theme)
            .sparkInputOTPCodeType(.alphanumeric)
        """
    }

    private static var withError: String {
        """
        SparkInputOTP(value: $otpValue)
            .sparkTheme(theme)
            .sparkInputOTPOnError(hasError)
        """
    }

    private static var withCompletion: String {
        """
        SparkInputOTP(value: $otpValue) { completedValue in
            // Handle completion
        }
        .sparkTheme(theme)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkInputOTP(value: $otpValue) { completedValue in
            // Handle completion
            validateOTP(completedValue)
        }
        .sparkTheme(theme)
        .sparkInputOTPDigits(.six)
        .sparkInputOTPCodeType(.number)
        .sparkInputOTPOnError(hasError)
        .disabled(isDisabled)
        .accessibilityLabel("Enter verification code")
        """
    }
}
