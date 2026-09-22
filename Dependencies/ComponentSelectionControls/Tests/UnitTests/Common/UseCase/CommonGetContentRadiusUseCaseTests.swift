//
//  CommonGetContentRadiusUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) import SparkThemingTesting

final class CommonGetContentRadiusUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_for_checkboxType_returnsFullRadius() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetContentRadiusUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            type: .checkbox
        )

        // THEN
        XCTAssertEqual(result, theme.border.radius.small)
    }

    func test_execute_for_radioButtonType_returnsFullRadius() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetContentRadiusUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            type: .radioButton
        )

        // THEN
        XCTAssertEqual(result, theme.border.radius.full)
    }

    func test_execute_for_toggleType_returnsFullRadius() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = CommonGetContentRadiusUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            type: .toggle
        )

        // THEN
        XCTAssertEqual(result, theme.border.radius.full)
    }
}
