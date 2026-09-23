//
//  TextInputGetFontUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkThemingTesting

final class TextInputGetFontUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute_shouldReturnBody1Font() throws {
        // GIVEN
        let useCase = TextInputGetFontUseCase()

        let themeMock = ThemeGeneratedMock.mocked()

        // WHEN
        let result = useCase.execute(theme: themeMock)

        // THEN
        let resultWrap = try XCTUnwrap(
            result as? TypographyFontTokenGeneratedMock,
            "Couldn't unwrap result"
        )

        XCTAssertIdentical(
            resultWrap,
            themeMock.typography.body1 as? TypographyFontTokenGeneratedMock
        )
    }
}
