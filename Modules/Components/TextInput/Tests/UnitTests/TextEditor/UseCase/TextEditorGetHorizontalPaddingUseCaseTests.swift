//
//  TextEditorGetHorizontalPaddingUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created on 26/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import Testing
import SparkTheming
@testable import SparkComponentTextInput

@Suite("Text Editor Get Horizontal Padding UseCase Tests")
struct TextEditorGetHorizontalPaddingUseCaseTests {

    // MARK: - Tests

    @Test("Execute should return horizontal spacing minus 4")
    func executeShouldReturnHorizontalSpacingMinus4() {
        // GIVEN
        let viewModel = TextEditorGetHorizontalPaddingUseCase()

        let horizontalSpacing: CGFloat = 16
        let spacings = TextInputSpacings(horizontal: horizontalSpacing, content: 8)
        let expectedPadding: CGFloat = horizontalSpacing - 4

        // WHEN
        let result = viewModel.execute(spacings: spacings)

        // THEN
        #expect(result == expectedPadding)
    }

    @Test("Execute with different horizontal spacing should return correct padding")
    func executeWithDifferentHorizontalSpacingShouldReturnCorrectPadding() {
        // GIVEN
        let viewModel = TextEditorGetHorizontalPaddingUseCase()

        let horizontalSpacing: CGFloat = 24
        let spacings = TextInputSpacings(horizontal: horizontalSpacing, content: 12)
        let expectedPadding: CGFloat = horizontalSpacing - 4

        // WHEN
        let result = viewModel.execute(spacings: spacings)

        // THEN
        #expect(result == expectedPadding)
    }
}
