//
//  TextLinkIntentTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SparkTheming
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Text Link Intent Tests")
struct TextLinkIntentTests {

    // MARK: - Tests

    @Test("Default case")
    func defaultCase() {
        // GIVEN / WHEN
        let defaultIntent = TextLinkIntent.default

        // THEN
        #expect(defaultIntent == .support, "Default case should be .support")
    }

    @Test("Equatable support cases")
    func equatableSupportCases() {
        // GIVEN / WHEN / THEN
        #expect(TextLinkIntent.accent == TextLinkIntent.accent)
        #expect(TextLinkIntent.alert == TextLinkIntent.alert)
        #expect(TextLinkIntent.danger == TextLinkIntent.danger)
        #expect(TextLinkIntent.info == TextLinkIntent.info)
        #expect(TextLinkIntent.main == TextLinkIntent.main)
        #expect(TextLinkIntent.neutral == TextLinkIntent.neutral)
        #expect(TextLinkIntent.success == TextLinkIntent.success)
        #expect(TextLinkIntent.support == TextLinkIntent.support)

        // Deprecated
        #expect(TextLinkIntent.accentContainer == TextLinkIntent.accentContainer)
        #expect(TextLinkIntent.onAccentContainer == TextLinkIntent.onAccentContainer)
        #expect(TextLinkIntent.alertContainer == TextLinkIntent.alertContainer)
        #expect(TextLinkIntent.supportContainer == TextLinkIntent.supportContainer)
        #expect(TextLinkIntent.dangerContainer == TextLinkIntent.dangerContainer)
        #expect(TextLinkIntent.infoContainer == TextLinkIntent.infoContainer)
        #expect(TextLinkIntent.mainContainer == TextLinkIntent.mainContainer)
        #expect(TextLinkIntent.neutralContainer == TextLinkIntent.neutralContainer)
        #expect(TextLinkIntent.surface == TextLinkIntent.surface)
        #expect(TextLinkIntent.onSurface == TextLinkIntent.onSurface)
        #expect(TextLinkIntent.successContainer == TextLinkIntent.successContainer)
        #expect(TextLinkIntent.supportContainer == TextLinkIntent.supportContainer)
    }

    @Test("Equatable different cases")
    func equatableDifferentCases() {
        // GIVEN / WHEN / THEN
        #expect(TextLinkIntent.accent != TextLinkIntent.alert)
        #expect(TextLinkIntent.danger != TextLinkIntent.info)
        #expect(TextLinkIntent.main != TextLinkIntent.neutral)
        #expect(TextLinkIntent.success != TextLinkIntent.support)
        #expect(TextLinkIntent.support != TextLinkIntent.accent)
    }

    @Test("Equatable custom cases equal")
    func equatableCustomCasesEqual() {
        // GIVEN
        let mockColorToken1 = ColorTokenGeneratedMock.blue()
        let mockColorToken2 = ColorTokenGeneratedMock.blue()

        // WHEN
        let customIntent1 = TextLinkIntent.custom(mockColorToken1)
        let customIntent2 = TextLinkIntent.custom(mockColorToken2)

        // THEN
        #expect(customIntent1 == customIntent2, "Custom intents should be equal when tokens are equal")
    }

    @Test("Equatable custom cases not equal")
    func equatableCustomCasesNotEqual() {
        // GIVEN
        let mockColorToken1 = ColorTokenGeneratedMock.blue()
        let mockColorToken2 = ColorTokenGeneratedMock.red()

        // WHEN
        let customIntent1 = TextLinkIntent.custom(mockColorToken1)
        let customIntent2 = TextLinkIntent.custom(mockColorToken2)

        // THEN
        #expect(customIntent1 != customIntent2, "Custom intents should not be equal when tokens are not equal")
    }

    @Test("Equatable custom vs support cases")
    func equatableCustomVsSupportCases() {
        // GIVEN
        let mockColorToken = ColorTokenGeneratedMock()
        let customIntent = TextLinkIntent.custom(mockColorToken)

        // WHEN / THEN
        #expect(customIntent != TextLinkIntent.support)
        #expect(customIntent != TextLinkIntent.accent)
        #expect(TextLinkIntent.main != customIntent)
    }
}
