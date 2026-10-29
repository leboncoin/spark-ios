//
//  ChipIntentTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip

@Suite("Chip Intent Tests")
struct ChipIntentTests {

    // MARK: - Tests

    @Test("Default intent is support")
    func defaultIntentIsSupport() {
        #expect(ChipIntent.default == .support)
    }

    @Test("All cases contains only non deprecated cases")
    func allCasesContainsOnlyNonDeprecatedCases() {
        // Given
        let expectedCases: [ChipIntent] = [.danger, .main, .neutral, .support, .surface]

        // When
        let allCases = ChipIntent.allCases

        // Then
        #expect(allCases.count == 5)
        #expect(allCases == expectedCases)
    }

    @Test("All cases does not contain deprecated cases")
    func allCasesDoesNotContainDeprecatedCases() {
        // Given
        let allCases = ChipIntent.allCases

        // Then
        #expect(!allCases.contains(.accent))
        #expect(!allCases.contains(.alert))
        #expect(!allCases.contains(.info))
        #expect(!allCases.contains(.success))
    }

    @Test("All cases is ordered alphabetically")
    func allCasesIsOrderedAlphabetically() {
        // Given
        let expectedOrder: [ChipIntent] = [.danger, .main, .neutral, .support, .surface]

        // When
        let allCases = ChipIntent.allCases

        // Then
        #expect(allCases == expectedOrder)
    }
}
