//
//  StepperGetTextStyleUseCaseTests.swift
//  SparkComponentStepper
//
//  Created by robin.lemaire on 04/03/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentStepper
@testable import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

class StepperGetTextStyleUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let useCase = StepperGetTextStyleUseCase()
    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func testExecuteReturnsCorrectColorToken() {
        // GIVEN / WHEN
        let colorToken: any ColorToken = self.useCase.executeColorToken(theme: self.themeMock)

        // THEN
        XCTAssertEqual(colorToken.uiColor, self.themeMock.colors.base.onSurface.uiColor)
    }

    func testExecuteReturnsCorrectTypographyFontToken() {
        // GIVEN / WHEN
        let font: any TypographyFontToken = self.useCase.executeFontToken(theme: self.themeMock)

        // THEN
        XCTAssertEqual(font.uiFont, self.themeMock.typography.body1.uiFont)
    }
}
