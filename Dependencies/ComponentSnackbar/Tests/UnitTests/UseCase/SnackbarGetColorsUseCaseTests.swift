//
//  SnackbarGetColorsUseCaseTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentSnackbar
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Snackbar Get Colors Use Case Tests")
struct SnackbarGetColorsUseCaseTests {

    // MARK: - Properties

    let sut: SnackbarGetColorsUseCase
    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = SnackbarGetColorsUseCase()
    }

    // MARK: - Tests

    @Test("Intent success returns success colors")
    func intentSuccessReturnsSuccessColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .success)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.feedback.onSuccessContainer))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.successContainer))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.success))
    }

    @Test("Intent alert returns alert colors")
    func intentAlertReturnsAlertColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .alert)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.feedback.onAlertContainer))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.alertContainer))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.alert))
    }

    @Test("Intent error returns error colors")
    func intentErrorReturnsErrorColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .error)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.feedback.onErrorContainer))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.errorContainer))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.error))
    }

    @Test("Intent info returns info colors")
    func intentInfoReturnsInfoColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .info)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.feedback.onInfoContainer))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.infoContainer))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.info))
    }

    @Test("Deprecated intent accent returns info colors as fallback")
    func deprecatedIntentAccentReturnsInfoColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .accent)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.feedback.onInfoContainer))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.infoContainer))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.info))
    }

    @Test("Deprecated intent main returns info colors as fallback")
    func deprecatedIntentMainReturnsInfoColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .main)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.feedback.onInfoContainer))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.infoContainer))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.info))
    }

    @Test("Deprecated intent neutral returns info colors as fallback")
    func deprecatedIntentNeutralReturnsInfoColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .neutral)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.feedback.onInfoContainer))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.infoContainer))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.info))
    }

    @Test("Deprecated intent support returns info colors as fallback")
    func deprecatedIntentSupportReturnsInfoColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .support)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.feedback.onInfoContainer))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.infoContainer))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.info))
    }

    @Test("Deprecated intent surfaceInverse returns info colors as fallback")
    func deprecatedIntentSurfaceInverseReturnsInfoColors() {
        // GIVEN / WHEN
        let colors = self.sut.execute(theme: self.theme, intent: .surfaceInverse)

        // THEN
        #expect(colors.tintColorToken.equals(self.theme.colors.feedback.onInfoContainer))
        #expect(colors.backgroundColorToken.equals(self.theme.colors.feedback.infoContainer))
        #expect(colors.borderColorToken.equals(self.theme.colors.feedback.info))
    }
}
