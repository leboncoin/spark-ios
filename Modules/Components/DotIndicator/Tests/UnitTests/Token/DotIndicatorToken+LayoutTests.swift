//
//  DotIndicatorToken+LayoutTests.swift
//  SparkComponentDotIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentDotIndicator
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct DotIndicatorTokenLayoutTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: DotIndicatorToken.Layout {
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

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(DotIndicatorToken.Layout(theme: self.theme) == DotIndicatorToken.Layout(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(DotIndicatorToken.Layout(theme: self.theme) != DotIndicatorToken.Layout(theme: ThemeGeneratedMock.mocked2()))
    }
}
