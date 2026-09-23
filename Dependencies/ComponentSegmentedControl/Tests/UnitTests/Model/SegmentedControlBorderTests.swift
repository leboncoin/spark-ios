//
//  SegmentedControlBorderTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSegmentedControl

@Suite("SegmentedControl Border Tests")
struct SegmentedControlBorderTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let border = SegmentedControlBorder()

        // THEN
        #expect(border.radius == .zero)
        #expect(border.width == .zero)
        #expect(border.selectedItemRadius == .zero)
        #expect(border.selectedItemWidth == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let border1 = SegmentedControlBorder(
            radius: 22,
            width: 1,
            selectedItemRadius: 21,
            selectedItemWidth: 1
        )
        let border2 = SegmentedControlBorder(
            radius: 22,
            width: 1,
            selectedItemRadius: 21,
            selectedItemWidth: 1
        )

        // THEN
        #expect(border1 == border2)
    }

    @Test("Inequality when different radius")
    func inequalityWhenDifferentRadius() {
        // GIVEN / WHEN
        let border1 = SegmentedControlBorder(radius: 22, width: 1, selectedItemRadius: 21, selectedItemWidth: 1)
        let border2 = SegmentedControlBorder(radius: 20, width: 1, selectedItemRadius: 21, selectedItemWidth: 1)

        // THEN
        #expect(border1 != border2)
    }

    @Test("Inequality when different width")
    func inequalityWhenDifferentWidth() {
        // GIVEN / WHEN
        let border1 = SegmentedControlBorder(radius: 22, width: 1, selectedItemRadius: 21, selectedItemWidth: 1)
        let border2 = SegmentedControlBorder(radius: 22, width: 2, selectedItemRadius: 21, selectedItemWidth: 1)

        // THEN
        #expect(border1 != border2)
    }

    @Test("Inequality when different selectedItemRadius")
    func inequalityWhenDifferentSelectedItemRadius() {
        // GIVEN / WHEN
        let border1 = SegmentedControlBorder(radius: 22, width: 1, selectedItemRadius: 21, selectedItemWidth: 1)
        let border2 = SegmentedControlBorder(radius: 22, width: 1, selectedItemRadius: 19, selectedItemWidth: 1)

        // THEN
        #expect(border1 != border2)
    }

    @Test("Inequality when different selectedItemWidth")
    func inequalityWhenDifferentSelectedItemWidth() {
        // GIVEN / WHEN
        let border1 = SegmentedControlBorder(radius: 22, width: 1, selectedItemRadius: 21, selectedItemWidth: 1)
        let border2 = SegmentedControlBorder(radius: 22, width: 1, selectedItemRadius: 21, selectedItemWidth: 2)

        // THEN
        #expect(border1 != border2)
    }
}
