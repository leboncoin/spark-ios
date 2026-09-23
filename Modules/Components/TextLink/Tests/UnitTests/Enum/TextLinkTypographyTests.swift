//
//  TextLinkTypographyTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextLink

final class TextLinkTypographyTests: XCTestCase {

    // MARK: - Tests

    func test_default_case() {
        // GIVEN / WHEN
        let defaultTypography = TextLinkTypography.default

        // THEN
        XCTAssertEqual(defaultTypography, .body1, "Default case should be .body1")
    }

    func test_case_iterable_contains_all_cases() {
        // GIVEN
        let expectedCases: [TextLinkTypography] = [
            .display1,
            .display2,
            .display3,
            .headline1,
            .headline2,
            .subhead,
            .body1,
            .body2,
            .caption,
            .small,
            .callout
        ]

        // WHEN
        let allCases = TextLinkTypography.allCases

        // THEN
        XCTAssertEqual(allCases.count, 11, "Should have exactly 11 cases")
        XCTAssertEqual(Set(allCases), Set(expectedCases), "All cases should match expected cases")
    }
}
