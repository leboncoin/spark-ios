//
//  AwarenessCardLayoutTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 17/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard

@Suite("Awareness Card Layout Tests")
struct AwarenessCardLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = AwarenessCardLayout()

        // THEN
        #expect(layout.horizontalSpacing == .zero)
        #expect(layout.verticalSpacing == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let layout1 = AwarenessCardLayout(
            horizontalSpacing: 16,
            verticalSpacing: 12
        )
        let layout2 = AwarenessCardLayout(
            horizontalSpacing: 16,
            verticalSpacing: 12
        )

        // THEN
        #expect(layout1 == layout2)
    }

    @Test("Inequality when different horizontal spacing")
    func inequalityWhenDifferentHorizontalSpacing() {
        // GIVEN / WHEN
        let layout1 = AwarenessCardLayout(
            horizontalSpacing: 16,
            verticalSpacing: 12
        )
        let layout2 = AwarenessCardLayout(
            horizontalSpacing: 20,
            verticalSpacing: 12
        )

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different vertical spacing")
    func inequalityWhenDifferentVerticalSpacing() {
        // GIVEN / WHEN
        let layout1 = AwarenessCardLayout(
            horizontalSpacing: 16,
            verticalSpacing: 12
        )
        let layout2 = AwarenessCardLayout(
            horizontalSpacing: 16,
            verticalSpacing: 16
        )

        // THEN
        #expect(layout1 != layout2)
    }
}
