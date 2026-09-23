//
//  ButtonBorderTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 10/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentButton

@Suite("Button Border Tests")
struct ButtonBorderTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let border = ButtonBorder()

        // THEN
        #expect(border.width == .zero)
        #expect(border.radius == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let border1 = ButtonBorder(width: 2.0, radius: 8.0)
        let border2 = ButtonBorder(width: 2.0, radius: 8.0)

        // THEN
        #expect(border1 == border2)
    }

    @Test("Inequality when different width")
    func inequalityWhenDifferentWidth() {
        // GIVEN / WHEN
        let border1 = ButtonBorder(width: 2.0, radius: 8.0)
        let border2 = ButtonBorder(width: 3.0, radius: 8.0)

        // THEN
        #expect(border1 != border2)
    }

    @Test("Inequality when different radius")
    func inequalityWhenDifferentRadius() {
        // GIVEN / WHEN
        let border1 = ButtonBorder(width: 2.0, radius: 8.0)
        let border2 = ButtonBorder(width: 2.0, radius: 12.0)

        // THEN
        #expect(border1 != border2)
    }
}
