//
//  CommonGetTitleStyleUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkThemingTesting

final class CommonGetTitleStyleUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetTitleStyleUseCase()

        // WHEN
        let result = useCase.execute(theme: theme)

        // THEN
        XCTAssertTrue(result.typography.equals(theme.typography.body1))
        XCTAssertTrue(result.color.equals(theme.colors.base.onSurface))
    }
}
