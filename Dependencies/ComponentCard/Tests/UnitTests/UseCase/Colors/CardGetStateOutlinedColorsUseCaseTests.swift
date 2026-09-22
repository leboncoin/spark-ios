//
//  CardGetStateOutlinedColorsUseCaseTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentCard
@testable @_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

@Suite("Card Get State Outlined Colors Use Case Tests")
struct CardGetStateOutlinedColorsUseCaseTests {

    // MARK: - Properties

    private let useCase = CardGetStateOutlinedColorsUseCase()
    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute with accent intent")
    func executeWithAccentIntent() {
        // GIVEN
        let intent = CardIntent.accent

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.border.equals(self.theme.colors.accent.accent) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.accent.accent) == true)
        #expect(stateColors.background.equals(self.theme.colors.base.surface) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.accent.accent.opacity(self.theme.dims.dim5)) == true)
    }

    @Test("Execute with alert intent")
    func executeWithAlertIntent() {
        // GIVEN
        let intent = CardIntent.alert

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.border.equals(self.theme.colors.feedback.alert) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.feedback.alert) == true)
        #expect(stateColors.background.equals(self.theme.colors.base.surface) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.feedback.alert.opacity(self.theme.dims.dim5)) == true)
    }

    @Test("Execute with error intent")
    func executeWithErrorIntent() {
        // GIVEN
        let intent = CardIntent.error

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.border.equals(self.theme.colors.feedback.error) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.feedback.error) == true)
        #expect(stateColors.background.equals(self.theme.colors.base.surface) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.feedback.error.opacity(self.theme.dims.dim5)) == true)
    }

    @Test("Execute with main intent")
    func executeWithMainIntent() {
        // GIVEN
        let intent = CardIntent.main

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.border.equals(self.theme.colors.main.main) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.main.main) == true)
        #expect(stateColors.background.equals(self.theme.colors.base.surface) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.main.main.opacity(self.theme.dims.dim5)) == true)
    }

    @Test("Execute with info intent")
    func executeWithInfoIntent() {
        // GIVEN
        let intent = CardIntent.info

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.border.equals(self.theme.colors.feedback.info) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.feedback.info) == true)
        #expect(stateColors.background.equals(self.theme.colors.base.surface) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.feedback.info.opacity(self.theme.dims.dim5)) == true)
    }

    @Test("Execute with neutral intent")
    func executeWithNeutralIntent() {
        // GIVEN
        let intent = CardIntent.neutral

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.border.equals(self.theme.colors.feedback.neutral) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.feedback.neutral) == true)
        #expect(stateColors.background.equals(self.theme.colors.base.surface) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.feedback.neutral.opacity(self.theme.dims.dim5)) == true)
    }

    @Test("Execute with success intent")
    func executeWithSuccessIntent() {
        // GIVEN
        let intent = CardIntent.success

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.border.equals(self.theme.colors.feedback.success) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.feedback.success) == true)
        #expect(stateColors.background.equals(self.theme.colors.base.surface) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.feedback.success.opacity(self.theme.dims.dim5)) == true)
    }

    @Test("Execute with support intent")
    func executeWithSupportIntent() {
        // GIVEN
        let intent = CardIntent.support

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.border.equals(self.theme.colors.support.support) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.support.support) == true)
        #expect(stateColors.background.equals(self.theme.colors.base.surface) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.support.support.opacity(self.theme.dims.dim5)) == true)
    }

    @Test("Execute with surface intent")
    func executeWithSurfaceIntent() {
        // GIVEN
        let intent = CardIntent.surface

        // WHEN
        let stateColors = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(stateColors.border.equals(self.theme.colors.base.outline) == true)
        #expect(stateColors.pressedBorder.equals(self.theme.colors.base.outline) == true)
        #expect(stateColors.background.equals(self.theme.colors.base.surface) == true)
        #expect(stateColors.pressedBackground.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim5)) == true)
    }
}