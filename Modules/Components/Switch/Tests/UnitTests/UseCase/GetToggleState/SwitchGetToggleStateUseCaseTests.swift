//
//  SwitchGetToggleStateUseCaseTests.swift
//  SparkComponentSwitchTests
//
//  Created by robin.lemaire on 12/05/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentSwitch
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Switch Get Toggle State UseCase Tests")
struct SwitchGetToggleStateUseCaseTests {

    // MARK: - Properties

    private let dimsMock = DimsGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute when is enabled is true")
    func executeWhenIsEnabledIsTrue() throws {
        try self.testExecute(
            givenIsEnabled: true,
            expectedInteractionState: .init(interactionEnabled: true, opacity: self.dimsMock.none)
        )
    }

    @Test("Execute when is enabled is false")
    func executeWhenIsEnabledIsFalse() throws {
        try self.testExecute(
            givenIsEnabled: false,
            expectedInteractionState: .init(interactionEnabled: false, opacity: self.dimsMock.dim3)
        )
    }
}

// MARK: - Execute Testing

private extension SwitchGetToggleStateUseCaseTests {

    func testExecute(
        givenIsEnabled: Bool,
        expectedInteractionState: SwitchToggleState
    ) throws {
        // GIVEN
        let errorPrefixMessage = " for \(givenIsEnabled) givenIsEnabled"

        let useCase = SwitchGetToggleStateUseCase()

        // GIVEN
        let interactionState = useCase.execute(
            isEnabled: givenIsEnabled,
            dims: self.dimsMock
        )

        // THEN
        #expect(
            interactionState.interactionEnabled == expectedInteractionState.interactionEnabled,
            "Wrong interactionEnabled\(errorPrefixMessage)"
        )
        #expect(
            interactionState.opacity == expectedInteractionState.opacity,
            "Wrong opacity\(errorPrefixMessage)"
        )
    }
}
