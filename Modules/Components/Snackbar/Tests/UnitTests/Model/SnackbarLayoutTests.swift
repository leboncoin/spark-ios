//
//  SnackbarLayoutTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSnackbar

@Suite("Snackbar Layout Tests")
struct SnackbarLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = SnackbarLayout()

        // THEN
        #expect(layout.leadingPadding == .zero)
        #expect(layout.trailingPadding == .zero)
        #expect(layout.horizontalSpacing == .zero)
        #expect(layout.verticalPadding == .zero)
        #expect(layout.verticalSpacing == .zero)
        #expect(layout.verticalSubSpacing == .zero)
        #expect(layout.presentationPadding == .zero)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let layout1 = SnackbarLayout(
            presentationPadding: 12,
            leadingPadding: 16,
            trailingPadding: 12,
            horizontalSpacing: 12,
            verticalPadding: 12,
            verticalSpacing: 12,
            verticalSubSpacing: 8
        )
        let layout2 = SnackbarLayout(
            presentationPadding: 12,
            leadingPadding: 16,
            trailingPadding: 12,
            horizontalSpacing: 12,
            verticalPadding: 12,
            verticalSpacing: 12,
            verticalSubSpacing: 8
        )

        // THEN
        #expect(layout1 == layout2)
    }

    @Test("Inequality when different leading padding")
    func inequalityWhenDifferentLeadingPadding() {
        // GIVEN / WHEN
        let layout1 = SnackbarLayout(leadingPadding: 16)
        let layout2 = SnackbarLayout(leadingPadding: 20)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different trailing padding")
    func inequalityWhenDifferentTrailingPadding() {
        // GIVEN / WHEN
        let layout1 = SnackbarLayout(trailingPadding: 12)
        let layout2 = SnackbarLayout(trailingPadding: 16)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different horizontal padding")
    func inequalityWhenDifferentHorizontalSpacing() {
        // GIVEN / WHEN
        let layout1 = SnackbarLayout(horizontalSpacing: 12)
        let layout2 = SnackbarLayout(horizontalSpacing: 16)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different vertical padding")
    func inequalityWhenDifferentVerticalPadding() {
        // GIVEN / WHEN
        let layout1 = SnackbarLayout(verticalPadding: 12)
        let layout2 = SnackbarLayout(verticalPadding: 16)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different vertical spacing")
    func inequalityWhenDifferentVerticalSpacing() {
        // GIVEN / WHEN
        let layout1 = SnackbarLayout(verticalSpacing: 12)
        let layout2 = SnackbarLayout(verticalSpacing: 16)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different vertical sub spacing")
    func inequalityWhenDifferentVerticalSubSpacing() {
        // GIVEN / WHEN
        let layout1 = SnackbarLayout(verticalSubSpacing: 8)
        let layout2 = SnackbarLayout(verticalSubSpacing: 12)

        // THEN
        #expect(layout1 != layout2)
    }

    @Test("Inequality when different presentation padding")
    func inequalityWhenDifferentPresentationPadding() {
        // GIVEN / WHEN
        let layout1 = SnackbarLayout(presentationPadding: 12)
        let layout2 = SnackbarLayout(presentationPadding: 16)

        // THEN
        #expect(layout1 != layout2)
    }
}
