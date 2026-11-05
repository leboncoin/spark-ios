//
//  TextLinkGetHoverStyleUseCaseTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
@testable import SparkComponentTextLink

@Suite("Text Link Get Hover Style UseCase Tests")
struct TextLinkGetHoverStyleUseCaseTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()
    private let useCase = TextLinkGetHoverStyleUseCase()

    // MARK: - Tests

    @Test("Execute accent intent")
    func executeAccentIntent() {
        // GIVEN
        let intent = TextLinkIntent.accent

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.accent.accent))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute alert intent")
    func executeAlertIntent() {
        // GIVEN
        let intent = TextLinkIntent.alert

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.feedback.alert))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute support intent")
    func executeSupportIntent() {
        // GIVEN
        let intent = TextLinkIntent.support

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.support.support))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute danger intent")
    func executeDangerIntent() {
        // GIVEN
        let intent = TextLinkIntent.danger

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.feedback.error))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute info intent")
    func executeInfoIntent() {
        // GIVEN
        let intent = TextLinkIntent.info

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.feedback.info))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute main intent")
    func executeMainIntent() {
        // GIVEN
        let intent = TextLinkIntent.main

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.main.main))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute neutral intent")
    func executeNeutralIntent() {
        // GIVEN
        let intent = TextLinkIntent.neutral

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.feedback.neutral))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute success intent")
    func executeSuccessIntent() {
        // GIVEN
        let intent = TextLinkIntent.success

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.feedback.success))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute custom intent")
    func executeCustomIntent() {
        // GIVEN
        let customColorToken = ColorTokenGeneratedMock.red()
        let intent = TextLinkIntent.custom(customColorToken)

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(customColorToken))
        #expect(result.dim == theme.dims.dim5)
    }

    // MARK: - Deprecated Tests

    @Test("Execute accent container intent")
    func executeAccentContainerIntent() {
        // GIVEN
        let intent = TextLinkIntent.accentContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.accent.accent))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute alert container intent")
    func executeAlertContainerIntent() {
        // GIVEN
        let intent = TextLinkIntent.alertContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.feedback.alert))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute support container intent")
    func executeSupportContainerIntent() {
        // GIVEN
        let intent = TextLinkIntent.supportContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.support.support))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute danger container intent")
    func executeDangerContainerIntent() {
        // GIVEN
        let intent = TextLinkIntent.dangerContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.feedback.error))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute info container intent")
    func executeInfoContainerIntent() {
        // GIVEN
        let intent = TextLinkIntent.infoContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.feedback.info))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute main container intent")
    func executeMainContainerIntent() {
        // GIVEN
        let intent = TextLinkIntent.mainContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.main.main))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute neutral container intent")
    func executeNeutralContainerIntent() {
        // GIVEN
        let intent = TextLinkIntent.neutralContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.feedback.neutral))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute on accent container intent")
    func executeOnAccentContainerIntent() {
        // GIVEN
        let intent = TextLinkIntent.onAccentContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.accent.accent))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute on surface intent")
    func executeOnSurfaceIntent() {
        // GIVEN
        let intent = TextLinkIntent.onSurface

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.base.surface))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute success container intent")
    func executeSuccessContainerIntent() {
        // GIVEN
        let intent = TextLinkIntent.successContainer

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.feedback.success))
        #expect(result.dim == theme.dims.dim5)
    }

    @Test("Execute surface intent")
    func executeSurfaceIntent() {
        // GIVEN
        let intent = TextLinkIntent.surface

        // WHEN
        let result = self.useCase.execute(theme: self.theme, intent: intent)

        // THEN
        #expect(result.horizontalPadding == theme.layout.spacing.medium)
        #expect(result.verticalPadding == theme.layout.spacing.small)
        #expect(result.cornerRadius == theme.border.radius.medium)
        #expect(result.backgroundColor.equals(theme.colors.base.surface))
        #expect(result.dim == theme.dims.dim5)
    }
}
