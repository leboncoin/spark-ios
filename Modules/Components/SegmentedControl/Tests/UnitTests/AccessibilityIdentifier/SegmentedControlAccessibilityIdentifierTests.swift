//
//  SegmentedControlAccessibilityIdentifierTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
import Testing

// MARK: - Tests

struct SegmentedControlAccessibilityIdentifierTests {

    @Test("View has expected value")
    func view_hasExpectedValue() {
        // GIVEN / WHEN / THEN
        #expect(SegmentedControlAccessibilityIdentifier.view == "spark-segmentedcontrol-view")
    }

    @Test("Item has expected value")
    func item_hasExpectedValue() {
        // GIVEN
        let index = 2

        // WHEN
        let result = SegmentedControlAccessibilityIdentifier.item(at: index)

        // THEN
        #expect(result == "spark-segmentedcontrol-item-2")
    }
}
