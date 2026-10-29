//
//  BadgeGetTextFontUseCaseTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Badge Get Text Font UseCase Tests")
struct BadgeGetTextFontUseCaseTests {

    // MARK: - Tests

    @Test("Execute returns correct font when size is small")
    func executeReturnsCorrectFontWhenSizeIsSmall() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = BadgeGetTextFontUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            size: .small
        )

        // THEN
        #expect(result.equals(theme.typography.smallHighlight))
    }

    @Test("Execute returns correct font when size is medium")
    func executeReturnsCorrectFontWhenSizeIsMedium() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = BadgeGetTextFontUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            size: .medium
        )

        // THEN
        #expect(result.equals(theme.typography.captionHighlight))
    }
}
