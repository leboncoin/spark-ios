//
//  BadgeGetTextFontUseCaseTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class BadgeGetTextFontUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_returns_correct_font_when_size_is_small() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = BadgeGetTextFontUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            size: .small
        )

        // THEN
        XCTAssertTrue(result.equals(theme.typography.smallHighlight))
    }

    func test_execute_returns_correct_font_when_size_is_medium() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = BadgeGetTextFontUseCase()

        // WHEN
        let result = useCase.execute(
            theme: theme,
            size: .medium
        )

        // THEN
        XCTAssertTrue(result.equals(theme.typography.captionHighlight))
    }
}
