//
//  ChipAlignmentTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip

@Suite("Chip Alignment Tests")
struct ChipAlignmentTests {

    // MARK: - Tests

    @Test("Default alignment is leading icon")
    func defaultAlignmentIsLeadingIcon() {
        #expect(ChipAlignment.default == .leadingIcon)
    }
}
