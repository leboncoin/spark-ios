//
//  SegmentedGaugeSizeTests.swift
//  SparkComponentSegmentedGaugeUnitTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedGauge

@Suite("SegmentedGauge Size Tests")
struct SegmentedGaugeSizeTests {

    // MARK: - Tests

    @Test("Default is medium")
    func defaultIsMedium() {
        #expect(
            SegmentedGaugeSize.default == .medium
        )
    }
}
