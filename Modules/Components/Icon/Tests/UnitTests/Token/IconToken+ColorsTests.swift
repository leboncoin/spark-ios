//
//  IconToken+ColorsTests.swift
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

struct IconTokenColorsTests {

    // MARK: - Properties

    private static let theme = ThemeGeneratedMock.mocked()
    private static let colors = Self.theme.colors

    private let token = IconToken.Colors(theme: Self.theme)

    // MARK: - Tests

    @Test("Tint should return expected color token", arguments: [
        (IconIntent.ai, Self.colors.ai.ai),
        (IconIntent.accent, Self.colors.accent.accent),
        (IconIntent.alert, Self.colors.feedback.alert),
        (IconIntent.error, Self.colors.feedback.error),
        (IconIntent.info, Self.colors.feedback.info),
        (IconIntent.main, Self.colors.main.main),
        (IconIntent.neutral, Self.colors.feedback.neutral),
        (IconIntent.success, Self.colors.feedback.success),
        (IconIntent.support, Self.colors.support.support)
    ] as [(IconIntent, any ColorToken)])
    func tintShouldReturnExpectedColorToken(intent: IconIntent, expectedColorToken: any ColorToken) {
        #expect(self.token.tint(intent: intent).equals(expectedColorToken))
    }

    @Test("Tint with custom intent should return custom color token")
    func tintWithCustomIntentShouldReturnCustomColorToken() {
        // GIVEN
        let colorToken = ColorTokenGeneratedMock.blue()

        // WHEN / THEN
        #expect(self.token.tint(intent: .custom(colorToken)).equals(colorToken))
    }

    // MARK: - Equatable Tests

    @Test("Equatable with same theme should return true")
    func equatableWithSameThemeShouldReturnTrue() {
        #expect(IconToken.Colors(theme: Self.theme) == IconToken.Colors(theme: Self.theme))
    }

    @Test("Equatable with different theme should return false")
    func equatableWithDifferentThemeShouldReturnFalse() {
        #expect(IconToken.Colors(theme: Self.theme) != IconToken.Colors(theme: ThemeGeneratedMock.mocked2()))
    }
}
