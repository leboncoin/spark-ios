//
//  SegmentedControlItemLayoutTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSegmentedControl
import Testing

// MARK: - Tests

@Suite("SegmentedControl Item Layout Tests")
struct SegmentedControlItemLayoutTests {

    // MARK: - Tests

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let layout = SegmentedControlItemLayout()

        // THEN
        #expect(layout.padding == 0)
        #expect(layout.spacing == 0)
    }

    @Test("Equatable should return true when all properties are equal")
    func equatableShouldReturnTrueWhenAllPropertiesAreEqual() {
        // GIVEN
        let layout1 = SegmentedControlItemLayout(padding: 8.0, spacing: 8.0)
        let layout2 = SegmentedControlItemLayout(padding: 8.0, spacing: 8.0)

        // WHEN / THEN
        #expect(layout1 == layout2)
    }

    @Test("Equatable should return false when padding is different")
    func equatableShouldReturnFalseWhenPaddingIsDifferent() {
        // GIVEN
        let layout1 = SegmentedControlItemLayout(padding: 8.0, spacing: 8.0)
        let layout2 = SegmentedControlItemLayout(padding: 4.0, spacing: 8.0)

        // WHEN / THEN
        #expect(layout1 != layout2)
    }

    @Test("Equatable should return false when spacing is different")
    func equatableShouldReturnFalseWhenSpacingIsDifferent() {
        // GIVEN
        let layout1 = SegmentedControlItemLayout(padding: 8.0, spacing: 8.0)
        let layout2 = SegmentedControlItemLayout(padding: 8.0, spacing: 4.0)

        // WHEN / THEN
        #expect(layout1 != layout2)
    }
}
