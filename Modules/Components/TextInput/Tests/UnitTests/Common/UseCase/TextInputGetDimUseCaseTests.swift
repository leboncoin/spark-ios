//
//  TextInputGetDimUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Text Input Get Dim UseCase Tests")
struct TextInputGetDimUseCaseTests {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute when is enabled is true should return none dim")
    func executeWhenIsEnabledIsTrueShouldReturnNoneDim() {
        // GIVEN
        let useCase = TextInputGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            isEnabled: true
        )

        // THEN
        #expect(result == self.themeMock.dims.none)
    }

    @Test("Execute when is enabled is false should return dim 3")
    func executeWhenIsEnabledIsFalseShouldReturnDim3() {
        // GIVEN
        let useCase = TextInputGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            isEnabled: false
        )

        // THEN
        #expect(result == self.themeMock.dims.dim3)
    }
}
