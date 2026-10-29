//
//  ChipBorderTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentChip

@MainActor
@Suite("Chip Border Tests")
struct ChipBorderTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let border = ChipBorder()

        // THEN
        #expect(border.width == 0)
        #expect(border.radius == 0)
        #expect(border.dash == 0)
    }

    @Test("Equality when same properties")
    func equalityWhenSameProperties() {
        // GIVEN
        let border1 = ChipBorder(
            width: 1.5,
            radius: 10.0,
            dash: 5
        )

        let border2 = ChipBorder(
            width: 1.5,
            radius: 10.0,
            dash: 5
        )

        // THEN
         #expect(border1 == border2)
    }
}
