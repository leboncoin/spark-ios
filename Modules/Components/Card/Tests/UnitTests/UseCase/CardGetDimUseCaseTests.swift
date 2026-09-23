//
//  CardGetDimUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

@Suite("Card Get Dim Use Case Tests")
struct CardGetDimUseCaseTests {

    // MARK: - Properties

    private let useCase = CardGetDimUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute with enabled true")
    func executeWithEnabledTrue() {
        // GIVEN
        let isEnabled = true

        // WHEN
        let dim = self.useCase.execute(
            theme: self.theme,
            isEnabled: isEnabled
        )

        // THEN
        #expect(dim == self.theme.dims.none)
    }

    @Test("Execute with enabled false")
    func executeWithEnabledFalse() {
        // GIVEN
        let isEnabled = false

        // WHEN
        let dim = self.useCase.execute(
            theme: self.theme,
            isEnabled: isEnabled
        )

        // THEN
        #expect(dim == self.theme.dims.dim3)
    }
}
