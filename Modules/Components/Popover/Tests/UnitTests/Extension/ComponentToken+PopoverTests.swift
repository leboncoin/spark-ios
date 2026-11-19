//
//  ComponentToken+PopoverTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
@testable import SparkComponentPopover
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct ComponentTokenPopoverTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Popover should return token from theme")
    func popoverShouldReturnTokenFromTheme() {
        #expect(ComponentToken(theme: self.theme).popover == PopoverToken(theme: self.theme))
    }

    @Test("Popover from theme component should return token from theme")
    func popoverFromThemeComponentShouldReturnTokenFromTheme() {
        #expect(self.theme.component.popover == PopoverToken(theme: self.theme))
    }

    @Test("Popover with different theme should not return token from theme")
    func popoverWithDifferentThemeShouldNotReturnTokenFromTheme() {
        #expect(ComponentToken(theme: ThemeGeneratedMock.mocked2()).popover != PopoverToken(theme: self.theme))
    }
}
