//
//  TextLinkVariantTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextLink

@Suite("Text Link Variant Tests")
struct TextLinkVariantTests {

    // MARK: - Tests

    @Test("Default case")
    func defaultCase() {
        // GIVEN / WHEN
        let defaultVariant = TextLinkVariant.default

        // THEN
        #expect(defaultVariant == .underline, "Default case should be .underline")
    }

    @Test("Case iterable contains all cases")
    func caseIterableContainsAllCases() {
        // GIVEN
        let expectedCases: [TextLinkVariant] = [
            .underline,
            .none
        ]

        // WHEN
        let allCases = TextLinkVariant.allCases

        // THEN
        #expect(allCases.count == 2, "Should have exactly 2 cases")
        #expect(Set(allCases) == Set(expectedCases), "All cases should match expected cases")
    }
}
