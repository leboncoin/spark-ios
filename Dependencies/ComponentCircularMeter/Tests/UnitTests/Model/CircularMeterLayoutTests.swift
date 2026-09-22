//
//  CircularMeterLayoutTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 28/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCircularMeter

@Suite("Circular Meter Layout Tests")
struct CircularMeterLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = CircularMeterLayout()

        // THEN
        #expect(layout.spacing == .zero)
        #expect(layout.padding == .zero)
    }

    @Test("Equality when same layout")
    func equalityWhenSameLayout() {
        // GIVEN / WHEN
        let layout1 = CircularMeterLayout(spacing: 8, padding: 16)
        let layout2 = CircularMeterLayout(spacing: 8, padding: 16)

        // THEN
        #expect(layout1 == layout2)
    }

    @Test("Inequality when different spacing")
    func inequalityWhenDifferentSpacing() {
        // GIVEN / WHEN
        let layout1 = CircularMeterLayout(spacing: 8, padding: 16)
        let layout2 = CircularMeterLayout(spacing: 16, padding: 16)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different padding")
    func inequalityWhenDifferentPadding() {
        // GIVEN / WHEN
        let layout1 = CircularMeterLayout(spacing: 8, padding: 16)
        let layout2 = CircularMeterLayout(spacing: 8, padding: 24)

        // THEN
        #expect(layout1 != layout2)
    }
}
