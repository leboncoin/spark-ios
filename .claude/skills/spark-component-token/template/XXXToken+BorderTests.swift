//
//  XXXToken+BorderTests.swift
//  SparkComponentXXXTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentXXX
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

struct XXXTokenBorderTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func initialization_sets_width_from_theme() {
        // GIVEN / WHEN
        let border = XXXToken.Border(theme: self.theme)

        // THEN
        #expect(border.width == self.theme.border.width.small)
    }

    @Test
    func initialization_sets_radius_from_theme() {
        // GIVEN / WHEN
        let border = XXXToken.Border(theme: self.theme)

        // THEN
        #expect(border.radius == self.theme.border.radius.full)
    }

    @Test
    func initialization_with_different_theme_values() {
        // GIVEN
        let customTheme = ThemeGeneratedMock.mocked2()

        // WHEN
        let border = XXXToken.Border(theme: customTheme)

        // THEN
        #expect(border.width == customTheme.border.width.small)
        #expect(border.radius == customTheme.border.radius.full)
    }

    @Test
    func equatable_returns_true_when_borders_are_equal() {
        // GIVEN
        let border1 = XXXToken.Border(theme: self.theme)
        let border2 = XXXToken.Border(theme: self.theme)

        // WHEN / THEN
        #expect(border1 == border2)
    }

    @Test
    func equatable_returns_false_when_borders_are_different() {
        // GIVEN
        let theme2 = ThemeGeneratedMock.mocked2()
        let border1 = XXXToken.Border(theme: self.theme)
        let border2 = XXXToken.Border(theme: theme2)

        // WHEN / THEN
        #expect(border1 != border2)
    }
}
