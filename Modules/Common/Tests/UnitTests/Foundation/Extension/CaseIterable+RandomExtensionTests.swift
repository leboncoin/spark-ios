//
//  CaseIterable+RandomExtensionTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@_spi(SI_SPI) @testable import SparkCommonTesting

final class CaseIterableRandomExtensionTests: XCTestCase {

    // MARK: - Enum

    private enum TestEnum: CaseIterable, Equatable {
        case first
        case second
        case third
        case fourth
    }

    // MARK: - Tests

    func test_otherRandom_returns_different_value() {
        // GIVEN
        let originalValue = TestEnum.first

        // WHEN
        let otherValue = originalValue.otherRandom

        // THEN
        XCTAssertNotEqual(originalValue, otherValue)
        XCTAssertTrue(TestEnum.allCases.contains(otherValue))
    }

    func test_otherRandom_multiple_calls_return_valid_values() {
        // GIVEN
        let originalValue = TestEnum.second

        // WHEN & THEN
        for _ in 0..<100 {
            let otherValue = originalValue.otherRandom
            XCTAssertNotEqual(originalValue, otherValue)
            XCTAssertTrue(TestEnum.allCases.contains(otherValue))
        }
    }

    func test_otherRandom_with_all_enum_cases() {
        // GIVEN & WHEN & THEN
        for enumCase in TestEnum.allCases {
            let otherValue = enumCase.otherRandom
            XCTAssertNotEqual(enumCase, otherValue)
            XCTAssertTrue(TestEnum.allCases.contains(otherValue))
        }
    }
}
