//
//  InputOTPGetColorsUseCaseTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Input OTP Get Colors Use Case Tests")
struct InputOTPGetColorsUseCaseTests {

    // MARK: - Properties

    let sut: InputOTPGetColorsUseCase

    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = InputOTPGetColorsUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns expected colors")
    func executeReturnsExpectedColors() throws {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme)

        // THEN
        #expect(colors.separatorColorToken.equals(self.theme.colors.base.outline))
    }
}
