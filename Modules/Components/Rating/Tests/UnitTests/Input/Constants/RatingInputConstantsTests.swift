//
//  RatingInputConstantsTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentRating

@Suite("Rating Input Constants Tests")
struct RatingInputConstantsTests {

    // MARK: - Tests

    @Test("Size constant")
    func sizeConstant() {
        // GIVEN / WHEN / THEN
        #expect(RatingInputConstants.size == 40.0)
    }

    @Test("Scaled ratio constant")
    func scaledRatioConstant() {
        // GIVEN / WHEN / THEN
        #expect(RatingInputConstants.scaledRatio == 1.5)
    }

    @Test("Stars constant")
    func starsConstant() {
        // GIVEN / WHEN / THEN
        #expect(RatingInputConstants.stars == 5)
    }

    @Test("Scaled animation duration constant")
    func scaledAnimationDurationConstant() {
        // GIVEN / WHEN / THEN
        #expect(RatingInputConstants.scaledAnimationDuration == 0.2)
    }
}
