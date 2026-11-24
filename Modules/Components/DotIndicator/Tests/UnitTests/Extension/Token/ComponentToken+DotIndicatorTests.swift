//
//  ComponentToken+DotIndicatorTests.swift
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

struct ComponentTokenDotIndicatorTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Dot indicator should return token from theme")
    func dotIndicatorShouldReturnTokenFromTheme() {
        #expect(ComponentToken(theme: self.theme).dotIndicator == DotIndicatorToken(theme: self.theme))
    }

    @Test("Dot indicator from theme component should return token from theme")
    func dotIndicatorFromThemeComponentShouldReturnTokenFromTheme() {
        #expect(self.theme.component.dotIndicator == DotIndicatorToken(theme: self.theme))
    }

    @Test("Dot indicator with different theme should not return token from theme")
    func dotIndicatorWithDifferentThemeShouldNotReturnTokenFromTheme() {
        #expect(ComponentToken(theme: ThemeGeneratedMock.mocked2()).dotIndicator != DotIndicatorToken(theme: self.theme))
    }
}
