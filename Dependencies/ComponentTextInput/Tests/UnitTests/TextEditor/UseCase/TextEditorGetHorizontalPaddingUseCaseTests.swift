//
//  TextEditorGetHorizontalPaddingUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created on 26/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@testable import SparkComponentTextInput

final class TextEditorGetHorizontalPaddingUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_shouldReturnHorizontalSpacingMinus4() {
        // GIVEN
        let viewModel = TextEditorGetHorizontalPaddingUseCase()

        let horizontalSpacing: CGFloat = 16
        let spacings = TextInputSpacings(horizontal: horizontalSpacing, content: 8)
        let expectedPadding: CGFloat = horizontalSpacing - 4

        // WHEN
        let result = viewModel.execute(spacings: spacings)

        // THEN
        XCTAssertEqual(result, expectedPadding)
    }

    func test_execute_withDifferentHorizontalSpacing_shouldReturnCorrectPadding() {
        // GIVEN
        let viewModel = TextEditorGetHorizontalPaddingUseCase()

        let horizontalSpacing: CGFloat = 24
        let spacings = TextInputSpacings(horizontal: horizontalSpacing, content: 12)
        let expectedPadding: CGFloat = horizontalSpacing - 4

        // WHEN
        let result = viewModel.execute(spacings: spacings)

        // THEN
        XCTAssertEqual(result, expectedPadding)
    }
}
