//
//  ChipToken+AlignmentTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip

// MARK: - Tests

struct ChipTokenAlignmentTests {

    // MARK: - Properties

    private let token = ChipToken.Alignment()

    // MARK: - Tests

    @Test(arguments: [
        (ChipAlignment.leadingIcon, true),
        (ChipAlignment.trailingIcon, false)
    ])
    func isReversedShouldReturnExpectedValue(alignment: ChipAlignment, expectedValue: Bool) {
        #expect(self.token.isReversed(for: alignment) == expectedValue)
    }

    // MARK: - Equatable Tests

    @Test
    func equatableShouldReturnTrue() {
        #expect(ChipToken.Alignment() == ChipToken.Alignment())
    }
}
