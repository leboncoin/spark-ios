//
//  IconSizeTests.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentIcon

@Suite("Icon Size Tests")
struct IconSizeTests {

    // MARK: - Tests

    @Test("Default equals medium")
    func defaultEqualsMedium() {
        // GIVEN / WHEN / THEN
        #expect(IconSize.default == .medium)
    }

    // MARK: - Equatable Tests

    @Test("Equality same cases")
    func equalitySameCases() {
        // GIVEN
        let testCases: [(IconSize, IconSize)] = [
            (.small, .small),
            (.medium, .medium),
            (.large, .large),
            (.extraLarge, .extraLarge),
            (.custom(10), .custom(10))
        ]

        // WHEN / THEN
        for (lhs, rhs) in testCases {
            #expect(lhs == rhs, "Expected \(lhs) to equal \(rhs)")
        }
    }

    @Test("Equality different cases")
    func equalityDifferentCases() {
        // GIVEN
        let testCases: [(IconSize, IconSize)] = [
            (.small, .medium),
            (.medium, .large),
            (.large, .extraLarge),
            (.extraLarge, .small),
            (.custom(10), .small),
            (.custom(10), .custom(11))
        ]

        // WHEN / THEN
        for (lhs, rhs) in testCases {
            #expect(lhs != rhs, "Expected \(lhs) to not equal \(rhs)")
        }
    }
}
