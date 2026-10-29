//
//  RatingDisplaySpacingsTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 14/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentRating

@MainActor
@Suite("Rating Display Spacings Tests")
struct RatingDisplaySpacingsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let spacings = RatingDisplaySpacings()

        // THEN
        #expect(spacings.content == 0.0)
        #expect(spacings.stars == 0.0)
    }

    @Test("Custom initialization")
    func customInitialization() {
        // GIVEN / WHEN
        let contentValue: CGFloat = 12.0
        let starsValue: CGFloat = 8.0

        let spacings = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue
        )

        // THEN
        #expect(spacings.content == contentValue)
        #expect(spacings.stars == starsValue)
    }

    @Test("Equality when same properties")
    func equalityWhenSameProperties() {
        // GIVEN / WHEN
        let contentValue: CGFloat = 10.0
        let starsValue: CGFloat = 5.0

        let spacings1 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue
        )

        let spacings2 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue
        )

        // THEN
        #expect(spacings1 == spacings2)
    }

    @Test("Inequality when different content spacing")
    func inequalityWhenDifferentContentSpacing() {
        // GIVEN / WHEN
        let contentValue1: CGFloat = 10.0
        let contentValue2: CGFloat = 12.0
        let starsValue: CGFloat = 5.0

        let spacings1 = RatingDisplaySpacings(
            content: contentValue1,
            stars: starsValue
        )

        let spacings2 = RatingDisplaySpacings(
            content: contentValue2,
            stars: starsValue
        )

        // THEN
        #expect(spacings1 != spacings2)
    }

    @Test("Inequality when different stars spacing")
    func inequalityWhenDifferentStarsSpacing() {
        // GIVEN / WHEN
        let contentValue: CGFloat = 10.0
        let starsValue1: CGFloat = 5.0
        let starsValue2: CGFloat = 8.0

        let spacings1 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue1
        )

        let spacings2 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue2
        )

        // THEN
        #expect(spacings1 != spacings2)
    }

    @Test("Hash consistency")
    func hashConsistency() {
        // GIVEN
        let contentValue: CGFloat = 15.0
        let starsValue: CGFloat = 7.0

        let spacings1 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue
        )

        let spacings2 = RatingDisplaySpacings(
            content: contentValue,
            stars: starsValue
        )

        // WHEN
        var hasher1 = Hasher()
        spacings1.hash(into: &hasher1)
        let hash1 = hasher1.finalize()

        var hasher2 = Hasher()
        spacings2.hash(into: &hasher2)
        let hash2 = hasher2.finalize()

        // THEN
        #expect(hash1 == hash2)
    }
}