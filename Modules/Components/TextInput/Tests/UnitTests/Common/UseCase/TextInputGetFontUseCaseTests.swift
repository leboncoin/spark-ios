//
//  TextInputGetFontUseCaseTests.swift
//  SparkComponentTextInputTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Text Input Get Font UseCase Tests")
struct TextInputGetFontUseCaseTests {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute should return body 1 font")
    func executeShouldReturnBody1Font() throws {
        // GIVEN
        let useCase = TextInputGetFontUseCase()

        let themeMock = ThemeGeneratedMock.mocked()

        // WHEN
        let result = useCase.execute(theme: themeMock)

        // THEN
        let resultWrap = try #require(
            result as? TypographyFontTokenGeneratedMock,
            "Couldn't unwrap result"
        )

        #expect(
            resultWrap === themeMock.typography.body1 as? TypographyFontTokenGeneratedMock
        )
    }
}
