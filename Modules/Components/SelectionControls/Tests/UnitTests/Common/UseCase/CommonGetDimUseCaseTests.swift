//
//  CommonGetDimUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Common Get Dim UseCase Tests")
struct CommonGetDimUseCaseTests {

    // MARK: - Tests

    @Test("Execute when enabled returns none dim")
    func executeWhenEnabledReturnsNoneDim() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            isEnabled: true
        )

        // THEN
        #expect(result == theme.dims.none)
    }

    @Test("Execute when disabled returns dim 3")
    func executeWhenDisabledReturnsDim3() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            isEnabled: false
        )

        // THEN
        #expect(result == theme.dims.dim3)
    }
}
