//
//  ChipTokenTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

struct ChipTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Initialization sets all properties")
    func initialization_sets_all_properties() {
        // GIVEN / WHEN
        let token = ChipToken(theme: self.theme)

        // THEN
        #expect(token.border == ChipToken.Border(theme: self.theme))
        #expect(token.colors == ChipToken.Colors(theme: self.theme))
        #expect(token.layout == ChipToken.Layout(theme: self.theme))
        #expect(token.opacity == ChipToken.Opacity(theme: self.theme))
        #expect(token.typography == ChipToken.Typography(theme: self.theme))
        #expect(token.size == ChipToken.Size())
        #expect(token.alignment == ChipToken.Alignment())
    }

    @Test("Border property returns border instance")
    func border_property_returns_border_instance() {
        // GIVEN / WHEN
        let token = ChipToken(theme: self.theme)

        // THEN
        #expect(token.border == ChipToken.Border(theme: self.theme))
    }

    @Test("Opacity property returns opacity instance")
    func opacity_property_returns_opacity_instance() {
        // GIVEN / WHEN
        let token = ChipToken(theme: self.theme)

        // THEN
        #expect(token.opacity == ChipToken.Opacity(theme: self.theme))
    }

    @Test("Size property returns size instance")
    func size_property_returns_size_instance() {
        // GIVEN / WHEN
        let token = ChipToken(theme: self.theme)

        // THEN
        #expect(token.size == ChipToken.Size())
    }

    @Test("Layout property returns layout instance")
    func layout_property_returns_layout_instance() {
        // GIVEN / WHEN
        let token = ChipToken(theme: self.theme)

        // THEN
        #expect(token.layout == ChipToken.Layout(theme: self.theme))
    }

    @Test("Typography property returns typography instance")
    func typography_property_returns_typography_instance() {
        // GIVEN / WHEN
        let token = ChipToken(theme: self.theme)

        // THEN
        #expect(token.typography == ChipToken.Typography(theme: self.theme))
    }

    @Test("Equatable returns true when tokens are equal")
    func equatable_returns_true_when_tokens_are_equal() {
        // GIVEN
        let token1 = ChipToken(theme: self.theme)
        let token2 = ChipToken(theme: self.theme)

        // WHEN / THEN
        #expect(token1 == token2)
    }

    @Test("Equatable returns false when tokens are different")
    func equatable_returns_false_when_tokens_are_different() {
        // GIVEN
        let theme2 = ThemeGeneratedMock.mocked2()
        let token1 = ChipToken(theme: self.theme)
        let token2 = ChipToken(theme: theme2)

        // WHEN / THEN
        #expect(token1 != token2)
    }
}
