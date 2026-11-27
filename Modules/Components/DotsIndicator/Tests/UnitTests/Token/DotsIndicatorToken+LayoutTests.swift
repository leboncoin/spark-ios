//
//  DotsIndicatorToken+LayoutTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentDotsIndicator
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct DotsIndicatorTokenLayoutTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: DotsIndicatorToken.Layout {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Spacing with small size should return spacing small")
    func spacingWithSmallSizeShouldReturnSpacingSmall() {
        #expect(self.token.spacing(size: .small) == self.theme.layout.spacing.small)
    }

    @Test("Spacing with medium size should return spacing medium")
    func spacingWithMediumSizeShouldReturnSpacingMedium() {
        #expect(self.token.spacing(size: .medium) == self.theme.layout.spacing.medium)
    }

    @Test("Spacing with large size should return spacing large")
    func spacingWithLargeSizeShouldReturnSpacingLarge() {
        #expect(self.token.spacing(size: .large) == self.theme.layout.spacing.large)
    }

    @Test("Long press background padding should be the negative spacings", arguments: DotsIndicatorSize.allCases)
    func longPressBackgroundPaddingShouldBeNegativeSpacings(size: DotsIndicatorSize) {
        let result = self.token.longPressBackgroundPadding(size: size)
        let spacing = self.theme.layout.spacing

        #expect(result.top == -self.token.spacing(size: size))
        #expect(result.bottom == -self.token.spacing(size: size))
        #expect(result.leading == -spacing.medium)
        #expect(result.trailing == -spacing.medium)
    }

    @Test
    func longPressScale() {
        #expect(self.token.longPressScale == 1.2)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(DotsIndicatorToken.Layout(theme: self.theme) == DotsIndicatorToken.Layout(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(DotsIndicatorToken.Layout(theme: self.theme) != DotsIndicatorToken.Layout(theme: ThemeGeneratedMock.mocked2()))
    }
}
