//
//  SnackbarConstantsTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SparkComponentButton
@testable import SparkComponentSnackbar

@Suite("Snackbar Constants Tests")
struct SnackbarConstantsTests {

    // MARK: - Tests

    @Test("Icon size constant")
    func iconSizeConstant() {
        // GIVEN / WHEN / THEN
        #expect(SnackbarConstants.iconSize == 24)
    }

    @Test("Presentation duration constant")
    func presentationDurationConstant() {
        // GIVEN / WHEN / THEN
        #expect(SnackbarConstants.presentationDuration == 0.4)
    }

    // MARK: - Deprecated Tests

    @Test("Button size constant")
    func buttonSizeConstant() {
        // GIVEN / WHEN / THEN
        #expect(SnackbarConstants.buttonSize == ButtonSize.medium)
    }

    @Test("Button shape constant")
    func buttonShapeConstant() {
        // GIVEN / WHEN / THEN
        #expect(SnackbarConstants.buttonShape == ButtonShape.rounded)
    }
}
