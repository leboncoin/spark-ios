//
//  ChipSizeTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip

struct ChipSizeTests {

    // MARK: - Tests

    @Test("Default size is medium")
    func default_size_is_medium() {
        // Then
        #expect(ChipSize.default == .medium)
    }

    @Test("All cases are present")
    func all_cases_are_present() {
        // Given / When
        let allCases = ChipSize.allCases

        // Then
        #expect(allCases.count == 2)
        #expect(allCases.contains(.medium))
        #expect(allCases.contains(.large))
    }
}
