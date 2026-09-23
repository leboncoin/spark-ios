//
//  CommonGroupGetSpacingUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class CommonGroupGetSpacingUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase: CommonGroupGetSpacingUseCaseable!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.useCase = CommonGroupGetSpacingUseCase()
    }

    // MARK: - Tests

    func test_execute_withVerticalAxis_and_isAccessibilitySizeAtTrue_shouldReturnLargeSpacing() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let axis = SelectionControlsAxis.vertical
        let expectedSpacing = theme.layout.spacing.large

        // WHEN
        let result = self.useCase.execute(
            theme: theme,
            axis: axis,
            isAccessibilitySize: true
        )

        // THEN
        XCTAssertEqual(result, expectedSpacing)
    }

    func test_execute_withVerticalAxis_and_isAccessibilitySizeAtFalse_shouldReturnLargeSpacing() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let axis = SelectionControlsAxis.vertical
        let expectedSpacing = theme.layout.spacing.large

        // WHEN
        let result = self.useCase.execute(
            theme: theme,
            axis: axis,
            isAccessibilitySize: false
        )

        // THEN
        XCTAssertEqual(result, expectedSpacing)
    }

    func test_execute_withHorizontalAxis_and_isAccessibilitySizeAtTrue_shouldReturnXLargeSpacing() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let axis = SelectionControlsAxis.horizontal
        let expectedSpacing = theme.layout.spacing.large

        // WHEN
        let result = self.useCase.execute(
            theme: theme,
            axis: axis,
            isAccessibilitySize: true
        )

        // THEN
        XCTAssertEqual(result, expectedSpacing)
    }

    func test_execute_withHorizontalAxis_and_isAccessibilitySizeAtFalse_shouldReturnXLargeSpacing() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let axis = SelectionControlsAxis.horizontal
        let expectedSpacing = theme.layout.spacing.xLarge

        // WHEN
        let result = self.useCase.execute(
            theme: theme,
            axis: axis,
            isAccessibilitySize: false
        )

        // THEN
        XCTAssertEqual(result, expectedSpacing)
    }
}
