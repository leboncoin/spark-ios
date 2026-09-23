//
//  DividerGetTextFontUseCaseTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming

@_spi(SI_SPI) import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkComponentDivider

final class DividerGetTextFontUseCaseTests: XCTestCase {

    // MARK: - Execute Tests

    func test_execute_returns_body1_typography() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = DividerGetTextFontUseCase()

        // WHEN
        let font = useCase.execute(theme: theme)

        // THEN
        XCTAssertTrue(
            font.equals(theme.typography.body1),
            "Execute should return theme.typography.body1"
        )
    }
}
