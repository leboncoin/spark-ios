//
//  CardPaddingTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 16/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard

// MARK: - Tests

@Suite("CardPadding Tests")
struct CardPaddingTests {

    // MARK: - Tests

    @Test("Test all cases")
    func testAllCases() {
        // GIVEN / WHEN
        let expectedCases: [CardPadding] = [
            .none,
            .all,
            .allAndBottomHeader
        ]

        // THEN
        #expect(CardPadding.allCases == expectedCases)
        #expect(CardPadding.allCases.count == 3)
    }

    @Test("Test default value")
    func testDefaultValue() {
        // GIVEN / WHEN / THEN
        #expect(CardPadding.default == .all)
    }

    @Test("Test isPadding for none")
    func testIsPaddingForNone() {
        // GIVEN
        let padding = CardPadding.none

        // WHEN
        let isPadding = padding.isPadding

        // THEN
        #expect(isPadding == false)
    }

    @Test("Test isPadding for all")
    func testIsPaddingForAll() {
        // GIVEN
        let padding = CardPadding.all

        // WHEN
        let isPadding = padding.isPadding

        // THEN
        #expect(isPadding == true)
    }

    @Test("Test isPadding for allAndBottomHeader")
    func testIsPaddingForAllAndBottomHeader() {
        // GIVEN
        let padding = CardPadding.allAndBottomHeader

        // WHEN
        let isPadding = padding.isPadding

        // THEN
        #expect(isPadding == true)
    }
}
