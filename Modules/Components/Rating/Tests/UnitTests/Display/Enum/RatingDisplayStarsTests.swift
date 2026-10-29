//
//  RatingDisplayStarsTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentRating

@Suite("Rating Display Stars Tests")
struct RatingDisplayStarsTests {

    // MARK: - Tests

    @Test("Default is five")
    func defaultIsFive() {
        // GIVEN / WHEN / THEN
        #expect(RatingDisplayStars.default == .five)
    }

    @Test("Raw values")
    func rawValues() {
        // GIVEN / WHEN / THEN
        #expect(RatingDisplayStars.one.rawValue == 1)
        #expect(RatingDisplayStars.five.rawValue == 5)
    }

    @Test("All cases")
    func allCases() {
        // GIVEN / WHEN
        let allCases = RatingDisplayStars.allCases

        // THEN
        #expect(allCases.count == 2)
        #expect(allCases.contains(.one))
        #expect(allCases.contains(.five))
    }

    @Test("Initialization from raw value")
    func initializationFromRawValue() {
        // GIVEN / WHEN / THEN
        #expect(RatingDisplayStars(rawValue: 1) == .one)
        #expect(RatingDisplayStars(rawValue: 5) == .five)
        #expect(RatingDisplayStars(rawValue: 3) == nil)
        #expect(RatingDisplayStars(rawValue: 999) == nil)
    }
}
