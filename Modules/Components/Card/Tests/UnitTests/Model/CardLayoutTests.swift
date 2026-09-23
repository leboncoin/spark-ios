//
//  CardLayoutTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 15/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard

@Suite("Card Layout Tests")
struct CardLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = CardLayout()

        // THEN
        #expect(layout.padding == .zero)
        #expect(layout.headerVerticalPadding == .zero)
        #expect(layout.headerHorizontalPadding == .zero)
        #expect(layout.isHeaderBottonPadding == false)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let layout1 = CardLayout(padding: 16, headerVerticalPadding: 12, headerHorizontalPadding: 8, isHeaderBottonPadding: true)
        let layout2 = CardLayout(padding: 16, headerVerticalPadding: 12, headerHorizontalPadding: 8, isHeaderBottonPadding: true)

        // THEN
        #expect(layout1 == layout2)
    }

    @Test("Inequality when different padding")
    func inequalityWhenDifferentPadding() {
        // GIVEN / WHEN
        let layout1 = CardLayout(padding: 16, headerVerticalPadding: 12, headerHorizontalPadding: 8)
        let layout2 = CardLayout(padding: 20, headerVerticalPadding: 12, headerHorizontalPadding: 8)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different header vertical padding")
    func inequalityWhenDifferentHeaderVerticalPadding() {
        // GIVEN / WHEN
        let layout1 = CardLayout(padding: 16, headerVerticalPadding: 12, headerHorizontalPadding: 8)
        let layout2 = CardLayout(padding: 16, headerVerticalPadding: 16, headerHorizontalPadding: 8)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different header horizontal padding")
    func inequalityWhenDifferentHeaderHorizontalPadding() {
        // GIVEN / WHEN
        let layout1 = CardLayout(padding: 16, headerVerticalPadding: 12, headerHorizontalPadding: 8)
        let layout2 = CardLayout(padding: 16, headerVerticalPadding: 12, headerHorizontalPadding: 12)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different isHeaderBottonPadding")
    func inequalityWhenDifferentIsHeaderBottonPadding() {
        // GIVEN / WHEN
        let layout1 = CardLayout(padding: 16, headerVerticalPadding: 12, headerHorizontalPadding: 8, isHeaderBottonPadding: false)
        let layout2 = CardLayout(padding: 16, headerVerticalPadding: 12, headerHorizontalPadding: 8, isHeaderBottonPadding: true)

        // THEN
        #expect(layout1 != layout2)
    }
}
