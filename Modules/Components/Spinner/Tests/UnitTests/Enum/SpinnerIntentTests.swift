//
//  SpinnerIntentTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Spinner Intent Tests")
struct SpinnerIntentTests {

    // MARK: - Tests

    @Test("Default value is support")
    func defaultValueIsSupport() {
        // GIVEN / WHEN / THEN
        #expect(SpinnerIntent.default == .support)
    }

    // MARK: - Equality Tests

    @Test("Equality standard cases")
    func equalityStandardCases() {
        // GIVEN / WHEN / THEN
        #expect(SpinnerIntent.accent == .accent)
        #expect(SpinnerIntent.alert == .alert)
        #expect(SpinnerIntent.error == .error)
        #expect(SpinnerIntent.info == .info)
        #expect(SpinnerIntent.main == .main)
        #expect(SpinnerIntent.neutral == .neutral)
        #expect(SpinnerIntent.success == .success)
        #expect(SpinnerIntent.support == .support)
    }

    @Test("Equality custom cases")
    func equalityCustomCases() {
        // GIVEN
        let colorToken = ColorTokenGeneratedMock.blue()
        let customIntent1 = SpinnerIntent.custom(colorToken)
        let customIntent2 = SpinnerIntent.custom(colorToken)
        let differentColorToken = ColorTokenGeneratedMock.green()
        let customIntent3 = SpinnerIntent.custom(differentColorToken)

        // WHEN / THEN
        #expect(customIntent1 == customIntent2)
        #expect(customIntent1 != customIntent3)
        #expect(customIntent1 != .support)
    }
}
