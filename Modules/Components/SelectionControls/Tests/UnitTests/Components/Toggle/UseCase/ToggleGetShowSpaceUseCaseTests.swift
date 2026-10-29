//
//  ToggleGetShowSpaceUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Toggle Get Show Space UseCase Tests")
struct ToggleGetShowSpaceUseCaseTests {

    // MARK: - Tests

    @Test("Execute when is on returns left")
    func executeWhenIsOnReturnsLeft() {
        // GIVEN
        let useCase = ToggleGetShowSpaceUseCase()

        // WHEN
        let result = useCase.execute(isOn: true)

        // THEN
        #expect(result == .left)
    }

    @Test("Execute when is off returns right")
    func executeWhenIsOffReturnsRight() {
        // GIVEN
        let useCase = ToggleGetShowSpaceUseCase()

        // WHEN
        let result = useCase.execute(isOn: false)

        // THEN
        #expect(result == .right)
    }
}
