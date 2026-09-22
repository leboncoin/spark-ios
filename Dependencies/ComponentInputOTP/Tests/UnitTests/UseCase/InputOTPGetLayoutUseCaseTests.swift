//
//  InputOTPGetLayoutUseCaseTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Input OTP Get Layout Use Case Tests")
struct InputOTPGetLayoutUseCaseTests {

    // MARK: - Properties

    let sut: InputOTPGetLayoutUseCase

    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = InputOTPGetLayoutUseCase()
    }

    // MARK: - Tests

    @Test("Execute returns expected layout")
    func executeReturnsExpectedLayout() throws {
        // GIVEN / WHEN
        let layout = self.sut.execute(theme: self.theme)

        // THEN
        #expect(layout.spacing == self.theme.layout.spacing.medium)
        #expect(layout.padding == self.theme.layout.spacing.medium)
    }
}
