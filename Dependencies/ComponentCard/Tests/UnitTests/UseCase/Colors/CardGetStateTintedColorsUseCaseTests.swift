//
//  CardGetStateTintedColorsUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

@Suite("Card Get State Tinted Colors Use Case Tests")
struct CardGetStateTintedColorsUseCaseTests {

    // MARK: - Properties

    private let useCase = CardGetStateTintedColorsUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute with accent intent")
    func executeWithAccentIntent() {
        // GIVEN
        let intent = CardIntent.accent

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.background.equals(self.theme.colors.accent.accentContainer) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.states.accentContainerPressed) == true)
        #expect(stateColors.border.equals(self.theme.colors.accent.accentContainer) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.states.accentContainerPressed) == true)
    }

    @Test("Execute with alert intent")
    func executeWithAlertIntent() {
        // GIVEN
        let intent = CardIntent.alert

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.background.equals(self.theme.colors.feedback.alertContainer) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.states.alertContainerPressed) == true)
        #expect(stateColors.border.equals(self.theme.colors.feedback.alertContainer) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.states.alertContainerPressed) == true)
    }

    @Test("Execute with error intent")
    func executeWithErrorIntent() {
        // GIVEN
        let intent = CardIntent.error

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.background.equals(self.theme.colors.feedback.errorContainer) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.states.errorContainerPressed) == true)
        #expect(stateColors.border.equals(self.theme.colors.feedback.errorContainer) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.states.errorContainerPressed) == true)
    }

    @Test("Execute with info intent")
    func executeWithInfoIntent() {
        // GIVEN
        let intent = CardIntent.info

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.background.equals(self.theme.colors.feedback.infoContainer) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.states.infoContainerPressed) == true)
        #expect(stateColors.border.equals(self.theme.colors.feedback.infoContainer) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.states.infoContainerPressed) == true)
    }

    @Test("Execute with main intent")
    func executeWithMainIntent() {
        // GIVEN
        let intent = CardIntent.main

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.background.equals(self.theme.colors.main.mainContainer) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.states.mainContainerPressed) == true)
        #expect(stateColors.border.equals(self.theme.colors.main.mainContainer) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.states.mainContainerPressed) == true)
    }

    @Test("Execute with neutral intent")
    func executeWithNeutralIntent() {
        // GIVEN
        let intent = CardIntent.neutral

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.background.equals(self.theme.colors.feedback.neutralContainer) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.states.neutralContainerPressed) == true)
        #expect(stateColors.border.equals(self.theme.colors.feedback.neutralContainer) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.states.neutralContainerPressed) == true)
    }

    @Test("Execute with success intent")
    func executeWithSuccessIntent() {
        // GIVEN
        let intent = CardIntent.success

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.background.equals(self.theme.colors.feedback.successContainer) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.states.successContainerPressed) == true)
        #expect(stateColors.border.equals(self.theme.colors.feedback.successContainer) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.states.successContainerPressed) == true)
    }

    @Test("Execute with support intent")
    func executeWithSupportIntent() {
        // GIVEN
        let intent = CardIntent.support

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.background.equals(self.theme.colors.support.supportContainer) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.states.supportContainerPressed) == true)
        #expect(stateColors.border.equals(self.theme.colors.support.supportContainer) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.states.supportContainerPressed) == true)
    }

    @Test("Execute with surface intent")
    func executeWithSurfaceIntent() {
        // GIVEN
        let intent = CardIntent.surface

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.background.equals(self.theme.colors.base.surface) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.states.surfacePressed) == true)
        #expect(stateColors.border.equals(self.theme.colors.base.surface) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.states.surfacePressed) == true)
    }
}