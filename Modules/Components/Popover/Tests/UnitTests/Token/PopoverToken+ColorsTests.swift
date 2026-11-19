//
//  PopoverToken+ColorsTests.swift
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

struct PopoverTokenColorsTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: PopoverToken.Colors {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Foreground should return expected color", arguments: PopoverIntent.allCases)
    func foregroundShouldReturnExpectedColor(intent: PopoverIntent) {
        // GIVEN
        let colors = self.theme.colors
        let expected: any ColorToken = intent == .surface ? colors.base.onSurface : colors.feedback.info

        // WHEN
        let color = self.token.foreground(intent: intent)

        // THEN
        #expect(color.equals(expected))
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(PopoverToken.Colors(theme: self.theme) == PopoverToken.Colors(theme: self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(PopoverToken.Colors(theme: self.theme) != PopoverToken.Colors(theme: ThemeGeneratedMock.mocked2()))
    }
}
