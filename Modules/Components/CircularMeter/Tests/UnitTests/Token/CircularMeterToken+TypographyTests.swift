//
//  CircularMeterToken+TypographyTests.swift
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

struct CircularMeterTokenTypographyTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: CircularMeterToken.Typography {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Content should return expected font token")
    func contentShouldReturnExpectedFontToken() {
        let typography = self.theme.typography
        let expected: [(CircularMeterSize, any TypographyFontToken)] = [
            (.small, typography.small),
            (.medium, typography.small),
            (.large, typography.caption),
            (.xLarge, typography.body2)
        ]

        for (size, fontToken) in expected {
            #expect(self.token.content(size: size).equals(fontToken), "Wrong font for \(size)")
        }
    }

    @Test("Value should return expected font token")
    func valueShouldReturnExpectedFontToken() {
        let typography = self.theme.typography
        let expected: [(CircularMeterSize, any TypographyFontToken)] = [
            (.small, typography.body2Highlight),
            (.medium, typography.body2Highlight),
            (.large, typography.body1Highlight),
            (.xLarge, typography.display3)
        ]

        for (size, fontToken) in expected {
            #expect(self.token.value(size: size).equals(fontToken), "Wrong font for \(size)")
        }
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = CircularMeterToken.Typography(theme: self.theme)
        let rhs = CircularMeterToken.Typography(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = CircularMeterToken.Typography(theme: self.theme)
        let rhs = CircularMeterToken.Typography(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
