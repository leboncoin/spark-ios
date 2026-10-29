//
//  SegmentedControlToken+LayoutTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct SegmentedControlTokenLayoutTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: SegmentedControlToken.Layout {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Accessibility horizontal padding should return spacing large")
    func accessibilityHorizontalPaddingShouldReturnSpacingLarge() {
        #expect(self.token.accessibilityHorizontalPadding == self.theme.layout.spacing.large)
    }

    @Test("Accessibility vertical padding should return spacing medium")
    func accessibilityVerticalPaddingShouldReturnSpacingMedium() {
        #expect(self.token.accessibilityVerticalPadding == self.theme.layout.spacing.medium)
    }

    @Test("Item padding should return spacing medium")
    func itemPaddingShouldReturnSpacingMedium() {
        #expect(self.token.itemPadding == self.theme.layout.spacing.medium)
    }

    @Test("Item spacing should return spacing medium")
    func itemSpacingShouldReturnSpacingMedium() {
        #expect(self.token.itemSpacing == self.theme.layout.spacing.medium)
    }

    @Test("Padding should return spacing small")
    func paddingShouldReturnSpacingSmall() {
        #expect(self.token.padding == self.theme.layout.spacing.small)
    }

    @Test("Spacing should return spacing small")
    func spacingShouldReturnSpacingSmall() {
        #expect(self.token.spacing == self.theme.layout.spacing.small)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = SegmentedControlToken.Layout(theme: self.theme)
        let rhs = SegmentedControlToken.Layout(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = SegmentedControlToken.Layout(theme: self.theme)
        let rhs = SegmentedControlToken.Layout(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
