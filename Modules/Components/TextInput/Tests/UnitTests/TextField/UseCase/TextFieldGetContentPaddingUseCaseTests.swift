//
//  TextFieldGetContentPaddingUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput

final class TextFieldGetContentPaddingUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_withClearButton_shouldReturnCorrectPadding() {
        // GIVEN
        let useCase = TextFieldGetContentPaddingUseCase()

        let expectedHorizontalSpacing: CGFloat = 10

        let spacings = TextInputSpacings(horizontal: expectedHorizontalSpacing)
        let isClearButton = true

        // WHEN
        let padding = useCase.execute(
            spacings: spacings,
            isClearButton: isClearButton
        )

        // THEN
        XCTAssertEqual(padding.top, 0)
        XCTAssertEqual(padding.leading, expectedHorizontalSpacing)
        XCTAssertEqual(padding.bottom, 0)
        XCTAssertEqual(padding.trailing, expectedHorizontalSpacing)
        XCTAssertEqual(padding.inputTrailing, 0)
    }

    func test_execute_withoutClearButton_shouldReturnCorrectPadding() {
        // GIVEN
        let useCase = TextFieldGetContentPaddingUseCase()

        let expectedHorizontalSpacing: CGFloat = 15

        let spacings = TextInputSpacings(horizontal: expectedHorizontalSpacing)
        let isClearButton = false

        // WHEN
        let padding = useCase.execute(
            spacings: spacings,
            isClearButton: isClearButton
        )

        // THEN
        XCTAssertEqual(padding.top, 0)
        XCTAssertEqual(padding.leading, expectedHorizontalSpacing)
        XCTAssertEqual(padding.bottom, 0)
        XCTAssertEqual(padding.trailing, expectedHorizontalSpacing)
        XCTAssertEqual(padding.inputTrailing, expectedHorizontalSpacing)
    }
}
