//
//  CircularMeterTokenTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCircularMeter
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct CircularMeterTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let otherTheme = ThemeGeneratedMock.mocked2()

    // MARK: - Initialization Tests

    @Test("Init should set theme dependent categories from theme")
    func initShouldSetThemeDependentCategoriesFromTheme() {
        // GIVEN / WHEN
        let token = CircularMeterToken(theme: self.theme)

        // THEN
        #expect(token.colors == CircularMeterToken.Colors(theme: self.theme))
        #expect(token.layout == CircularMeterToken.Layout(theme: self.theme))
        #expect(token.typography == CircularMeterToken.Typography(theme: self.theme))
    }

    @Test("Init should set theme independent categories")
    func initShouldSetThemeIndependentCategories() {
        // GIVEN / WHEN
        let token = CircularMeterToken(theme: self.theme)

        // THEN
        #expect(token.content == CircularMeterToken.Content())
        #expect(token.size == CircularMeterToken.Size())
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = CircularMeterToken(theme: self.theme)
        let rhs = CircularMeterToken(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = CircularMeterToken(theme: self.theme)
        let rhs = CircularMeterToken(theme: self.otherTheme)

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
