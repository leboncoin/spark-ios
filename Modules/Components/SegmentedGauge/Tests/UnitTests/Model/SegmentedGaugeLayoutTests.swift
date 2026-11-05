//
//  SegmentedGaugeLayoutTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge

@Suite("SegmentedGauge Layout Tests")
struct SegmentedGaugeLayoutTests {

    // MARK: - Default Values Tests

    @Test("Default initializer sets zero values")
    func defaultInitializerSetsZeroValues() {
        // GIVEN / WHEN
        let layout = SegmentedGaugeLayout()

        // THEN
        #expect(layout.contentSpacing == 0)
        #expect(layout.subContentSpacing == 0)
        #expect(layout.segmentsSpacing == 0)
    }

    // MARK: - Equatable Tests

    @Test("Equality when values match")
    func equalityWhenValuesMatch() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLayout(contentSpacing: 2, subContentSpacing: 3, segmentsSpacing: 4)
        let rhs = SegmentedGaugeLayout(contentSpacing: 2, subContentSpacing: 3, segmentsSpacing: 4)

        // THEN
        #expect(lhs == rhs)
    }

    @Test("Inequality when values differ")
    func inequalityWhenValuesDiffer() {
        // GIVEN / WHEN
        let lhs = SegmentedGaugeLayout(contentSpacing: 2, subContentSpacing: 3, segmentsSpacing: 4)
        let rhs = SegmentedGaugeLayout(contentSpacing: 5, subContentSpacing: 6, segmentsSpacing: 7)

        // THEN
        #expect(lhs != rhs)
    }
}
