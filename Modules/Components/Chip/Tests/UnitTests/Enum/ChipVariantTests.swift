//
//  ChipVariantTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip

@Suite("Chip Variant Tests")
struct ChipVariantTests {

    // MARK: - Tests

    @Test("Default variant is tinted")
    func defaultVariantIsTinted() {
        // Then
        #expect(ChipVariant.default == .tinted)
    }
}
