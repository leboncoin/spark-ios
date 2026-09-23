//
//  ChipToken+OpacityTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

struct ChipTokenOpacityTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func initialization_sets_whenEnabled_from_theme() {
        // GIVEN / WHEN
        let opacity = ChipToken.Opacity(theme: self.theme)

        // THEN
        #expect(opacity.whenEnabled == self.theme.dims.none)
    }

    @Test
    func initialization_sets_whenDisabled_from_theme() {
        // GIVEN / WHEN
        let opacity = ChipToken.Opacity(theme: self.theme)

        // THEN
        #expect(opacity.whenDisabled == self.theme.dims.dim3)
    }

    @Test
    func initialization_with_different_theme_values() {
        // GIVEN
        let customTheme = ThemeGeneratedMock.mocked2()

        // WHEN
        let opacity = ChipToken.Opacity(theme: customTheme)

        // THEN
        #expect(opacity.whenEnabled == customTheme.dims.none)
        #expect(opacity.whenDisabled == customTheme.dims.dim3)
    }

    @Test
    func whenEnabled_and_whenDisabled_are_different() {
        // GIVEN / WHEN
        let opacity = ChipToken.Opacity(theme: self.theme)

        // THEN
        #expect(opacity.whenEnabled != opacity.whenDisabled)
    }

    @Test
    func equatable_returns_true_when_opacities_are_equal() {
        // GIVEN
        let opacity1 = ChipToken.Opacity(theme: self.theme)
        let opacity2 = ChipToken.Opacity(theme: self.theme)

        // WHEN / THEN
        #expect(opacity1 == opacity2)
    }

    @Test
    func equatable_returns_false_when_opacities_are_different() {
        // GIVEN
        let theme2 = ThemeGeneratedMock.mocked2()
        let opacity1 = ChipToken.Opacity(theme: self.theme)
        let opacity2 = ChipToken.Opacity(theme: theme2)

        // WHEN / THEN
        #expect(opacity1 != opacity2)
    }
}
