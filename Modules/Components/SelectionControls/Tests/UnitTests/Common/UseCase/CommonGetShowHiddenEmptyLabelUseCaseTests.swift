//
//  CommonGetShowHiddenEmptyLabelUseCaseTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls

@Suite("Common Get Show Hidden Empty Label UseCase Tests")
struct CommonGetShowHiddenEmptyLabelUseCaseTests {

    // MARK: - Tests

    @Test("Execute when is custom label returns left")
    func executeWhenIsCustomLabelReturnsLeft() {
        // GIVEN
        let useCase = CommonGetShowHiddenEmptyLabelUseCase()

        // WHEN
        let result = useCase.execute(isCustomLabel: true)

        // THEN
        #expect(result)
    }

    @Test("Execute when is not custom label returns right")
    func executeWhenIsNotCustomLabelReturnsRight() {
        // GIVEN
        let useCase = CommonGetShowHiddenEmptyLabelUseCase()

        // WHEN
        let result = useCase.execute(isCustomLabel: false)

        // THEN
        #expect(!result)
    }
}
