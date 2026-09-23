//
//  InputOTPGetTypographiesUseCaseTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Input OTP Get Typographies Use Case Tests")
struct InputOTPGetTypographiesUseCaseTests {

    // MARK: - Properties

    let sut: InputOTPGetTypographiesUseCase

    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = InputOTPGetTypographiesUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns expected typographies")
    func executeReturnsExpectedTypographies() throws {
        // GIVEN / WHEN
        let typographies = self.sut.execute(theme: self.theme)

        // THEN
        #expect(typographies.contentFontToken.font == self.theme.typography.display3.font)
        #expect(typographies.contentFontToken.uiFont == self.theme.typography.display3.uiFont)
    }
}
