//
//  SegmentedGaugeSegmentBorderTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge

@Suite("SegmentedGauge Segment Border Tests")
struct SegmentedGaugeSegmentBorderTests {

    // MARK: - Default Values Tests

    @Test("Default initializer sets zero values")
    func defaultInitializerSetsZeroValues() {
        // GIVEN / WHEN
        let border = SegmentedGaugeSegmentBorder()

        // THEN
        #expect(border.width == 0)
        #expect(border.radius == 0)
    }

    // MARK: - Equatable Tests

    @Test("Equality when values match")
    func equalityWhenValuesMatch() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeSegmentBorder(width: 2, radius: 5)
        let rhs = SegmentedGaugeSegmentBorder(width: 2, radius: 5)

        #expect(lhs == rhs)
    }

    @Test("Inequality when width differs")
    func inequalityWhenWidthDiffers() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeSegmentBorder(width: 2, radius: 5)
        let rhs = SegmentedGaugeSegmentBorder(width: 3, radius: 5)

        #expect(lhs != rhs)
    }

    @Test("Inequality when radius differs")
    func inequalityWhenRadiusDiffers() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeSegmentBorder(width: 2, radius: 5)
        let rhs = SegmentedGaugeSegmentBorder(width: 2, radius: 4)

        #expect(lhs != rhs)
    }
}
