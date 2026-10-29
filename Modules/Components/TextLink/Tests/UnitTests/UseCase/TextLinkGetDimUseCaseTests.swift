//
//  TextLinkGetDimUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

@Suite("Text Link Get Dim UseCase Tests")
struct TextLinkGetDimUseCaseTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = TextLinkGetDimUseCase()

    // MARK: - Tests

    @Test("Execute support intent not highlighted")
    func executeSupportIntentNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute support intent highlighted")
    func executeSupportIntentHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute accent intent not highlighted")
    func executeAccentIntentNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute custom intent not highlighted")
    func executeCustomIntentNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute custom intent highlighted")
    func executeCustomIntentHighlighted() {
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
        #expect(result == theme.dims.dim1)
    }

    // MARK: - Deprecated Tests

    @Test("Execute accent container not highlighted")
    func executeAccentContainerNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute accent container highlighted")
    func executeAccentContainerHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.accentContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == theme.dims.dim1)
    }

    @Test("Execute on accent container not highlighted")
    func executeOnAccentContainerNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute on accent container highlighted")
    func executeOnAccentContainerHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.onAccentContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == theme.dims.dim1)
    }

    @Test("Execute alert container not highlighted")
    func executeAlertContainerNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute alert container highlighted")
    func executeAlertContainerHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.alertContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == theme.dims.dim1)
    }

    @Test("Execute support container not highlighted")
    func executeSupportContainerNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute support container highlighted")
    func executeSupportContainerHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.supportContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == theme.dims.dim1)
    }

    @Test("Execute danger container not highlighted")
    func executeDangerContainerNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute danger container highlighted")
    func executeDangerContainerHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.dangerContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == theme.dims.dim1)
    }

    @Test("Execute info container not highlighted")
    func executeInfoContainerNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute info container highlighted")
    func executeInfoContainerHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.infoContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == theme.dims.dim1)
    }

    @Test("Execute main container not highlighted")
    func executeMainContainerNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute main container highlighted")
    func executeMainContainerHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.mainContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == theme.dims.dim1)
    }

    @Test("Execute neutral container not highlighted")
    func executeNeutralContainerNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute neutral container highlighted")
    func executeNeutralContainerHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.neutralContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == theme.dims.dim1)
    }

    @Test("Execute success container not highlighted")
    func executeSuccessContainerNotHighlighted() {
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
        #expect(result == theme.dims.none)
    }

    @Test("Execute success container highlighted")
    func executeSuccessContainerHighlighted() {
        // GIVEN
        let intent = TextLinkIntent.successContainer
        let isHighlighted = true

        // WHEN
        let result = self.useCase.execute(
            theme: self.theme,
            intent: intent,
            isHighlighted: isHighlighted
        )

        // THEN
        #expect(result == theme.dims.dim1)
    }
}
