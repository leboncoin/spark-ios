//
//  SegmentedGaugeAccessibilitySortTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 21/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge

@Suite("SegmentedGauge Accessibility Sort Tests")
struct SegmentedGaugeAccessibilitySortTests {

    // MARK: - Tests

    @Test("Title raw value")
    func titleRawValue() {
        #expect(
            SegmentedGaugeAccessibilitySort.title.rawValue == 3.0
        )
    }

    @Test("Description raw value")
    func descriptionRawValue() {
        #expect(
            SegmentedGaugeAccessibilitySort.description.rawValue == 2.0
        )
    }

    @Test("Segments raw value")
    func segmentsRawValue() {
        #expect(
            SegmentedGaugeAccessibilitySort.segments.rawValue == 1.0
        )
    }
}
