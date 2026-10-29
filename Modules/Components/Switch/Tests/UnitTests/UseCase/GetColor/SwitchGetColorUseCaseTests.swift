//
//  SwitchGetColorUseCaseTests.swift
//  SparkComponentSwitchTests
//
//  Created by robin.lemaire on 12/05/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentSwitch
@_spi(SI_SPI) @testable import SparkComponentSwitchTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming

@MainActor
@Suite("Switch Get Color UseCase Tests")
struct SwitchGetColorUseCaseTests {

    // MARK: - Properties

    private let colorsMock = ColorsGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute when intent is alert case")
    func executeWhenIntentIsAlertCase() throws {
        try self.testExecute(
            givenIntent: .alert,
            expectedColorToken: self.colorsMock.feedback.alert
        )
    }

    @Test("Execute when intent is error case")
    func executeWhenIntentIsErrorCase() throws {
        try self.testExecute(
            givenIntent: .error,
            expectedColorToken: self.colorsMock.feedback.error
        )
    }

    @Test("Execute when intent is info case")
    func executeWhenIntentIsInfoCase() throws {
        try self.testExecute(
            givenIntent: .info,
            expectedColorToken: self.colorsMock.feedback.info
        )
    }

    @Test("Execute when intent is neutral case")
    func executeWhenIntentIsNeutralCase() throws {
        try self.testExecute(
            givenIntent: .neutral,
            expectedColorToken: self.colorsMock.feedback.neutral
        )
    }

    @Test("Execute when intent is main case")
    func executeWhenIntentIsMainCase() throws {
        try self.testExecute(
            givenIntent: .main,
            expectedColorToken: self.colorsMock.main.main
        )
    }

    @Test("Execute when intent is support case")
    func executeWhenIntentIsSupportCase() throws {
        try self.testExecute(
            givenIntent: .support,
            expectedColorToken: self.colorsMock.support.support
        )
    }

    @Test("Execute when intent is success case")
    func executeWhenIntentIsSuccessCase() throws {
        try self.testExecute(
            givenIntent: .success,
            expectedColorToken: self.colorsMock.feedback.success
        )
    }

    @Test("Execute when intent is accent case")
    func executeWhenIntentIsAccentCase() throws {
        try self.testExecute(
            givenIntent: .accent,
            expectedColorToken: self.colorsMock.accent.accent
        )
    }
}

// MARK: - Execute Testing

private extension SwitchGetColorUseCaseTests {

    func testExecute(
        givenIntent: SwitchIntent,
        expectedColorToken: any ColorToken
    ) throws {
        // GIVEN
        let useCase = SwitchGetColorUseCase()

        // WHEN
        let colorToken = useCase.execute(
            intent: givenIntent,
            colors: self.colorsMock
        )

        // THEN
        #expect(
            colorToken as? ColorTokenGeneratedMock === expectedColorToken as? ColorTokenGeneratedMock,
            "Wrong color for .\(givenIntent) case"
        )
    }
}
