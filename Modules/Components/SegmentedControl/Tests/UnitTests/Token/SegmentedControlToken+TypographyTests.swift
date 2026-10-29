//
//  SegmentedControlToken+TypographyTests.swift
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

struct SegmentedControlTokenTypographyTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: SegmentedControlToken.Typography {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Item font token when selected should return body 1 highlight")
    func itemFontTokenWhenSelectedShouldReturnBody1Highlight() {
        #expect(self.token.itemFontToken(isSelected: true).equals(self.theme.typography.body1Highlight))
    }

    @Test("Item font token when not selected should return body 1")
    func itemFontTokenWhenNotSelectedShouldReturnBody1() {
        #expect(self.token.itemFontToken(isSelected: false).equals(self.theme.typography.body1))
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = SegmentedControlToken.Typography(theme: self.theme)
        let rhs = SegmentedControlToken.Typography(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = SegmentedControlToken.Typography(theme: self.theme)
        let rhs = SegmentedControlToken.Typography(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
