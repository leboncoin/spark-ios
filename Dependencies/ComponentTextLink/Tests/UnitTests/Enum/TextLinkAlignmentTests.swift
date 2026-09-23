//
//  TextLinkAlignmentTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextLink

final class TextLinkAlignmentTests: XCTestCase {

    // MARK: - Tests

    func test_default_case() {
        // GIVEN / WHEN
        let defaultAlignment = TextLinkAlignment.default

        // THEN
        XCTAssertEqual(defaultAlignment, .leadingImage, "Default case should be .leadingImage")
    }

    func test_case_iterable_contains_all_cases() {
        // GIVEN
        let expectedCases: [TextLinkAlignment] = [
            .leadingImage,
            .trailingImage
        ]

        // WHEN
        let allCases = TextLinkAlignment.allCases

        // THEN
        XCTAssertEqual(allCases.count, 2, "Should have exactly 2 cases")
        XCTAssertEqual(Set(allCases), Set(expectedCases), "All cases should match expected cases")
    }

    func test_isTrailingImage_property() {
        // GIVEN / WHEN / THEN
        XCTAssertTrue(TextLinkAlignment.trailingImage.isTrailingImage, "trailingImage should have isTrailingImage true")
        XCTAssertFalse(TextLinkAlignment.leadingImage.isTrailingImage, "leadingImage should have isTrailingImage false")
    }
}
