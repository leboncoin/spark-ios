//
//  TextEditorViewModelTests.swift
//  SparkComponentTextInputTests
//
//  Created on 26/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentTextInput
@_spi(SI_SPI) @testable import SparkComponentTextInputTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming

@MainActor
@Suite("TextEditor ViewModel Tests")
struct TextEditorViewModelTests {

    // MARK: - Tests

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN
        let expectedPadding: CGFloat = 16.0

        let getHorizontalPaddingUseCase = TextEditorGetHorizontalPaddingUseCaseableGeneratedMock()
        getHorizontalPaddingUseCase.executeWithSpacingsReturnValue = expectedPadding

        // WHEN
        let viewModel = TextEditorViewModel(getHorizontalPaddingUseCase: getHorizontalPaddingUseCase)

        // THEN
        #expect(
            viewModel.horizontalPadding == 0,
            "Wrong horizontalPadding value"
        )

        #expect(
            !getHorizontalPaddingUseCase.executeWithSpacingsCalled,
            "Wrong number of call on getHorizontalPaddingUseCase"
        )
    }

    @Test("Spacing did update should update horizontal padding")
    func spacingDidUpdateShouldUpdateHorizontalPadding() {
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
        #expect(
            viewModel.horizontalPadding == updatedPadding,
            "Wrong horizontalPadding value"
        )

        #expect(
            getHorizontalPaddingUseCase.executeWithSpacingsCalled,
            "Wrong number of call on getHorizontalPaddingUseCase"
        )
    }
}
