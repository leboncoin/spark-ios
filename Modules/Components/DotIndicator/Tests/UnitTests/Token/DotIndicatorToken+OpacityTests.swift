//
//  DotIndicatorToken+OpacityTests.swift
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

struct DotIndicatorTokenOpacityTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: DotIndicatorToken.Opacity {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Value when enabled should return dim none")
    func valueWhenEnabledShouldReturnDimNone() {
        #expect(self.token.value(isEnabled: true) == self.theme.dims.none)
    }

    @Test("Value when disabled should return dim 3")
    func valueWhenDisabledShouldReturnDim3() {
        #expect(self.token.value(isEnabled: false) == self.theme.dims.dim3)
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(DotIndicatorToken.Opacity(theme: self.theme) == DotIndicatorToken.Opacity(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(DotIndicatorToken.Opacity(theme: self.theme) != DotIndicatorToken.Opacity(theme: ThemeGeneratedMock.mocked2()))
    }
}
