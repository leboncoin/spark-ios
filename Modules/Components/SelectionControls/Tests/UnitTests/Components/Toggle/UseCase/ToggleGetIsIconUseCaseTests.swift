//
//  ToggleGetIsIconUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentSelectionControls

@MainActor
@Suite("Toggle Get Is Icon UseCase Tests")
struct ToggleGetIsIconUseCaseTests {

    // MARK: - Execute Tests

    @Test("Execute when on off labels enabled returns true")
    func executeWhenOnOffLabelsEnabledReturnsTrue() {
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
        #expect(isIcon1, "Wrong value when contrast is equals to .standard")
        #expect(isIcon2, "Wrong value when contrast is equals to .increased")
    }

    @Test("Execute when high contrast returns true")
    func executeWhenHighContrastReturnsTrue() {
        // GIVEN
        let useCase = ToggleGetIsIconUseCase()

        // WHEN
        let isIcon = useCase.execute(
            isOnOffSwitchLabelsEnabled: false,
            contrast: .increased
        )

        // THEN
        #expect(isIcon)
    }

    @Test("Execute when neither returns false")
    func executeWhenNeitherReturnsFalse() {
        // GIVEN
        let useCase = ToggleGetIsIconUseCase()

        // WHEN
        let isIcon = useCase.execute(
            isOnOffSwitchLabelsEnabled: false,
            contrast: .standard
        )

        // THEN
        #expect(!isIcon)
    }

    // MARK: - Execute UITests

    @Test("Execute UI when on off labels enabled returns true")
    func executeUIWhenOnOffLabelsEnabledReturnsTrue() {
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
        #expect(isIcon1, "Wrong value when contrast is equals to .normal")
        #expect(isIcon2, "Wrong value when contrast is equals to .high")
    }

    @Test("Execute UI when high contrast returns true")
    func executeUIWhenHighContrastReturnsTrue() {
        // GIVEN
        let useCase = ToggleGetIsIconUseCase()

        // WHEN
        let isIcon = useCase.executeUI(
            isOnOffSwitchLabelsEnabled: false,
            contrast: .high
        )

        // THEN
        #expect(isIcon)
    }

    @Test("Execute UI when neither returns false")
    func executeUIWhenNeitherReturnsFalse() {
        // GIVEN
        let useCase = ToggleGetIsIconUseCase()

        // WHEN
        let isIcon = useCase.executeUI(
            isOnOffSwitchLabelsEnabled: false,
            contrast: .normal
        )

        // THEN
        #expect(!isIcon)
    }
}
