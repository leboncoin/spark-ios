//
//  RatingDisplaySizeTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentRating

@Suite("Rating Display Size Tests")
struct RatingDisplaySizeTests {

    // MARK: - Tests

    @Test("Default is medium")
    func defaultIsMedium() {
        // GIVEN / WHEN / THEN
        #expect(RatingDisplaySize.default == .medium)
    }

    @Test("Raw values")
    func rawValues() {
        // GIVEN / WHEN / THEN
        #expect(RatingDisplaySize.small.rawValue == 12)
        #expect(RatingDisplaySize.medium.rawValue == 16)
        #expect(RatingDisplaySize.large.rawValue == 24)
    }

    @Test("All cases only includes non deprecated")
    func allCasesOnlyIncludesNonDeprecated() {
        // GIVEN / WHEN
        let allCases = RatingDisplaySize.allCases

        // THEN
        #expect(allCases.count == 3)
        #expect(allCases.contains(.small))
        #expect(allCases.contains(.medium))
        #expect(allCases.contains(.large))
        #expect(!(allCases.contains(.input)))
    }

    @Test("Initialization from raw value")
    func initializationFromRawValue() {
        // GIVEN / WHEN / THEN
        #expect(RatingDisplaySize(rawValue: 12) == .small)
        #expect(RatingDisplaySize(rawValue: 16) == .medium)
        #expect(RatingDisplaySize(rawValue: 24) == .large)
        #expect(RatingDisplaySize(rawValue: 40) == .input)
        #expect(RatingDisplaySize(rawValue: 999) == nil)
    }

    @Test("Cg float returns correct values")
    func cgFloatReturnsCorrectValues() {
        // GIVEN / WHEN / THEN
        #expect(RatingDisplaySize.small.cgFloat == 12.0)
        #expect(RatingDisplaySize.medium.cgFloat == 16.0)
        #expect(RatingDisplaySize.large.cgFloat == 24.0)
        #expect(RatingDisplaySize.input.cgFloat == 40.0)
    }
}
