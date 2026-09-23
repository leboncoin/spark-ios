//
//  ToggleGetIsIconUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentSelectionControls

final class ToggleGetIsIconUseCaseTests: XCTestCase {

    // MARK: - Execute Tests

    func test_execute_whenOnOffLabelsEnabled_returnsTrue() {
        // GIVEN
        let useCase = ToggleGetIsIconUseCase()

        // WHEN
        let isIcon1 = useCase.execute(
            isOnOffSwitchLabelsEnabled: true,
            contrast: .standard
        )
        let isIcon2 = useCase.execute(
            isOnOffSwitchLabelsEnabled: true,
            contrast: .increased
        )

        // THEN
        XCTAssertTrue(isIcon1, "Wrong value when contrast is equals to .standard")
        XCTAssertTrue(isIcon2, "Wrong value when contrast is equals to .increased")
    }

    func test_execute_whenHighContrast_returnsTrue() {
        // GIVEN
        let useCase = ToggleGetIsIconUseCase()

        // WHEN
        let isIcon = useCase.execute(
            isOnOffSwitchLabelsEnabled: false,
            contrast: .increased
        )

        // THEN
        XCTAssertTrue(isIcon)
    }

    func test_execute_whenNeither_returnsFalse() {
        // GIVEN
        let useCase = ToggleGetIsIconUseCase()

        // WHEN
        let isIcon = useCase.execute(
            isOnOffSwitchLabelsEnabled: false,
            contrast: .standard
        )

        // THEN
        XCTAssertFalse(isIcon)
    }

    // MARK: - Execute UITests

    func test_executeUI_whenOnOffLabelsEnabled_returnsTrue() {
        // GIVEN
        let useCase = ToggleGetIsIconUseCase()

        // WHEN
        let isIcon1 = useCase.executeUI(
            isOnOffSwitchLabelsEnabled: true,
            contrast: .normal
        )
        let isIcon2 = useCase.executeUI(
            isOnOffSwitchLabelsEnabled: true,
            contrast: .high
        )

        // THEN
        XCTAssertTrue(isIcon1, "Wrong value when contrast is equals to .normal")
        XCTAssertTrue(isIcon2, "Wrong value when contrast is equals to .high")
    }

    func test_executeUI_whenHighContrast_returnsTrue() {
        // GIVEN
        let useCase = ToggleGetIsIconUseCase()

        // WHEN
        let isIcon = useCase.executeUI(
            isOnOffSwitchLabelsEnabled: false,
            contrast: .high
        )

        // THEN
        XCTAssertTrue(isIcon)
    }

    func test_executeUI_whenNeither_returnsFalse() {
        // GIVEN
        let useCase = ToggleGetIsIconUseCase()

        // WHEN
        let isIcon = useCase.executeUI(
            isOnOffSwitchLabelsEnabled: false,
            contrast: .normal
        )

        // THEN
        XCTAssertFalse(isIcon)
    }
}
