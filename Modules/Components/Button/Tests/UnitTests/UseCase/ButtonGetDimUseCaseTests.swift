//
//  ButtonGetDimUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Dim Use Case Tests")
struct ButtonGetDimUseCaseTests {

    // MARK: - Properties

    let sut: ButttonGetDimUseCase

    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = ButttonGetDimUseCase()
    }

    // MARK: - Tests

    @Test("Is enabled true")
    func isEnabledTrue() throws {
        // GIVEN / WHEN
        let dim = self.sut.execute(theme: self.theme, isEnabled: true)

        // THEN
        #expect(dim == self.theme.dims.none)
    }

    @Test("Is enabled false")
    func isEnabledFalse() throws {
        // GIVEN / WHEN
        let dim = self.sut.execute(theme: self.theme, isEnabled: false)

        // THEN
        #expect(dim == self.theme.dims.dim3)
    }
}
