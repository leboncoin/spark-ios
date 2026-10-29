//
//  CommonGroupGetSpacingUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Common Group Get Spacing UseCase Tests")
struct CommonGroupGetSpacingUseCaseTests {

    // MARK: - Properties

    private let useCase: CommonGroupGetSpacingUseCaseable

    // MARK: - Initialization

    init() {
        self.useCase = CommonGroupGetSpacingUseCase()
    }

    // MARK: - Tests

    @Test("Execute with vertical axis and is accessibility size at true should return large spacing")
    func executeWithVerticalAxisAndIsAccessibilitySizeAtTrueShouldReturnLargeSpacing() {
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
        #expect(result == expectedSpacing)
    }

    @Test("Execute with vertical axis and is accessibility size at false should return large spacing")
    func executeWithVerticalAxisAndIsAccessibilitySizeAtFalseShouldReturnLargeSpacing() {
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
        #expect(result == expectedSpacing)
    }

    @Test("Execute with horizontal axis and is accessibility size at true should return x large spacing")
    func executeWithHorizontalAxisAndIsAccessibilitySizeAtTrueShouldReturnXLargeSpacing() {
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
        #expect(result == expectedSpacing)
    }

    @Test("Execute with horizontal axis and is accessibility size at false should return x large spacing")
    func executeWithHorizontalAxisAndIsAccessibilitySizeAtFalseShouldReturnXLargeSpacing() {
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
        #expect(result == expectedSpacing)
    }
}
