//
//  InputOTPGetDimUseCaseTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentInputOTP
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Input OTP Get Dim Use Case Tests")
struct InputOTPGetDimUseCaseTests {

    // MARK: - Properties

    let sut: InputOTPGetDimUseCase

    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = InputOTPGetDimUseCase()
    }

    // MARK: - Tests

    @Test("Is enabled true")
    func isEnabledTrue() throws {
        // GIVEN / WHEN
        let dim = self.sut.execute(
            theme: self.theme,
            isEnabled: true
        )

        // THEN
        #expect(dim == self.theme.dims.none)
    }

    @Test("Is enabled false")
    func isEnabledFalse() throws {
        // GIVEN / WHEN
        let dim = self.sut.execute(
            theme: self.theme,
            isEnabled: false
        )

        // THEN
        #expect(dim == self.theme.dims.dim3)
    }
}
