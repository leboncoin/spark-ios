//
//  ChipConstantsTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip

@Suite("Chip Constants Tests")
struct ChipConstantsTests {

    // MARK: - Tests

    @Test("Icon size constant")
    func iconSizeConstant() {
        // Then
        #expect(ChipConstants.iconSize == 16)
    }

    @Test("Height constant")
    func heightConstant() {
        // Then
        #expect(ChipConstants.height == 32)
    }

    @Test("Border width constant")
    func borderWidthConstant() {
        // Then
        #expect(ChipConstants.borderWidth == 1)
    }

    @Test("Dash length constant")
    func dashLengthConstant() {
        // Then
        #expect(ChipConstants.dashLength == 2)
    }
}
