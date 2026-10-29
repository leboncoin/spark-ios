//
//  SwitchGetPositionUseCaseTests.swift
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
@Suite("Switch Get Position UseCase Tests")
struct SwitchGetPositionUseCaseTests {

    // MARK: - Properties

    private let spacingMock = LayoutSpacingGeneratedMock.mocked()

    // MARK: - Alignment Tests

    @Test("Execute when switch alignment is left case")
    func executeWhenSwitchAlignmentIsLeftCase() throws {
        try self.testExecute(
            givenAlignment: .left,
            givenContainsText: true,
            expectedPosition: .init(
                isToggleOnLeft: true,
                horizontalSpacing: self.spacingMock.medium
            )
        )
    }

    @Test("Execute when switch alignment is right case")
    func executeWhenSwitchAlignmentIsRightCase() throws {
        try self.testExecute(
            givenAlignment: .left,
            givenContainsText: true,
            expectedPosition: .init(
                isToggleOnLeft: true,
                horizontalSpacing: self.spacingMock.medium
            )
        )
    }

    // MARK: - Contains Text Tests

    @Test("Execute when contains text is false")
    func executeWhenContainsTextIsFalse() throws {
        try self.testExecute(
            givenAlignment: .left,
            givenContainsText: false,
            expectedPosition: .init(
                isToggleOnLeft: true,
                horizontalSpacing: 0
            )
        )
    }
}

// MARK: - Execute Testing

private extension SwitchGetPositionUseCaseTests {

    func testExecute(
        givenAlignment: SwitchAlignment,
        givenContainsText: Bool,
        expectedPosition: SwitchPosition
    ) throws {
        // GIVEN
        let errorPrefixMessage = " for .\(givenAlignment) alignment case - containsText = .\(givenContainsText)"

        let useCase = SwitchGetPositionUseCase()

        // WHEN
        let position = useCase.execute(
            alignment: givenAlignment,
            spacing: self.spacingMock,
            containsText: givenContainsText
        )

        // THEN
        #expect(
            position.isToggleOnLeft == expectedPosition.isToggleOnLeft,
            "Wrong isToggleOnLeft position\(errorPrefixMessage)"
        )
        #expect(
            position.horizontalSpacing == expectedPosition.horizontalSpacing,
            "Wrong horizontalSpacing position\(errorPrefixMessage)"
        )
    }
}
