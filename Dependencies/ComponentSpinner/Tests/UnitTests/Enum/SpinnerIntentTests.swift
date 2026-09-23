//
//  SpinnerIntentTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
@_spi(SI_SPI) import SparkThemingTesting
import XCTest

final class SpinnerIntentTests: XCTestCase {

    // MARK: - Tests

    func test_defaultValue_isSupport() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(SpinnerIntent.default, .support)
    }

    // MARK: - Equality Tests

    func test_equality_standardCases() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(SpinnerIntent.accent, .accent)
        XCTAssertEqual(SpinnerIntent.alert, .alert)
        XCTAssertEqual(SpinnerIntent.error, .error)
        XCTAssertEqual(SpinnerIntent.info, .info)
        XCTAssertEqual(SpinnerIntent.main, .main)
        XCTAssertEqual(SpinnerIntent.neutral, .neutral)
        XCTAssertEqual(SpinnerIntent.success, .success)
        XCTAssertEqual(SpinnerIntent.support, .support)
    }

    func test_equality_customCases() {
        // GIVEN
        let colorToken = ColorTokenGeneratedMock.blue()
        let customIntent1 = SpinnerIntent.custom(colorToken)
        let customIntent2 = SpinnerIntent.custom(colorToken)
        let differentColorToken = ColorTokenGeneratedMock.green()
        let customIntent3 = SpinnerIntent.custom(differentColorToken)

        // WHEN / THEN
        XCTAssertEqual(customIntent1, customIntent2)
        XCTAssertNotEqual(customIntent1, customIntent3)
        XCTAssertNotEqual(customIntent1, .support)
    }
}
