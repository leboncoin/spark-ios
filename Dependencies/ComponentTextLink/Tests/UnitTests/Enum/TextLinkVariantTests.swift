//
//  TextLinkVariantTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextLink

final class TextLinkVariantTests: XCTestCase {

    // MARK: - Tests

    func test_default_case() {
        // GIVEN / WHEN
        let defaultVariant = TextLinkVariant.default

        // THEN
        XCTAssertEqual(defaultVariant, .underline, "Default case should be .underline")
    }

    func test_case_iterable_contains_all_cases() {
        // GIVEN
        let expectedCases: [TextLinkVariant] = [
            .underline,
            .none
        ]

        // WHEN
        let allCases = TextLinkVariant.allCases

        // THEN
        XCTAssertEqual(allCases.count, 2, "Should have exactly 2 cases")
        XCTAssertEqual(Set(allCases), Set(expectedCases), "All cases should match expected cases")
    }
}
