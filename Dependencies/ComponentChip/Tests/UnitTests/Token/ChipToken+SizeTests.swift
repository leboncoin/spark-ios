//
//  ChipToken+SizeTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip

struct ChipTokenSizeTests {

    // MARK: - Tests

    @Test
    func mediumHeight_constant() {
        // GIVEN / WHEN
        let size = ChipToken.Size()

        // THEN
        #expect(size.mediumHeight == 32)
    }

    @Test
    func largeHeight_constant() {
        // GIVEN / WHEN
        let size = ChipToken.Size()

        // THEN
        #expect(size.largeHeight == 40)
    }

    @Test
    func iconSize_constant() {
        // GIVEN / WHEN
        let size = ChipToken.Size()

        // THEN
        #expect(size.iconSize == 16)
    }

    @Test
    func largeHeight_is_greater_than_mediumHeight() {
        // GIVEN / WHEN
        let size = ChipToken.Size()

        // THEN
        #expect(size.largeHeight > size.mediumHeight)
    }

    @Test
    func all_size_properties_are_positive() {
        // GIVEN / WHEN
        let size = ChipToken.Size()

        // THEN
        #expect(size.mediumHeight > 0)
        #expect(size.largeHeight > 0)
        #expect(size.iconSize > 0)
    }

    @Test
    func equatable_returns_true_when_sizes_are_equal() {
        // GIVEN
        let size1 = ChipToken.Size()
        let size2 = ChipToken.Size()

        // WHEN / THEN
        #expect(size1 == size2)
    }
}
