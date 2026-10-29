//
//  SegmentedGaugeSegmentTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge

@Suite("SegmentedGauge Segment Tests")
struct SegmentedGaugeSegmentTests {

    // MARK: - Tests

    @Test("Default is five")
    func defaultIsFive() {
        #expect(
            SegmentedGaugeSegments.default == .five
        )
    }

    @Test("Max")
    func max() {
        #expect(
            SegmentedGaugeSegments.max == 5
        )
    }
}
