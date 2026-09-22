//
//  SnackbarDirectionTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 10/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSnackbar
import SwiftUI
import Testing

@Suite("Snackbar Direction Tests")
struct SnackbarDirectionTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [SnackbarDirection] = [.top, .bottom]

        // WHEN / THEN
        #expect(SnackbarDirection.allCases.count == expectedCases.count)
        #expect(Set(SnackbarDirection.allCases) == Set(expectedCases))
    }

    @Test("Default value is bottom")
    func defaultValueIsBottom() {
        // GIVEN / WHEN / THEN
        #expect(SnackbarDirection.default == .bottom)
    }

    @Test("Edge value for top direction")
    func edgeValueForTopDirection() {
        // GIVEN
        let direction = SnackbarDirection.top

        // WHEN
        let edge = direction.edge

        // THEN
        #expect(edge == .top)
    }

    @Test("Edge value for bottom direction")
    func edgeValueForBottomDirection() {
        // GIVEN
        let direction = SnackbarDirection.bottom

        // WHEN
        let edge = direction.edge

        // THEN
        #expect(edge == .bottom)
    }

    @Test("Stack alignment value for top direction")
    func stackAlignmentValueForTopDirection() {
        // GIVEN
        let direction = SnackbarDirection.top

        // WHEN
        let alignment = direction.stackAlignment

        // THEN
        #expect(alignment == .top)
    }

    @Test("Stack alignment value for bottom direction")
    func stackAlignmentValueForBottomDirection() {
        // GIVEN
        let direction = SnackbarDirection.bottom

        // WHEN
        let alignment = direction.stackAlignment

        // THEN
        #expect(alignment == .bottom)
    }
}
