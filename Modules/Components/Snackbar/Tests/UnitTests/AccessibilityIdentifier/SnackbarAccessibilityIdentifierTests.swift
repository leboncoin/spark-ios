//
//  SnackbarAccessibilityIdentifierTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSnackbar

@Suite("Snackbar Accessibility Identifier Tests")
struct SnackbarAccessibilityIdentifierTests {

    // MARK: - Tests

    @Test("View identifier")
    func viewIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(SnackbarAccessibilityIdentifier.view == "spark-snackbar")
    }

    @Test("Label identifier")
    func labelIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(SnackbarAccessibilityIdentifier.label == "spark-snackbar-label")
    }

    @Test("Button identifier")
    func buttonIdentifier() {
        // GIVEN / WHEN / THEN
        #expect(SnackbarAccessibilityIdentifier.button == "spark-snackbar-button")
    }
}
