//
//  ToggleSpaceTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class ToggleSpaceTests: XCTestCase {

    // MARK: - Properties Tests

    func test_showLeft_withLeftCase_shouldReturnTrue() {
        // GIVEN
        let space = ToggleSpace.left

        // WHEN
        let result = space.showLeft

        // THEN
        XCTAssertTrue(result)
    }

    func test_showLeft_withRightCase_shouldReturnFalse() {
        // GIVEN
        let space = ToggleSpace.right

        // WHEN
        let result = space.showLeft

        // THEN
        XCTAssertFalse(result)
    }

    func test_showRight_withLeftCase_shouldReturnFalse() {
        // GIVEN
        let space = ToggleSpace.left

        // WHEN
        let result = space.showRight

        // THEN
        XCTAssertFalse(result)
    }

    func test_showRight_withRightCase_shouldReturnTrue() {
        // GIVEN
        let space = ToggleSpace.right

        // WHEN
        let result = space.showRight

        // THEN
        XCTAssertTrue(result)
    }
}
