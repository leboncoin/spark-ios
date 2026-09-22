//
//  IconGetTintColorUseCaseTests.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentIcon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class IconGetTintColorUseCaseTests: XCTestCase {

    // MARK: - Properties

    var theme: ThemeGeneratedMock!
    var sut: IconGetTintColorUseCase!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = IconGetTintColorUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Predefined Intents Tests

    func test_execute_all_predefined_intents() {
        // GIVEN
        let colors = theme.colors

        let testCases: [(IconIntent, any ColorToken)] = [
            (.accent, colors.accent.accent),
            (.alert, colors.feedback.alert),
            (.error, colors.feedback.error),
            (.info, colors.feedback.info),
            (.main, colors.main.main),
            (.neutral, colors.feedback.neutral),
            (.success, colors.feedback.success),
            (.support, colors.support.support)
        ]

        // WHEN / THEN
        for (intent, expectedColorToken) in testCases {
            let result = self.sut.execute(theme: self.theme, intent: intent)

            // THEN
            XCTAssertTrue(
                result.equals(expectedColorToken),
                "Expected intent \(intent) to return the correct color token"
            )
        }
    }

    // MARK: - Custom Intent Tests

    func test_execute_with_custom_intent() {
        // GIVEN
        let customColorToken = ColorTokenGeneratedMock.blue()
        let intent = IconIntent.custom(ColorTokenGeneratedMock.blue())

        // WHEN
        let result = self.sut.execute(theme: self.theme, intent: intent)

        // THEN
        XCTAssertTrue(result.equals(customColorToken))
    }
}
