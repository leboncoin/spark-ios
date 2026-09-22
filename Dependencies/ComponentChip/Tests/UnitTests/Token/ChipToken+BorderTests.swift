//
//  ChipToken+BorderTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

struct ChipTokenBorderTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func initialization_sets_width_from_theme() {
        // GIVEN / WHEN
        let border = ChipToken.Border(theme: self.theme)

        // THEN
        #expect(border.width == self.theme.border.width.small)
    }

    @Test
    func initialization_sets_radius_from_theme() {
        // GIVEN / WHEN
        let border = ChipToken.Border(theme: self.theme)

        // THEN
        #expect(border.radius == self.theme.border.radius.full)
    }

    @Test
    func dashLength_has_correct_default_value() {
        // GIVEN / WHEN
        let border = ChipToken.Border(theme: self.theme)

        // THEN
        #expect(border.dashLength == 2)
    }

    @Test
    func initialization_with_different_theme_values() {
        // GIVEN
        let customTheme = ThemeGeneratedMock.mocked2()

        // WHEN
        let border = ChipToken.Border(theme: customTheme)

        // THEN
        #expect(border.width == customTheme.border.width.small)
        #expect(border.radius == customTheme.border.radius.full)
        #expect(border.dashLength == 2)
    }

    @Test
    func equatable_returns_true_when_borders_are_equal() {
        // GIVEN
        let border1 = ChipToken.Border(theme: self.theme)
        let border2 = ChipToken.Border(theme: self.theme)

        // WHEN / THEN
        #expect(border1 == border2)
    }

    @Test
    func equatable_returns_false_when_borders_are_different() {
        // GIVEN
        let theme2 = ThemeGeneratedMock.mocked2()
        let border1 = ChipToken.Border(theme: self.theme)
        let border2 = ChipToken.Border(theme: theme2)

        // WHEN / THEN
        #expect(border1 != border2)
    }
}
