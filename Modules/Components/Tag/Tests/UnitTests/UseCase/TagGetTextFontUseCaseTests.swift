//
//  TagGetTextFontUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

struct TagGetTextFontUseCaseTests {

    // MARK: - Tests

    @Test
    func test_execute_returnsTypographyFontTokenFromTheme() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = TagGetTextFontUseCase()

        // WHEN
        let result = useCase.execute(theme: theme)

        // THEN
        #expect(result.equals(theme.typography.captionHighlight))
    }
}
