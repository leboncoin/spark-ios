//
//  DividerGetSpacingUseCaseTests.swift
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

final class DividerGetSpacingUseCaseTests: XCTestCase {

    // MARK: - Execute Tests

    func test_execute_returns_large_spacing() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = DividerGetSpacingUseCase()

        // WHEN
        let spacing = useCase.execute(theme: theme)

        // THEN
        XCTAssertEqual(
            spacing,
            theme.layout.spacing.large,
            "Execute should return theme.layout.spacing.large"
        )
    }
}
