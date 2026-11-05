//
//  StepperGetTextStyleUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentStepper
@testable import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Stepper Get Text Style UseCase Tests")
struct StepperGetTextStyleUseCaseTests {

    // MARK: - Properties

    private let useCase = StepperGetTextStyleUseCase()
    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute returns correct color token")
    func executeReturnsCorrectColorToken() {
        // GIVEN / WHEN
        let colorToken: any ColorToken = self.useCase.executeColorToken(theme: self.themeMock)

        // THEN
        #expect(colorToken.uiColor == self.themeMock.colors.base.onSurface.uiColor)
    }

    @Test("Execute returns correct typography font token")
    func executeReturnsCorrectTypographyFontToken() {
        // GIVEN / WHEN
        let font: any TypographyFontToken = self.useCase.executeFontToken(theme: self.themeMock)

        // THEN
        #expect(font.uiFont == self.themeMock.typography.body1.uiFont)
    }
}
