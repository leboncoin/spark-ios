//
//  DotIndicatorToken+ColorsTests.swift
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

struct DotIndicatorTokenColorsTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: DotIndicatorToken.Colors {
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

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(DotIndicatorToken.Colors(theme: self.theme) == DotIndicatorToken.Colors(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(DotIndicatorToken.Colors(theme: self.theme) != DotIndicatorToken.Colors(theme: ThemeGeneratedMock.mocked2()))
    }
}
