//
//  TextLinkTypographyTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextLink

@Suite("Text Link Typography Tests")
struct TextLinkTypographyTests {

    // MARK: - Tests

    @Test("Default case")
    func defaultCase() {
        // GIVEN / WHEN
        let defaultTypography = TextLinkTypography.default

        // THEN
        #expect(defaultTypography == .body1, "Default case should be .body1")
    }

    @Test("Case iterable contains all cases")
    func caseIterableContainsAllCases() {
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
        #expect(allCases.count == 11, "Should have exactly 11 cases")
        #expect(Set(allCases) == Set(expectedCases), "All cases should match expected cases")
    }
}
