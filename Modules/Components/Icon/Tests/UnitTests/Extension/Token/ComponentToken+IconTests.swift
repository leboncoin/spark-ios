//
//  ComponentToken+IconTests.swift
//  SparkComponentIconTests
//
//  Created by robin.lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentIcon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct ComponentTokenIconTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Icon should return token from theme")
    func iconShouldReturnTokenFromTheme() {
        #expect(ComponentToken(theme: self.theme).icon == IconToken(theme: self.theme))
    }

    @Test("Icon from theme component should return token from theme")
    func iconFromThemeComponentShouldReturnTokenFromTheme() {
        #expect(self.theme.component.icon == IconToken(theme: self.theme))
    }

    @Test("Icon with different theme should not return token from theme")
    func iconWithDifferentThemeShouldNotReturnTokenFromTheme() {
        #expect(ComponentToken(theme: ThemeGeneratedMock.mocked2()).icon != IconToken(theme: self.theme))
    }
}
