//
//  TextEditorViewModelTests.swift
//  SparkComponentTextInputTests
//
//  Created on 26/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput
@_spi(SI_SPI) @testable import SparkComponentTextInputTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming

final class TextEditorViewModelTests: XCTestCase {

    // MARK: - Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN
        let expectedPadding: CGFloat = 16.0

        let getHorizontalPaddingUseCase = TextEditorGetHorizontalPaddingUseCaseableGeneratedMock()
        getHorizontalPaddingUseCase.executeWithSpacingsReturnValue = expectedPadding

        // WHEN
        let viewModel = TextEditorViewModel(getHorizontalPaddingUseCase: getHorizontalPaddingUseCase)

        // THEN
        XCTAssertEqual(
            viewModel.horizontalPadding,
            0,
            "Wrong horizontalPadding value"
        )

        XCTAssertFalse(
            getHorizontalPaddingUseCase.executeWithSpacingsCalled,
            "Wrong number of call on getHorizontalPaddingUseCase"
        )
    }

    func test_spacingDidUpdate_shouldUpdateHorizontalPadding() {
        // GIVEN
        let initialPadding: CGFloat = 16.0
        let updatedPadding: CGFloat = 24.0

        let getHorizontalPaddingUseCase = TextEditorGetHorizontalPaddingUseCaseableGeneratedMock()
        getHorizontalPaddingUseCase.executeWithSpacingsReturnValue = initialPadding

        let viewModel = TextEditorViewModel(getHorizontalPaddingUseCase: getHorizontalPaddingUseCase)

        // Reset mock to verify next call
        getHorizontalPaddingUseCase.reset()
        getHorizontalPaddingUseCase.executeWithSpacingsReturnValue = updatedPadding

        // WHEN
        viewModel.spacingDidUpdate()

        // THEN
        XCTAssertEqual(
            viewModel.horizontalPadding,
            updatedPadding,
            "Wrong horizontalPadding value"
        )

        XCTAssertTrue(
            getHorizontalPaddingUseCase.executeWithSpacingsCalled,
            "Wrong number of call on getHorizontalPaddingUseCase"
        )
    }
}
