//
//  IntConvertedValueTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 21/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentBadge

@Suite("Int Converted Value Tests")
struct IntConvertedValueTests {

    // MARK: - Tests

    @Test("Converted when value is nil")
    func convertedWhenValueIsNil() {
        // GIVEN
        let sut: Int? = nil

        // WHEN
        let converted = sut.converted("kg")

        // THEN
        #expect(converted == nil)
    }

    @Test("Converted when unit is nil")
    func convertedWhenUnitIsNil() {
        // GIVEN
        let sut: Int? = 42

        // WHEN
        let converted = sut.converted(nil)

        // THEN
        #expect(converted == "42")
    }

    @Test("Converted when unit is not nil")
    func convertedWhenUnitIsNotNil() {
        // GIVEN
        let sut: Int? = 42

        // WHEN
        let converted = sut.converted("kg")

        // THEN
        #expect(converted == "42kg")
    }

    @Test("Converted when value is greater than max")
    func convertedWhenValueIsGreaterThanMax() {
        // GIVEN
        let sut: Int? = 150

        // WHEN
        let converted = sut.converted("kg")

        // THEN
        #expect(converted == "99kg")
    }
}
