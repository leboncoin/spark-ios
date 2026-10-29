//
//  ChipLayoutTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentChip

@MainActor
@Suite("Chip Layout Tests")
struct ChipLayoutTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let layout = ChipLayout()

        // THEN
        #expect(layout.spacing == 0)
        #expect(layout.extraContentSpacing == 0)
        #expect(layout.padding == 0)
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let layout1 = ChipLayout(
            spacing: 6.0,
            extraContentSpacing: 8.0,
            padding: 12.0
        )

        let layout2 = ChipLayout(
            spacing: 6.0,
            extraContentSpacing: 8.0,
            padding: 12.0
        )

        // THEN
        #expect(layout1 == layout2)
    }
}
