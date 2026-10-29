//
//  SwitchGetToggleColorUseCaseTests.swift
//  SparkComponentSwitchTests
//
//  Created by robin.lemaire on 23/05/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentSwitch
@_spi(SI_SPI) @testable import SparkComponentSwitchTesting
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Switch Get Toggle Color UseCase Tests")
struct SwitchGetToggleColorUseCaseTests {

    // MARK: - Properties

    private var statusAndStateColorMock = SwitchStatusColors.mocked()

    // MARK: - Tests

    @Test("Execute when is on is true")
    func executeWhenIsOnIsTrue() throws {
        try self.testExecute(
            givenIsOn: true,
            expectedColorToken: self.statusAndStateColorMock.onColorToken
        )
    }

    @Test("Execute when is on is false")
    func executeWhenIsOnIsFalse() throws {
        try self.testExecute(
            givenIsOn: false,
            expectedColorToken: self.statusAndStateColorMock.offColorToken
        )
    }
}

// MARK: - Execute Testing

private extension SwitchGetToggleColorUseCaseTests {

    func testExecute(
        givenIsOn: Bool,
        expectedColorToken: any ColorToken
    ) throws {
        // GIVEN
        let errorPrefixMessage = " for \(givenIsOn) isOn"

        let useCase = SwitchGetToggleColorUseCase()

        // WHEN
        let colorToken = useCase.execute(
            isOn: givenIsOn,
            statusAndStateColor: statusAndStateColorMock
        )

        // THEN
        #expect(
            colorToken as? ColorTokenGeneratedMock == expectedColorToken as? ColorTokenGeneratedMock,
            "Wrong interactionEnabled\(errorPrefixMessage)"
        )
    }
}
