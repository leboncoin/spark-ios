//
//  InputOTPTypographiesTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Input OTP Typographies Tests")
struct InputOTPTypographiesTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let typographies = InputOTPTypographies()

        // THEN
        #expect(typographies.contentFontToken.font == TypographyFontTokenClear().font)
        #expect(typographies.contentFontToken.uiFont == TypographyFontTokenClear().uiFont)
    }

    @Test("Equality when same typography")
    func equalityWhenSameTypography() {
        // GIVEN / WHEN
        let contentFontToken = TypographyFontTokenGeneratedMock.body()

        let typographies1 = InputOTPTypographies(
            contentFontToken: contentFontToken
        )

        let typographies2 = InputOTPTypographies(
            contentFontToken: contentFontToken
        )

        // THEN
        #expect(typographies1 == typographies2)
    }

    @Test("Inequality when different content font")
    func inequalityWhenDifferentContentFont() {
        // GIVEN / WHEN
        let contentFontToken1 = TypographyFontTokenGeneratedMock.body()
        let contentFontToken2 = TypographyFontTokenGeneratedMock.callout()

        let typographies1 = InputOTPTypographies(
            contentFontToken: contentFontToken1
        )

        let typographies2 = InputOTPTypographies(
            contentFontToken: contentFontToken2
        )

        // THEN
        #expect(typographies1 != typographies2)
    }
}
