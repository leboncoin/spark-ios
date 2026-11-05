//
//  SegmentedControlTokenTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct SegmentedControlTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let otherTheme = ThemeGeneratedMock.mocked2()

    // MARK: - Initialization Tests

    @Test("Init should set theme dependent categories from theme")
    func initShouldSetThemeDependentCategoriesFromTheme() {
        // GIVEN / WHEN
        let token = SegmentedControlToken(theme: self.theme)

        // THEN
        #expect(token.border == SegmentedControlToken.Border(theme: self.theme))
        #expect(token.colors == SegmentedControlToken.Colors(theme: self.theme))
        #expect(token.layout == SegmentedControlToken.Layout(theme: self.theme))
        #expect(token.opacity == SegmentedControlToken.Opacity(theme: self.theme))
        #expect(token.typography == SegmentedControlToken.Typography(theme: self.theme))
    }

    @Test("Init should set theme independent categories")
    func initShouldSetThemeIndependentCategories() {
        // GIVEN / WHEN
        let token = SegmentedControlToken(theme: self.theme)

        // THEN
        #expect(token.scaleEffect == SegmentedControlToken.ScaleEffect())
        #expect(token.size == SegmentedControlToken.Size())
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = SegmentedControlToken(theme: self.theme)
        let rhs = SegmentedControlToken(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = SegmentedControlToken(theme: self.theme)
        let rhs = SegmentedControlToken(theme: self.otherTheme)

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
