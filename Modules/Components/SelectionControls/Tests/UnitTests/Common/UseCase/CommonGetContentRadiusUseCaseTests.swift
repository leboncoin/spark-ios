//
//  CommonGetContentRadiusUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Common Get Content Radius UseCase Tests")
struct CommonGetContentRadiusUseCaseTests {

    // MARK: - Tests

    @Test("Execute for checkbox type returns full radius")
    func executeForCheckboxTypeReturnsFullRadius() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetContentRadiusUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            type: .checkbox
        )

        // THEN
        #expect(result == theme.border.radius.small)
    }

    @Test("Execute for radio button type returns full radius")
    func executeForRadioButtonTypeReturnsFullRadius() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetContentRadiusUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            type: .radioButton
        )

        // THEN
        #expect(result == theme.border.radius.full)
    }

    @Test("Execute for toggle type returns full radius")
    func executeForToggleTypeReturnsFullRadius() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetContentRadiusUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            type: .toggle
        )

        // THEN
        #expect(result == theme.border.radius.full)
    }
}
