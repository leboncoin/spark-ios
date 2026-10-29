//
//  ComponentToken+ChipTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct ComponentTokenChipTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func chipShouldReturnTokenFromTheme() {
        // GIVEN
        let componentToken = ComponentToken(theme: self.theme)

        // WHEN
        let token = componentToken.chip

        // THEN
        #expect(token == ChipToken(theme: self.theme))
    }

    @Test
    func chipFromThemeComponentShouldReturnTokenFromTheme() {
        // GIVEN / WHEN
        let token = self.theme.component.chip

        // THEN
        #expect(token == ChipToken(theme: self.theme))
    }

    @Test
    func chipWithDifferentThemeShouldNotReturnTokenFromTheme() {
        // GIVEN
        let componentToken = ComponentToken(theme: ThemeGeneratedMock.mocked2())

        // WHEN
        let token = componentToken.chip

        // THEN
        #expect(token != ChipToken(theme: self.theme))
    }
}
