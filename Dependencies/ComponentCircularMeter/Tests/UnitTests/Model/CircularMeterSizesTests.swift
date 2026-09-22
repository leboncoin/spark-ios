//
//  CircularMeterSizesTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCircularMeter

@Suite("Circular Meter Sizes Tests")
struct CircularMeterSizesTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let sizes = CircularMeterSizes()

        // THEN
        #expect(sizes.gaugeDiameter == .zero)
        #expect(sizes.gaugeStroke == .zero)
        #expect(sizes.icon == .zero)
    }

    @Test("Equality when same sizes")
    func equalityWhenSameSizes() {
        // GIVEN / WHEN
        let sizes1 = CircularMeterSizes(
            gaugeDiameter: 96,
            gaugeStroke: 8,
            icon: 32
        )

        let sizes2 = CircularMeterSizes(
            gaugeDiameter: 96,
            gaugeStroke: 8,
            icon: 32
        )

        // THEN
        #expect(sizes1 == sizes2)
    }

    @Test("Inequality when different gauge diameter")
    func inequalityWhenDifferentGaugeDiameter() {
        // GIVEN / WHEN
        let sizes1 = CircularMeterSizes(
            gaugeDiameter: 96,
            gaugeStroke: 8,
            icon: 32
        )

        let sizes2 = CircularMeterSizes(
            gaugeDiameter: 128,
            gaugeStroke: 8,
            icon: 32
        )

        // THEN
        #expect(sizes1 != sizes2)
    }

    @Test("Inequality when different gauge stroke")
    func inequalityWhenDifferentGaugeStroke() {
        // GIVEN / WHEN
        let sizes1 = CircularMeterSizes(
            gaugeDiameter: 96,
            gaugeStroke: 8,
            icon: 32
        )

        let sizes2 = CircularMeterSizes(
            gaugeDiameter: 96,
            gaugeStroke: 10,
            icon: 32
        )

        // THEN
        #expect(sizes1 != sizes2)
    }

    @Test("Inequality when different icon size")
    func inequalityWhenDifferentIconSize() {
        // GIVEN / WHEN
        let sizes1 = CircularMeterSizes(
            gaugeDiameter: 96,
            gaugeStroke: 8,
            icon: 32
        )

        let sizes2 = CircularMeterSizes(
            gaugeDiameter: 96,
            gaugeStroke: 8,
            icon: 40
        )

        // THEN
        #expect(sizes1 != sizes2)
    }
}
