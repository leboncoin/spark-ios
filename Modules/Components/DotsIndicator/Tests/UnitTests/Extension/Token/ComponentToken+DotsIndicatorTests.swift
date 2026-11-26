//
//  ComponentToken+DotsIndicatorTests.swift
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

struct ComponentTokenDotsIndicatorTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Dots indicator should return token from theme")
    func dotsIndicatorShouldReturnTokenFromTheme() {
        #expect(ComponentToken(theme: self.theme).dotsIndicator == DotsIndicatorToken(theme: self.theme))
    }

    @Test("Dots indicator from theme component should return token from theme")
    func dotsIndicatorFromThemeComponentShouldReturnTokenFromTheme() {
        #expect(self.theme.component.dotsIndicator == DotsIndicatorToken(theme: self.theme))
    }

    @Test("Dots indicator with different theme should not return token from theme")
    func dotsIndicatorWithDifferentThemeShouldNotReturnTokenFromTheme() {
        #expect(ComponentToken(theme: ThemeGeneratedMock.mocked2()).dotsIndicator != DotsIndicatorToken(theme: self.theme))
    }
}
