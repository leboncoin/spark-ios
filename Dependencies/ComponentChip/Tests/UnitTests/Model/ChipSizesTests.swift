//
//  ChipSizesTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip

struct ChipSizesTests {

    // MARK: - Tests

    @Test
    func initialization_with_default_values() {
        // GIVEN / WHEN
        let sizes = ChipSizes()

        // THEN
        #expect(sizes.height == 0)
        #expect(sizes.iconSize == 0)
    }

    @Test
    func initialization_with_custom_values() {
        // GIVEN / WHEN
        let sizes = ChipSizes(
            height: 40,
            iconSize: 16
        )

        // THEN
        #expect(sizes.height == 40)
        #expect(sizes.iconSize == 16)
    }

    @Test
    func equatable_returns_true_when_sizes_are_equal() {
        // GIVEN
        let sizes1 = ChipSizes(height: 32, iconSize: 16)
        let sizes2 = ChipSizes(height: 32, iconSize: 16)

        // WHEN / THEN
        #expect(sizes1 == sizes2)
    }

    @Test
    func equatable_returns_false_when_heights_are_different() {
        // GIVEN
        let sizes1 = ChipSizes(height: 32, iconSize: 16)
        let sizes2 = ChipSizes(height: 40, iconSize: 16)

        // WHEN / THEN
        #expect(sizes1 != sizes2)
    }

    @Test
    func equatable_returns_false_when_iconSizes_are_different() {
        // GIVEN
        let sizes1 = ChipSizes(height: 32, iconSize: 16)
        let sizes2 = ChipSizes(height: 32, iconSize: 20)

        // WHEN / THEN
        #expect(sizes1 != sizes2)
    }
}
