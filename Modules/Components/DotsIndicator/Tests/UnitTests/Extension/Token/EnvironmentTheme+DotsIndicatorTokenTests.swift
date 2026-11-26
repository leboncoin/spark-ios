//
//  EnvironmentTheme+DotsIndicatorTokenTests.swift
//  SparkComponentDotsIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentDotsIndicator
@testable import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct EnvironmentThemeDotsIndicatorTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var environmentTheme: EnvironmentTheme {
        return .init(value: self.theme)
    }

    private var token: DotsIndicatorToken {
        return self.theme.component.dotsIndicator
    }

    // MARK: - Tests

    @Test("Border should return dots indicator border")
    func borderShouldReturnDotsIndicatorBorder() {
        #expect(self.environmentTheme.border == self.token.border)
    }

    @Test("Colors should return dots indicator colors")
    func colorsShouldReturnDotsIndicatorColors() {
        #expect(self.environmentTheme.colors == self.token.colors)
    }

    @Test("Layout should return dots indicator layout")
    func layoutShouldReturnDotsIndicatorLayout() {
        #expect(self.environmentTheme.layout == self.token.layout)
    }

    @Test("Opacity should return dots indicator opacity")
    func opacityShouldReturnDotsIndicatorOpacity() {
        #expect(self.environmentTheme.opacity == self.token.opacity)
    }

    @Test("Size should return dots indicator size")
    func sizeShouldReturnDotsIndicatorSize() {
        #expect(self.environmentTheme.size == self.token.size)
    }

    @Test("Animation should return dots indicator animation")
    func animationShouldReturnDotsIndicatorAnimation() {
        #expect(self.environmentTheme.animation == self.token.animation)
    }
}
