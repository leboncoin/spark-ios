//
//  TextLinkIntentTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SparkTheming
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkThemingTesting

final class TextLinkIntentTests: XCTestCase {

    // MARK: - Tests

    func test_default_case() {
        // GIVEN / WHEN
        let defaultIntent = TextLinkIntent.default

        // THEN
        XCTAssertEqual(defaultIntent, .support, "Default case should be .support")
    }

    func test_equatable_support_cases() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(TextLinkIntent.accent, TextLinkIntent.accent)
        XCTAssertEqual(TextLinkIntent.alert, TextLinkIntent.alert)
        XCTAssertEqual(TextLinkIntent.danger, TextLinkIntent.danger)
        XCTAssertEqual(TextLinkIntent.info, TextLinkIntent.info)
        XCTAssertEqual(TextLinkIntent.main, TextLinkIntent.main)
        XCTAssertEqual(TextLinkIntent.neutral, TextLinkIntent.neutral)
        XCTAssertEqual(TextLinkIntent.success, TextLinkIntent.success)
        XCTAssertEqual(TextLinkIntent.support, TextLinkIntent.support)

        // Deprecated
        XCTAssertEqual(TextLinkIntent.accentContainer, TextLinkIntent.accentContainer)
        XCTAssertEqual(TextLinkIntent.onAccentContainer, TextLinkIntent.onAccentContainer)
        XCTAssertEqual(TextLinkIntent.alertContainer, TextLinkIntent.alertContainer)
        XCTAssertEqual(TextLinkIntent.supportContainer, TextLinkIntent.supportContainer)
        XCTAssertEqual(TextLinkIntent.dangerContainer, TextLinkIntent.dangerContainer)
        XCTAssertEqual(TextLinkIntent.infoContainer, TextLinkIntent.infoContainer)
        XCTAssertEqual(TextLinkIntent.mainContainer, TextLinkIntent.mainContainer)
        XCTAssertEqual(TextLinkIntent.neutralContainer, TextLinkIntent.neutralContainer)
        XCTAssertEqual(TextLinkIntent.surface, TextLinkIntent.surface)
        XCTAssertEqual(TextLinkIntent.onSurface, TextLinkIntent.onSurface)
        XCTAssertEqual(TextLinkIntent.successContainer, TextLinkIntent.successContainer)
        XCTAssertEqual(TextLinkIntent.supportContainer, TextLinkIntent.supportContainer)
    }

    func test_equatable_different_cases() {
        // GIVEN / WHEN / THEN
        XCTAssertNotEqual(TextLinkIntent.accent, TextLinkIntent.alert)
        XCTAssertNotEqual(TextLinkIntent.danger, TextLinkIntent.info)
        XCTAssertNotEqual(TextLinkIntent.main, TextLinkIntent.neutral)
        XCTAssertNotEqual(TextLinkIntent.success, TextLinkIntent.support)
        XCTAssertNotEqual(TextLinkIntent.support, TextLinkIntent.accent)
    }

    func test_equatable_custom_cases_equal() {
        // GIVEN
        let mockColorToken1 = ColorTokenGeneratedMock.blue()
        let mockColorToken2 = ColorTokenGeneratedMock.blue()

        // WHEN
        let customIntent1 = TextLinkIntent.custom(mockColorToken1)
        let customIntent2 = TextLinkIntent.custom(mockColorToken2)

        // THEN
        XCTAssertEqual(customIntent1, customIntent2, "Custom intents should be equal when tokens are equal")
    }

    func test_equatable_custom_cases_not_equal() {
        // GIVEN
        let mockColorToken1 = ColorTokenGeneratedMock.blue()
        let mockColorToken2 = ColorTokenGeneratedMock.red()

        // WHEN
        let customIntent1 = TextLinkIntent.custom(mockColorToken1)
        let customIntent2 = TextLinkIntent.custom(mockColorToken2)

        // THEN
        XCTAssertNotEqual(customIntent1, customIntent2, "Custom intents should not be equal when tokens are not equal")
    }

    func test_equatable_custom_vs_support_cases() {
        // GIVEN
        let mockColorToken = ColorTokenGeneratedMock()
        let customIntent = TextLinkIntent.custom(mockColorToken)

        // WHEN / THEN
        XCTAssertNotEqual(customIntent, TextLinkIntent.support)
        XCTAssertNotEqual(customIntent, TextLinkIntent.accent)
        XCTAssertNotEqual(TextLinkIntent.main, customIntent)
    }
}
