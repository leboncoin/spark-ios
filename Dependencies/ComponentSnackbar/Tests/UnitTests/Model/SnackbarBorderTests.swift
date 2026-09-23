//
//  SnackbarBorderTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSnackbar

@Suite("Snackbar Border Tests")
struct SnackbarBorderTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let border = SnackbarBorder()

        // THEN
        #expect(border.width == .zero)
        #expect(border.radius == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let border1 = SnackbarBorder(width: 1, radius: 16)
        let border2 = SnackbarBorder(width: 1, radius: 16)

        // THEN
        #expect(border1 == border2)
    }

    @Test("Inequality when different width")
    func inequalityWhenDifferentWidth() {
        // GIVEN / WHEN
        let border1 = SnackbarBorder(width: 1, radius: 16)
        let border2 = SnackbarBorder(width: 2, radius: 16)

        // THEN
        #expect(border1 != border2)
    }

    @Test("Inequality when different radius")
    func inequalityWhenDifferentRadius() {
        // GIVEN / WHEN
        let border1 = SnackbarBorder(width: 1, radius: 16)
        let border2 = SnackbarBorder(width: 1, radius: 20)

        // THEN
        #expect(border1 != border2)
    }
}
