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

    @Test
    func accessibilityHorizontalPaddingShouldReturnSpacingLarge() {
        #expect(self.token.accessibilityHorizontalPadding == self.theme.layout.spacing.large)
    }

    @Test
    func accessibilityVerticalPaddingShouldReturnSpacingMedium() {
        #expect(self.token.accessibilityVerticalPadding == self.theme.layout.spacing.medium)
    }

    @Test
    func itemPaddingShouldReturnSpacingMedium() {
        #expect(self.token.itemPadding == self.theme.layout.spacing.medium)
    }

    @Test
    func itemSpacingShouldReturnSpacingMedium() {
        #expect(self.token.itemSpacing == self.theme.layout.spacing.medium)
    }

    @Test
    func paddingShouldReturnSpacingSmall() {
        #expect(self.token.padding == self.theme.layout.spacing.small)
    }

    @Test
    func spacingShouldReturnSpacingSmall() {
        #expect(self.token.spacing == self.theme.layout.spacing.small)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableWithSameThemeShouldReturnTrue() {
        // GIVEN
        let lhs = SegmentedControlToken.Layout(theme: self.theme)
        let rhs = SegmentedControlToken.Layout(theme: self.theme)

        // WHEN / THEN
        #expect(lhs == rhs)
    }

    @Test
    func equatableWithDifferentThemeShouldReturnFalse() {
        // GIVEN
        let lhs = SegmentedControlToken.Layout(theme: self.theme)
        let rhs = SegmentedControlToken.Layout(theme: ThemeGeneratedMock.mocked2())

        // WHEN / THEN
        #expect(lhs != rhs)
    }
}
