//
//  TextEditorGetVerticalSpacingUseCaseTests.swift
//  SparkTextFieldUnitTests
//
//  Created by robin.lemaire on 11/09/24.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest

@testable import SparkComponentTextInput
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class TextEditorGetVerticalSpacingUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute() {
        // GIVEN
        let useCase = TextEditorGetVerticalSpacingUseCase()

        let height: CGFloat = 200

        let font = TypographyFontTokenGeneratedMock()
        font.uiFont = UIFont.systemFont(ofSize: 20)

        // WHEN
        let spacing = useCase.execute(
            height: height,
            font: font
        )

        // THEN
        let expectedSpacing = (height - font.uiFont.lineHeight) / 2
        XCTAssertEqual(spacing, expectedSpacing)
    }
}
