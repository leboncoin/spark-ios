//
//  XXXTokenTests.swift
//  SparkComponentXXXTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentXXX
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

struct XXXTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test
    func initialization_sets_all_properties() {
        // GIVEN / WHEN
        let token = XXXToken(theme: self.theme)

        // THEN
        #expect(token.border == XXXToken.Border(theme: self.theme))
        #expect(token.size == XXXToken.Size())
        #expect(token.typography == XXXToken.Typography(theme: self.theme))
    }

    @Test
    func border_property_returns_border_instance() {
        // GIVEN / WHEN
        let token = XXXToken(theme: self.theme)

        // THEN
        #expect(token.border == XXXToken.Border(theme: self.theme))
    }

    @Test
    func size_property_returns_size_instance() {
        // GIVEN / WHEN
        let token = XXXToken(theme: self.theme)

        // THEN
        #expect(token.size == XXXToken.Size())
    }

    @Test
    func typography_property_returns_typography_instance() {
        // GIVEN / WHEN
        let token = XXXToken(theme: self.theme)

        // THEN
        #expect(token.typography == XXXToken.Typography(theme: self.theme))
    }

    @Test
    func equatable_returns_true_when_tokens_are_equal() {
        // GIVEN
        let token1 = XXXToken(theme: self.theme)
        let token2 = XXXToken(theme: self.theme)

        // WHEN / THEN
        #expect(token1 == token2)
    }

    @Test
    func equatable_returns_false_when_tokens_are_different() {
        // GIVEN
        let theme2 = ThemeGeneratedMock.mocked2()
        let token1 = XXXToken(theme: self.theme)
        let token2 = XXXToken(theme: theme2)

        // WHEN / THEN
        #expect(token1 != token2)
    }
}
