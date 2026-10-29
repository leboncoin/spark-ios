//
//  SegmentedGaugeAlignmentTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge

@Suite("SegmentedGauge Alignment Tests")
struct SegmentedGaugeAlignmentTests {

    // MARK: - Tests

    @Test("Default is horizontal")
    func defaultIsHorizontal() {
        #expect(
            SegmentedGaugeAlignment.default == .horizontal
        )
    }
}
