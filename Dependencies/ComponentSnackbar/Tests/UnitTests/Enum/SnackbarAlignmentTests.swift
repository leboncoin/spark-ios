//
//  SnackbarAlignmentTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSnackbar
import Testing

@Suite("Snackbar Alignment Tests")
struct SnackbarAlignmentTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [SnackbarAlignment] = [.horizontal, .vertical]

        // WHEN / THEN
        #expect(SnackbarAlignment.allCases.count == expectedCases.count)
        #expect(Set(SnackbarAlignment.allCases) == Set(expectedCases))
    }

    @Test("Default value is vertical")
    func defaultValueIsVertical() {
        // GIVEN / WHEN / THEN
        #expect(SnackbarAlignment.default == .vertical)
    }
}
