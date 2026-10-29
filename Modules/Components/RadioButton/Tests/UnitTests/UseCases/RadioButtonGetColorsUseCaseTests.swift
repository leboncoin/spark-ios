//
//  RadioButtonGetColorsUseCaseTests.swift
//  SparkComponentRadioButtonTests
//
//  Created by michael.zimmermann on 13.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentRadioButton
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI
import Testing

@MainActor
@Suite("Radio Button Get Colors UseCase Tests")
struct RadioButtonGetColorsUseCaseTests {

    // MARK: - Properties

    var sut: RadioButtonGetColorsUseCase!
    var theme: ThemeGeneratedMock!

    // MARK: - Initialization

    init() {
        // Given
        let theme = ThemeGeneratedMock.mocked()
        self.theme = theme
        self.sut = RadioButtonGetColorsUseCase()
    }

    // MARK: - Tests
    @Test("Danger colors when button is not selected")
    func dangerColorsWhenButtonIsNotSelected() throws {
        // Given
        let colors = self.theme.colors
        let expectedColors = RadioButtonColors(
            button: colors.base.outline,
            label: colors.base.onBackground,
            halo: colors.feedback.errorContainer,
            fill: ColorTokenDefault.clear,
            surface: colors.feedback.onError
        )

        // When
        let givenColors = self.sut.execute(
            theme: self.theme,
            intent: .danger,
            isSelected: false)

        // Then
        #expect(givenColors == expectedColors)
    }

    @Test("Info colors when button is not selected")
    func infoColorsWhenButtonIsNotSelected() throws {
        // Given
        let colors = self.theme.colors
        let expectedColors = RadioButtonColors(
            button: colors.base.outline,
            label: colors.base.onBackground,
            halo: colors.feedback.infoContainer,
            fill: ColorTokenDefault.clear,
            surface: colors.feedback.onInfo
        )

        // When
        let givenColors = self.sut.execute(
            theme: self.theme,
            intent: .info,
            isSelected: false)

        // Then
        #expect(givenColors == expectedColors)
    }

    @Test("Alert colors when button is not selected")
    func alertColorsWhenButtonIsNotSelected() throws {
        // Given
        let colors = self.theme.colors
        let expectedColors = RadioButtonColors(
            button: colors.base.outline,
            label: colors.base.onBackground,
            halo: colors.feedback.alertContainer,
            fill: ColorTokenDefault.clear,
            surface: colors.feedback.onAlert
        )

        // When
        let givenColors = self.sut.execute(
            theme: self.theme,
            intent: .alert,
            isSelected: false)

        // Then
        #expect(givenColors == expectedColors)
    }

    @Test("Success colors when button is not selected")
    func successColorsWhenButtonIsNotSelected() throws {
        // Given
        let colors = self.theme.colors
        let expectedColors = RadioButtonColors(
            button: colors.base.outline,
            label: colors.base.onBackground,
            halo: colors.feedback.successContainer,
            fill: ColorTokenDefault.clear,
            surface: colors.feedback.onSuccess
        )

        // When
        let givenColors = self.sut.execute(
            theme: self.theme,
            intent: .success,
            isSelected: false)

        // Then
        #expect(givenColors == expectedColors)
    }

    @Test("Accent colors when button is not selected")
    func accentColorsWhenButtonIsNotSelected() throws {
        // Given
        let colors = self.theme.colors
        let expectedColors = RadioButtonColors(
            button: colors.base.outline,
            label: colors.base.onBackground,
            halo: colors.accent.accentContainer,
            fill: ColorTokenDefault.clear,
            surface: colors.accent.onAccent
        )

        // When
        let givenColors = self.sut.execute(
            theme: self.theme,
            intent: .accent,
            isSelected: false)

        // Then
        #expect(givenColors == expectedColors)
    }

    @Test("Danger colors when button is selected")
    func dangerColorsWhenButtonIsSelected() throws {
        // Given
        let colors = self.theme.colors
        let expectedColors = RadioButtonColors(
            button: colors.feedback.error,
            label: colors.base.onBackground,
            halo: colors.feedback.errorContainer,
            fill: colors.feedback.error,
            surface: colors.feedback.onError
        )

        // When
        let givenColors = self.sut.execute(
            theme: self.theme,
            intent: .danger,
            isSelected: true)

        // Then
        #expect(givenColors == expectedColors)
    }

    @Test("Alert colors when button is selected")
    func alertColorsWhenButtonIsSelected() throws {
        // Given
        let colors = self.theme.colors
        let expectedColors = RadioButtonColors(
            button: colors.feedback.alert,
            label: colors.base.onBackground,
            halo: colors.feedback.alertContainer,
            fill: colors.feedback.alert,
            surface: colors.feedback.onAlert
        )

        // When
        let givenColors = self.sut.execute(
            theme: self.theme,
            intent: .alert,
            isSelected: true)

        // Then
        #expect(givenColors == expectedColors)
    }

    @Test("Success colors when button is selected")
    func successColorsWhenButtonIsSelected() throws {
        // Given
        let colors = self.theme.colors
        let expectedColors = RadioButtonColors(
            button: colors.feedback.success,
            label: colors.base.onBackground,
            halo: colors.feedback.successContainer,
            fill: colors.feedback.success,
            surface: colors.feedback.onSuccess
        )

        // When
        let givenColors = self.sut.execute(
            theme: self.theme,
            intent: .success,
            isSelected: true)

        // Then
        #expect(givenColors == expectedColors)
    }

    @Test("Accent colors when button is selected")
    func accentColorsWhenButtonIsSelected() throws {
        // Given
        let colors = self.theme.colors
        let expectedColors = RadioButtonColors(
            button: colors.accent.accent,
            label: colors.base.onBackground,
            halo: colors.accent.accentContainer,
            fill: colors.accent.accent,
            surface: colors.accent.onAccent
        )

        // When
        let givenColors = self.sut.execute(
            theme: self.theme,
            intent: .accent,
            isSelected: true)

        // Then
        #expect(givenColors == expectedColors)
    }

}
