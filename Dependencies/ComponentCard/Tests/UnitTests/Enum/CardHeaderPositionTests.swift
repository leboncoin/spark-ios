//
//  CardHeaderPositionTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 12/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard

// MARK: - Tests

@Suite("CardHeaderPosition Tests")
struct CardHeaderPositionTests {

    // MARK: - Tests

    @Test("Test all cases")
    func testAllCases() {
        // GIVEN / WHEN
        let expectedCases: [CardHeaderPosition] = [
            .banner,
            .border
        ]

        // THEN
        #expect(CardHeaderPosition.allCases == expectedCases)
        #expect(CardHeaderPosition.allCases.count == 2)
    }

    @Test("Test default value")
    func testDefaultValue() {
        // GIVEN / WHEN / THEN
        #expect(CardHeaderPosition.default == .banner)
    }

    @Test("Test betweenSpaces for banner")
    func testBetweenSpacesForBanner() {
        // GIVEN
        let position = CardHeaderPosition.banner

        // WHEN
        let betweenSpaces = position.betweenSpaces

        // THEN
        #expect(betweenSpaces == true)
    }

    @Test("Test betweenSpaces for border")
    func testBetweenSpacesForBorder() {
        // GIVEN
        let position = CardHeaderPosition.border

        // WHEN
        let betweenSpaces = position.betweenSpaces

        // THEN
        #expect(betweenSpaces == false)
    }

    @Test("Test contentHasTopPadding for banner")
    func testContentHasTopPaddingForBanner() {
        // GIVEN
        let position = CardHeaderPosition.banner

        // WHEN
        let contentHasTopPadding = position.contentHasTopPadding

        // THEN
        #expect(contentHasTopPadding == false)
    }

    @Test("Test contentHasTopPadding for border")
    func testContentHasTopPaddingForBorder() {
        // GIVEN
        let position = CardHeaderPosition.border

        // WHEN
        let contentHasTopPadding = position.contentHasTopPadding

        // THEN
        #expect(contentHasTopPadding == true)
    }
}
