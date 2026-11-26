//
//  DotsIndicatorToken+ColorsTests.swift
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

struct DotsIndicatorTokenColorsTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: DotsIndicatorToken.Colors {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Active dot with support intent should return support")
    func activeDotWithSupportIntentShouldReturnSupport() {
        let result = self.token.dot(intent: .support, isActive: true)
        #expect(result.equals(self.theme.colors.support.support))
    }

    @Test("Inactive dot with support intent should return dimmed support")
    func inactiveDotWithSupportIntentShouldReturnDimmedSupport() {
        let result = self.token.dot(intent: .support, isActive: false)
        #expect(result.equals(self.theme.colors.support.support.opacity(self.theme.dims.dim2)))
    }

    @Test("Active dot with surface intent should return surface")
    func activeDotWithSurfaceIntentShouldReturnSurface() {
        let result = self.token.dot(intent: .surface, isActive: true)
        #expect(result.equals(self.theme.colors.base.surface))
    }

    @Test("Inactive dot with surface intent should return dimmed surface")
    func inactiveDotWithSurfaceIntentShouldReturnDimmedSurface() {
        let result = self.token.dot(intent: .surface, isActive: false)
        #expect(result.equals(self.theme.colors.base.surface.opacity(self.theme.dims.dim2)))
    }

    @Test("Long press background should return the dimmed active dot color", arguments: DotsIndicatorIntent.allCases)
    func longPressBackgroundShouldReturnDimmedActiveDotColor(intent: DotsIndicatorIntent) {
        let result = self.token.longPressBackground(intent: intent)
        let expected = self.token.dot(intent: intent, isActive: true).opacity(self.theme.dims.dim4)
        #expect(result.equals(expected))
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(DotsIndicatorToken.Colors(theme: self.theme) == DotsIndicatorToken.Colors(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(DotsIndicatorToken.Colors(theme: self.theme) != DotsIndicatorToken.Colors(theme: ThemeGeneratedMock.mocked2()))
    }
}
