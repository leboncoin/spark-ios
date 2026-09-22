//
//  ChipToken+LayoutTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

struct ChipTokenLayoutTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func initialization_sets_spacingWhenLeadingIcon_from_theme() {
        // GIVEN / WHEN
        let layout = ChipToken.Layout(theme: self.theme)

        // THEN
        #expect(layout.spacingWhenLeadingIcon == self.theme.layout.spacing.small)
    }

    @Test
    func initialization_sets_spacingWhenTrailingIcon_from_theme() {
        // GIVEN / WHEN
        let layout = ChipToken.Layout(theme: self.theme)

        // THEN
        #expect(layout.spacingWhenTrailingIcon == self.theme.layout.spacing.medium)
    }

    @Test
    func initialization_sets_extraContentSpacing_from_theme() {
        // GIVEN / WHEN
        let layout = ChipToken.Layout(theme: self.theme)

        // THEN
        #expect(layout.extraContentSpacing == self.theme.layout.spacing.medium)
    }

    @Test
    func horizontalPadding_has_correct_default_value() {
        // GIVEN / WHEN
        let layout = ChipToken.Layout(theme: self.theme)

        // THEN
        #expect(layout.horizontalPadding == 12)
    }

    @Test
    func initialization_with_different_theme_values() {
        // GIVEN
        let customTheme = ThemeGeneratedMock.mocked2()

        // WHEN
        let layout = ChipToken.Layout(theme: customTheme)

        // THEN
        #expect(layout.spacingWhenLeadingIcon == customTheme.layout.spacing.small)
        #expect(layout.spacingWhenTrailingIcon == customTheme.layout.spacing.medium)
        #expect(layout.extraContentSpacing == customTheme.layout.spacing.medium)
        #expect(layout.horizontalPadding == 12)
    }

    @Test
    func all_spacing_properties_are_set() {
        // GIVEN / WHEN
        let layout = ChipToken.Layout(theme: self.theme)

        // THEN
        #expect(layout.spacingWhenLeadingIcon > 0)
        #expect(layout.spacingWhenTrailingIcon > 0)
        #expect(layout.extraContentSpacing > 0)
        #expect(layout.horizontalPadding > 0)
    }

    @Test
    func equatable_returns_true_when_layouts_are_equal() {
        // GIVEN
        let layout1 = ChipToken.Layout(theme: self.theme)
        let layout2 = ChipToken.Layout(theme: self.theme)

        // WHEN / THEN
        #expect(layout1 == layout2)
    }

    @Test
    func equatable_returns_false_when_layouts_are_different() {
        // GIVEN
        let theme2 = ThemeGeneratedMock.mocked2()
        let layout1 = ChipToken.Layout(theme: self.theme)
        let layout2 = ChipToken.Layout(theme: theme2)

        // WHEN / THEN
        #expect(layout1 != layout2)
    }
}
