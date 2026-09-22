//
//  ToggleGetShowSpaceUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls

final class ToggleGetShowSpaceUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_whenIsOn_returnsLeft() {
        // GIVEN
        let useCase = ToggleGetShowSpaceUseCase()

        // WHEN
        let result = useCase.execute(isOn: true)

        // THEN
        XCTAssertEqual(result, .left)
    }

    func test_execute_whenIsOff_returnsRight() {
        // GIVEN
        let useCase = ToggleGetShowSpaceUseCase()

        // WHEN
        let result = useCase.execute(isOn: false)

        // THEN
        XCTAssertEqual(result, .right)
    }
}
