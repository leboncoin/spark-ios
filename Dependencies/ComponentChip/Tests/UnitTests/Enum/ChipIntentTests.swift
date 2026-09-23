//
//  ChipIntentTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentChip

final class ChipIntentTests: XCTestCase {

    // MARK: - Tests

    func test_default_intent_is_support() {
        XCTAssertEqual(ChipIntent.default, .support)
    }

    func test_allCases_contains_only_non_deprecated_cases() {
        // Given
        let expectedCases: [ChipIntent] = [.danger, .main, .neutral, .support, .surface]

        // When
        let allCases = ChipIntent.allCases

        // Then
        XCTAssertEqual(allCases.count, 5)
        XCTAssertEqual(allCases, expectedCases)
    }

    func test_allCases_does_not_contain_deprecated_cases() {
        // Given
        let allCases = ChipIntent.allCases

        // Then
        XCTAssertFalse(allCases.contains(.accent))
        XCTAssertFalse(allCases.contains(.alert))
        XCTAssertFalse(allCases.contains(.info))
        XCTAssertFalse(allCases.contains(.success))
    }

    func test_allCases_is_ordered_alphabetically() {
        // Given
        let expectedOrder: [ChipIntent] = [.danger, .main, .neutral, .support, .surface]

        // When
        let allCases = ChipIntent.allCases

        // Then
        XCTAssertEqual(allCases, expectedOrder)
    }
}
