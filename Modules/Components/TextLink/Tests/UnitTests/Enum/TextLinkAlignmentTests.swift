//
//  TextLinkAlignmentTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextLink

@Suite("Text Link Alignment Tests")
struct TextLinkAlignmentTests {

    // MARK: - Tests

    @Test("Default case")
    func defaultCase() {
        // GIVEN / WHEN
        let defaultAlignment = TextLinkAlignment.default

        // THEN
        #expect(defaultAlignment == .leadingImage, "Default case should be .leadingImage")
    }

    @Test("Case iterable contains all cases")
    func caseIterableContainsAllCases() {
        // GIVEN
        let expectedCases: [TextLinkAlignment] = [
            .leadingImage,
            .trailingImage
        ]

        // WHEN
        let allCases = TextLinkAlignment.allCases

        // THEN
        #expect(allCases.count == 2, "Should have exactly 2 cases")
        #expect(Set(allCases) == Set(expectedCases), "All cases should match expected cases")
    }

    @Test("Is trailing image property")
    func isTrailingImageProperty() {
        // GIVEN / WHEN / THEN
        #expect(TextLinkAlignment.trailingImage.isTrailingImage, "trailingImage should have isTrailingImage true")
        #expect(!TextLinkAlignment.leadingImage.isTrailingImage, "leadingImage should have isTrailingImage false")
    }
}
