//
//  EnvironmentTheme+DotIndicatorTokenTests.swift
//  SparkComponentDotIndicatorTests
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentDotIndicator
@testable import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct EnvironmentThemeDotIndicatorTokenTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var environmentTheme: EnvironmentTheme {
        return .init(value: self.theme)
    }

    private var token: DotIndicatorToken {
        return self.theme.component.dotIndicator
    }

    // MARK: - Tests

    @Test("Border should return dot indicator border")
    func borderShouldReturnDotIndicatorBorder() {
        #expect(self.environmentTheme.border == self.token.border)
    }

    @Test("Colors should return dot indicator colors")
    func colorsShouldReturnDotIndicatorColors() {
        #expect(self.environmentTheme.colors == self.token.colors)
    }

    @Test("Layout should return dot indicator layout")
    func layoutShouldReturnDotIndicatorLayout() {
        #expect(self.environmentTheme.layout == self.token.layout)
    }

    @Test("Opacity should return dot indicator opacity")
    func opacityShouldReturnDotIndicatorOpacity() {
        #expect(self.environmentTheme.opacity == self.token.opacity)
    }

    @Test("Size should return dot indicator size")
    func sizeShouldReturnDotIndicatorSize() {
        #expect(self.environmentTheme.size == self.token.size)
    }
}
