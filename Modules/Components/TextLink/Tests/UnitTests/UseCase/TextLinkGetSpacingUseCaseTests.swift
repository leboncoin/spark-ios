//
//  TextLinkGetSpacingUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

@Suite("Text Link Get Spacing UseCase Tests")
struct TextLinkGetSpacingUseCaseTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = TextLinkGetSpacingUseCase()

    // MARK: - Tests

    @Test("Execute returns medium spacing")
    func executeReturnsMediumSpacing() {
        // GIVEN / WHEN
        let result = self.useCase.execute(theme: self.theme)

        // THEN
        #expect(result == theme.layout.spacing.medium)
    }

    @Test("Execute with different theme")
    func executeWithDifferentTheme() {
        // GIVEN
        let differentTheme = ThemeGeneratedMock.mocked()

        // WHEN
        let result = self.useCase.execute(theme: differentTheme)

        // THEN
        #expect(result == differentTheme.layout.spacing.medium)
    }
}
