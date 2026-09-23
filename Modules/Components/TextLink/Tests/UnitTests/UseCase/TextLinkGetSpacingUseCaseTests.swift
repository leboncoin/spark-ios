//
//  TextLinkGetSpacingUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

final class TextLinkGetSpacingUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = TextLinkGetSpacingUseCase()

    // MARK: - Tests

    func test_execute_returns_medium_spacing() {
        // GIVEN / WHEN
        let result = self.useCase.execute(theme: self.theme)

        // THEN
        XCTAssertEqual(result, theme.layout.spacing.medium)
    }

    func test_execute_with_different_theme() {
        // GIVEN
        let differentTheme = ThemeGeneratedMock.mocked()

        // WHEN
        let result = self.useCase.execute(theme: differentTheme)

        // THEN
        XCTAssertEqual(result, differentTheme.layout.spacing.medium)
    }
}
