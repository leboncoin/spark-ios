//
//  DividerGetTextFontUseCaseTests.swift
//  SparkComponentDividerTests
//
//  Created by robin.lemaire on 12/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming

@_spi(SI_SPI) import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkThemingTesting

@testable import SparkComponentDivider

@Suite("Divider Get Text Font UseCase Tests")
struct DividerGetTextFontUseCaseTests {

    // MARK: - Execute Tests

    @Test("Execute returns body1 typography")
    func executeReturnsBody1Typography() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = DividerGetTextFontUseCase()

        // WHEN
        let font = useCase.execute(theme: theme)

        // THEN
        #expect(
            font.equals(theme.typography.body1),
            "Execute should return theme.typography.body1"
        )
    }
}
