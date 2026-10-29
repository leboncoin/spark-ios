//
//  TextLinkGetColorUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

@Suite("Text Link Get Color UseCase Tests")
struct TextLinkGetColorUseCaseTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = TextLinkGetColorUseCase()

    // MARK: - Tests

    @Test("Execute accent not highlighted")
    func executeAccentNotHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.accent
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.accent.accent))
    }

    @Test("Execute accent highlighted")
    func executeAccentHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.accent
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.states.accentPressed))
    }

    @Test("Execute alert not highlighted")
    func executeAlertNotHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.alert
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.alert))
    }

    @Test("Execute alert highlighted")
    func executeAlertHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.alert
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.states.alertPressed))
    }

    @Test("Execute support not highlighted")
    func executeSupportNotHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.support
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.support.support))
    }

    @Test("Execute support highlighted")
    func executeSupportHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.support
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.states.supportPressed))
    }

    @Test("Execute danger not highlighted")
    func executeDangerNotHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.danger
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.error))
    }

    @Test("Execute danger highlighted")
    func executeDangerHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.danger
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.states.errorPressed))
    }

    @Test("Execute info not highlighted")
    func executeInfoNotHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.info
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.info))
    }

    @Test("Execute info highlighted")
    func executeInfoHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.info
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.states.infoPressed))
    }

    @Test("Execute main not highlighted")
    func executeMainNotHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.main
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.main.main))
    }

    @Test("Execute main highlighted")
    func executeMainHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.main
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.states.mainPressed))
    }

    @Test("Execute neutral not highlighted")
    func executeNeutralNotHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.neutral
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.neutral))
    }

    @Test("Execute neutral highlighted")
    func executeNeutralHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.neutral
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.states.neutralPressed))
    }

    @Test("Execute success not highlighted")
    func executeSuccessNotHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.success
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.success))
    }

    @Test("Execute success highlighted")
    func executeSuccessHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.success
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.states.successPressed))
    }

    @Test("Execute custom")
    func executeCustom() {
        // GIVEN
        let customColorToken = ColorTokenGeneratedMock.red()
        let intent = TextLinkIntent.custom(customColorToken)
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(customColorToken))
    }

    @Test("Execute custom highlighted")
    func executeCustomHighlighted() {
        // GIVEN
        let customColorToken = ColorTokenGeneratedMock.red()
        let intent = TextLinkIntent.custom(customColorToken)
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(customColorToken))
    }

    // MARK: - Deprecated Tests

    @Test("Execute deprecated accent container")
    func executeDeprecatedAccentContainer() {
        // GIVEN
        let intent = TextLinkIntent.accentContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.accent.onAccentContainer))
    }

    @Test("Execute deprecated surface")
    func executeDeprecatedSurface() {
        // GIVEN
        let intent = TextLinkIntent.surface
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.base.onSurface))
    }

    @Test("Execute deprecated alert container")
    func executeDeprecatedAlertContainer() {
        // GIVEN
        let intent = TextLinkIntent.alertContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.onAlertContainer))
    }

    @Test("Execute deprecated support container")
    func executeDeprecatedSupportContainer() {
        // GIVEN
        let intent = TextLinkIntent.supportContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.support.onSupportContainer))
    }

    @Test("Execute deprecated danger container")
    func executeDeprecatedDangerContainer() {
        // GIVEN
        let intent = TextLinkIntent.dangerContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.onErrorContainer))
    }

    @Test("Execute deprecated info container")
    func executeDeprecatedInfoContainer() {
        // GIVEN
        let intent = TextLinkIntent.infoContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.onInfoContainer))
    }

    @Test("Execute deprecated main container")
    func executeDeprecatedMainContainer() {
        // GIVEN
        let intent = TextLinkIntent.mainContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.main.onMainContainer))
    }

    @Test("Execute deprecated neutral container")
    func executeDeprecatedNeutralContainer() {
        // GIVEN
        let intent = TextLinkIntent.neutralContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.onNeutralContainer))
    }

    @Test("Execute deprecated on accent container")
    func executeDeprecatedOnAccentContainer() {
        // GIVEN
        let intent = TextLinkIntent.onAccentContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.accent.onAccentContainer))
    }

    @Test("Execute deprecated on surface")
    func executeDeprecatedOnSurface() {
        // GIVEN
        let intent = TextLinkIntent.onSurface
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.base.onSurface))
    }

    @Test("Execute deprecated success container")
    func executeDeprecatedSuccessContainer() {
        // GIVEN
        let intent = TextLinkIntent.successContainer
        let isHighlighted = false

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result.equals(theme.colors.feedback.onSuccessContainer))
    }
}
