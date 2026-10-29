//
//  TextInputGetSpacingsUseCaseTests.swift
//  SparkTextFieldTests
//
//  Created by robin.lemaire on 20/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming
@testable import SparkComponentTextInput
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Text Input Get Spacings UseCase Tests")
struct TextInputGetSpacingsUseCaseTests {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute with theme and none border style")
    func executeWithThemeAndNoneBorderStyle() {
        // GIVEN
        let useCase = TextInputGetSpacingsUseCase()

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            borderStyle: .none
        )

        // THEN
        #expect(
            result.horizontal == self.themeMock.layout.spacing.none,
            "Wrong horizontal value"
        )
        #expect(
            result.content == self.themeMock.layout.spacing.medium,
            "Wrong content value"
        )
    }

    @Test("Execute with theme and rounded rect border style")
    func executeWithThemeAndRoundedRectBorderStyle() {
        // GIVEN
        let useCase = TextInputGetSpacingsUseCase()

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock,
            borderStyle: .roundedRect
        )

        // THEN
        #expect(
            result.horizontal == self.themeMock.layout.spacing.large,
            "Wrong horizontal value"
        )
        #expect(
            result.content == self.themeMock.layout.spacing.medium,
            "Wrong content value"
        )
    }

    @Test("Execute with theme only")
    func executeWithThemeOnly() {
        // GIVEN
        let useCase = TextInputGetSpacingsUseCase()

        // WHEN
        let result = useCase.execute(
            theme: self.themeMock
        )

        // THEN
        #expect(
            result.horizontal == self.themeMock.layout.spacing.large,
            "Wrong horizontal value"
        )
        #expect(
            result.content == self.themeMock.layout.spacing.medium,
            "Wrong content value"
        )
    }
}
