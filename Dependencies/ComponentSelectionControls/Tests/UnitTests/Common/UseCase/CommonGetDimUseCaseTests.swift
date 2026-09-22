//
//  CommonGetDimUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkThemingTesting

final class CommonGetDimUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_whenEnabled_returnsNoneDim() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            isEnabled: true
        )

        // THEN
        XCTAssertEqual(result, theme.dims.none)
    }

    func test_execute_whenDisabled_returnsDim3() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetDimUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            isEnabled: false
        )

        // THEN
        XCTAssertEqual(result, theme.dims.dim3)
    }
}
