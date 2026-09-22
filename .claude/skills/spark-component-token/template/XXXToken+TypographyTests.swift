//
//  XXXToken+TypographyTests.swift
//  SparkComponentXXXTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentXXX
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

struct XXXTokenTypographyTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func initialization_sets_titleFont_from_theme() {
        // GIVEN / WHEN
        let typography = XXXToken.Typography(theme: self.theme)

        // THEN
        #expect(typography.titleFont.equals(self.theme.typography.body1))
    }

    @Test
    func initialization_with_different_theme_values() {
        // GIVEN
        let customTheme = ThemeGeneratedMock.mocked2()

        // WHEN
        let typography = XXXToken.Typography(theme: customTheme)

        // THEN
        #expect(typography.titleFont.equals(customTheme.typography.body1))
    }

    @Test
    func equatable_returns_true_when_typographies_are_equal() {
        // GIVEN
        let typography1 = XXXToken.Typography(theme: self.theme)
        let typography2 = XXXToken.Typography(theme: self.theme)

        // WHEN / THEN
        #expect(typography1 == typography2)
    }

    @Test
    func equatable_returns_false_when_typographies_are_different() {
        // GIVEN
        let theme2 = ThemeGeneratedMock.mocked2()
        let typography1 = XXXToken.Typography(theme: self.theme)
        let typography2 = XXXToken.Typography(theme: theme2)

        // WHEN / THEN
        #expect(typography1 != typography2)
    }
}
