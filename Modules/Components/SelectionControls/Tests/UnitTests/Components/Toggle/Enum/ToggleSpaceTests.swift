//
//  ToggleSpaceTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Toggle Space Tests")
struct ToggleSpaceTests {

    // MARK: - Properties Tests

    @Test("Show left with left case should return true")
    func showLeftWithLeftCaseShouldReturnTrue() {
        // GIVEN
        let space = ToggleSpace.left

        // WHEN
        let result = space.showLeft

        // THEN
        #expect(result)
    }

    @Test("Show left with right case should return false")
    func showLeftWithRightCaseShouldReturnFalse() {
        // GIVEN
        let space = ToggleSpace.right

        // WHEN
        let result = space.showLeft

        // THEN
        #expect(!result)
    }

    @Test("Show right with left case should return false")
    func showRightWithLeftCaseShouldReturnFalse() {
        // GIVEN
        let space = ToggleSpace.left

        // WHEN
        let result = space.showRight

        // THEN
        #expect(!result)
    }

    @Test("Show right with right case should return true")
    func showRightWithRightCaseShouldReturnTrue() {
        // GIVEN
        let space = ToggleSpace.right

        // WHEN
        let result = space.showRight

        // THEN
        #expect(result)
    }
}
