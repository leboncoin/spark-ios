//
//  ButtonLayoutTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentButton

@Suite("Button Layout Tests")
struct ButtonLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = ButtonLayout()

        // THEN
        #expect(layout.horizontalSpacing == .zero)
        #expect(layout.horizontalPadding == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let layout1 = ButtonLayout(
            horizontalSpacing: 8,
            horizontalPadding: 16
        )

        let layout2 = ButtonLayout(
            horizontalSpacing: 8,
            horizontalPadding: 16
        )

        // THEN
        #expect(layout1 == layout2)
    }

    @Test("Inequality when different horizontal spacing")
    func inequalityWhenDifferentHorizontalSpacing() {
        // GIVEN / WHEN
        let layout1 = ButtonLayout(
            horizontalSpacing: 8,
            horizontalPadding: 16
        )

        let layout2 = ButtonLayout(
            horizontalSpacing: 12,
            horizontalPadding: 16
        )

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different horizontal padding")
    func inequalityWhenDifferentHorizontalPadding() {
        // GIVEN / WHEN
        let layout1 = ButtonLayout(
            horizontalSpacing: 8,
            horizontalPadding: 16
        )

        let layout2 = ButtonLayout(
            horizontalSpacing: 8,
            horizontalPadding: 20
        )

        // THEN
        #expect(layout1 != layout2)
    }
}
