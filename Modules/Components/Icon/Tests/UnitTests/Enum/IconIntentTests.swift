//
//  IconIntentTests.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentIcon
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Icon Intent Tests")
struct IconIntentTests {

    // MARK: - Tests

    @Test("Default equals support")
    func defaultEqualsSupport() {
        // GIVEN / WHEN / THEN
        #expect(IconIntent.default == .support)
    }

    // MARK: - Equatable Tests

    @Test("Equality same cases")
    func equalitySameCases() {
        // GIVEN
        let testCases: [(IconIntent, IconIntent)] = [
            (.accent, .accent),
            (.alert, .alert),
            (.error, .error),
            (.info, .info),
            (.main, .main),
            (.neutral, .neutral),
            (.success, .success),
            (.support, .support)
        ]

        // WHEN / THEN
        for (lhs, rhs) in testCases {
            #expect(lhs == rhs, "Expected \(lhs) to equal \(rhs)")
        }
    }

    @Test("Equality different cases")
    func equalityDifferentCases() {
        // GIVEN
        let testCases: [(IconIntent, IconIntent)] = [
            (.accent, .alert),
            (.error, .info),
            (.main, .neutral),
            (.success, .support),
            (.alert, .accent)
        ]

        // WHEN / THEN
        for (lhs, rhs) in testCases {
            #expect(lhs != rhs, "Expected \(lhs) to not equal \(rhs)")
        }
    }

    @Test("Equality custom same color token")
    func equalityCustomSameColorToken() {
        // GIVEN
        let intent1 = IconIntent.custom(ColorTokenGeneratedMock.blue())
        let intent2 = IconIntent.custom(ColorTokenGeneratedMock.blue())

        // WHEN / THEN
        #expect(intent1 == intent2)
    }

    @Test("Equality custom different color token")
    func equalityCustomDifferentColorToken() {
        // GIVEN
        let intent1 = IconIntent.custom(ColorTokenGeneratedMock.blue())
        let intent2 = IconIntent.custom(ColorTokenGeneratedMock.red())

        // WHEN / THEN
        #expect(intent1 != intent2)
    }
}
