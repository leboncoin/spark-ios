//
//  IconSizeTests.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentIcon

final class IconSizeTests: XCTestCase {

    // MARK: - Tests

    func test_default_equals_medium() {
        // GIVEN / WHEN / THEN
        XCTAssertEqual(IconSize.default, .medium)
    }

    // MARK: - Equatable Tests

    func test_equality_same_cases() {
        // GIVEN
        let testCases: [(IconSize, IconSize)] = [
            (.small, .small),
            (.medium, .medium),
            (.large, .large),
            (.extraLarge, .extraLarge),
            (.custom(10), .custom(10))
        ]

        // WHEN / THEN
        for (lhs, rhs) in testCases {
            XCTAssertEqual(lhs, rhs, "Expected \(lhs) to equal \(rhs)")
        }
    }

    func test_equality_different_cases() {
        // GIVEN
        let testCases: [(IconSize, IconSize)] = [
            (.small, .medium),
            (.medium, .large),
            (.large, .extraLarge),
            (.extraLarge, .small),
            (.custom(10), .small),
            (.custom(10), .custom(11))
        ]

        // WHEN / THEN
        for (lhs, rhs) in testCases {
            XCTAssertNotEqual(lhs, rhs, "Expected \(lhs) to not equal \(rhs)")
        }
    }
}
