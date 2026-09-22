//
//  TabLayoutTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTab

@Suite("Tab Layout Tests")
struct TabLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = TabLayout()

        // THEN
        #expect(layout.verticalPadding == .zero)
        #expect(layout.horizontalPadding == .zero)
        #expect(layout.spacing == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let layout1 = TabLayout(
            verticalPadding: 10,
            horizontalPadding: 20,
            spacing: 5
        )

        let layout2 = TabLayout(
            verticalPadding: 10,
            horizontalPadding: 20,
            spacing: 5
        )

        // THEN
        #expect(layout1 == layout2)
    }

    @Test("Inequality when different vertical padding")
    func inequalityWhenDifferentVerticalPadding() {
        // GIVEN / WHEN
        let layout1 = TabLayout(
            verticalPadding: 10,
            horizontalPadding: 20,
            spacing: 5
        )

        let layout2 = TabLayout(
            verticalPadding: 15,
            horizontalPadding: 20,
            spacing: 5
        )

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different horizontal padding")
    func inequalityWhenDifferentHorizontalPadding() {
        // GIVEN / WHEN
        let layout1 = TabLayout(
            verticalPadding: 10,
            horizontalPadding: 20,
            spacing: 5
        )

        let layout2 = TabLayout(
            verticalPadding: 10,
            horizontalPadding: 25,
            spacing: 5
        )

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different spacing")
    func inequalityWhenDifferentSpacing() {
        // GIVEN / WHEN
        let layout1 = TabLayout(
            verticalPadding: 10,
            horizontalPadding: 20,
            spacing: 5
        )

        let layout2 = TabLayout(
            verticalPadding: 10,
            horizontalPadding: 20,
            spacing: 8
        )

        // THEN
        #expect(layout1 != layout2)
    }
}
