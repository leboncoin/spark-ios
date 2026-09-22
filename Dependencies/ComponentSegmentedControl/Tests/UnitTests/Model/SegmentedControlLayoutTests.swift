//
//  SegmentedControlLayoutTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedControl

@Suite("SegmentedControl Layout Tests")
struct SegmentedControlLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = SegmentedControlLayout()

        // THEN
        #expect(layout.padding == .zero)
        #expect(layout.spacing == .zero)
        #expect(layout.accessibilityHorizontalPadding == .zero)
        #expect(layout.accessibilityVerticalPadding == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let layout1 = SegmentedControlLayout(
            padding: 8,
            spacing: 8,
            accessibilityHorizontalPadding: 16,
            accessibilityVerticalPadding: 12
        )
        let layout2 = SegmentedControlLayout(
            padding: 8,
            spacing: 8,
            accessibilityHorizontalPadding: 16,
            accessibilityVerticalPadding: 12
        )

        // THEN
        #expect(layout1 == layout2)
    }

    @Test("Inequality when different padding")
    func inequalityWhenDifferentPadding() {
        // GIVEN / WHEN
        let layout1 = SegmentedControlLayout(padding: 8, spacing: 8)
        let layout2 = SegmentedControlLayout(padding: 10, spacing: 8)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different spacing")
    func inequalityWhenDifferentSpacing() {
        // GIVEN / WHEN
        let layout1 = SegmentedControlLayout(padding: 8, spacing: 8)
        let layout2 = SegmentedControlLayout(padding: 8, spacing: 10)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different accessibilityHorizontalPadding")
    func inequalityWhenDifferentAccessibilityHorizontalPadding() {
        // GIVEN / WHEN
        let layout1 = SegmentedControlLayout(
            padding: 8,
            spacing: 8,
            accessibilityHorizontalPadding: 16,
            accessibilityVerticalPadding: 12
        )
        let layout2 = SegmentedControlLayout(
            padding: 8,
            spacing: 8,
            accessibilityHorizontalPadding: 20,
            accessibilityVerticalPadding: 12
        )

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different accessibilityVerticalPadding")
    func inequalityWhenDifferentAccessibilityVerticalPadding() {
        // GIVEN / WHEN
        let layout1 = SegmentedControlLayout(
            padding: 8,
            spacing: 8,
            accessibilityHorizontalPadding: 16,
            accessibilityVerticalPadding: 12
        )
        let layout2 = SegmentedControlLayout(
            padding: 8,
            spacing: 8,
            accessibilityHorizontalPadding: 16,
            accessibilityVerticalPadding: 16
        )

        // THEN
        #expect(layout1 != layout2)
    }
}
