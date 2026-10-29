//
//  ProgressTrackerGetOutlinedColorsUseCaseTests.swift
//  SparkComponentProgressTrackerSnapshotTests
//
//  Created by Michael Zimmermann on 18.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentProgressTracker
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Progress Tracker Get Outlined Colors Use Case Tests")
struct ProgressTrackerGetOutlinedColorsUseCaseTests {

    var sut: ProgressTrackerGetOutlinedColorsUseCase!
    var colors: ColorsGeneratedMock!

    // MARK: - Setup
    init() {

        self.colors = ColorsGeneratedMock.mocked()
        self.sut = ProgressTrackerGetOutlinedColorsUseCase()
    }

    // MARK: - Tests
    @Test("Selected colors")
    func selectedColors() {
        // GIVEN

        for intent in ProgressTrackerIntent.allCases {
            // WHEN
            let colors = self.sut.execute(colors: self.colors, intent: intent, state: .selected)

            // THEN
            #expect(colors == intent.selectedColors(self.colors), "Selected colors for intent \(intent) not as expected")
        }
    }

    @Test("Enabled colors")
    func enabledColors() {
        // GIVEN

        for intent in ProgressTrackerIntent.allCases {
            // WHEN

            let colors = self.sut.execute(colors: self.colors, intent: intent, state: .normal)

            // THEN
            #expect(colors == intent.enabledColors(self.colors), "Enabled colors for intent \(intent) not as expected")
        }
    }

    @Test("Pressed colors")
    func pressedColors() {
        // GIVEN

        for intent in ProgressTrackerIntent.allCases {
            // WHEN

            let colors = self.sut.execute(colors: self.colors, intent: intent, state: .pressed)

            // THEN
            #expect(colors == intent.pressedColors(self.colors), "Pressed colors for intent \(intent) not as expected")
        }
    }

    @Test("Colors disabled")
    func colorsDisabled() {
        // GIVEN

        for intent in ProgressTrackerIntent.allCases {
            // WHEN

            let colors = self.sut.execute(colors: self.colors, intent: intent, state: .disabled)

            let expectedColors = intent.enabledColors(self.colors)

            // THEN
            #expect(colors == expectedColors, "Disabled colors for intent \(intent) not as expected")
        }
    }
}

// MARK: Private helpers
private extension ProgressTrackerIntent {

    func selectedColors(_ colors: any Colors) -> ProgressTrackerColors {
        switch self {
        case .accent:
            return .init(
                background: colors.accent.accentContainer,
                outline: colors.accent.accent,
                content: colors.accent.onAccentContainer)
        case .alert:
            return .init(
                background: colors.feedback.alertContainer,
                outline: colors.feedback.alert,
                content: colors.feedback.onAlertContainer)
        case .danger:
            return .init(
                background: colors.feedback.errorContainer,
                outline: colors.feedback.error,
                content: colors.feedback.onErrorContainer)
        case .info:
            return .init(
                background: colors.feedback.infoContainer,
                outline: colors.feedback.info,
                content: colors.feedback.onInfoContainer)
        case .main:
            return .init(
                background: colors.main.mainContainer,
                outline: colors.main.main,
                content: colors.main.onMainContainer)
        case .neutral:
            return .init(
                background: colors.feedback.neutralContainer,
                outline: colors.feedback.neutral,
                content: colors.feedback.onNeutralContainer)
        case .success:
            return .init(
                background: colors.feedback.successContainer,
                outline: colors.feedback.success,
                content: colors.feedback.onSuccessContainer)
        case .support:
            return .init(
                background: colors.support.supportContainer,
                outline: colors.support.support,
                content: colors.support.onSupportContainer)
        }
    }

    func enabledColors(_ colors: any Colors) -> ProgressTrackerColors {
        switch self {
        case .accent:
            return .init(
                background: ColorTokenDefault.clear,
                outline: colors.accent.accent,
                content: colors.accent.onAccentContainer)
        case .alert:
            return .init(
                background: ColorTokenDefault.clear,
                outline: colors.feedback.alert,
                content: colors.feedback.onAlertContainer)
        case .danger:
            return .init(
                background: ColorTokenDefault.clear,
                outline: colors.feedback.error,
                content: colors.feedback.onErrorContainer)
        case .info:
            return .init(
                background: ColorTokenDefault.clear,
                outline: colors.feedback.info,
                content: colors.feedback.onInfoContainer)
        case .main:
            return .init(
                background: ColorTokenDefault.clear,
                outline: colors.main.main,
                content: colors.main.onMainContainer)
        case .neutral:
            return .init(
                background: ColorTokenDefault.clear,
                outline: colors.feedback.neutral,
                content: colors.feedback.onNeutralContainer)
        case .success:
            return .init(
                background: ColorTokenDefault.clear,
                outline: colors.feedback.success,
                content: colors.feedback.onSuccessContainer)
        case .support:
            return .init(
                background: ColorTokenDefault.clear,
                outline: colors.support.support,
                content: colors.support.onSupportContainer)
        }
    }

    func pressedColors(_ colors: any Colors) -> ProgressTrackerColors {
        switch self {
        case .accent:
            return .init(
                background: colors.states.accentContainerPressed,
                outline: colors.accent.accent,
                content: colors.accent.onAccentContainer)
        case .alert:
            return .init(
                background: colors.states.alertContainerPressed,
                outline: colors.feedback.alert,
                content: colors.feedback.onAlertContainer)
        case .danger:
            return .init(
                background: colors.states.errorContainerPressed,
                outline: colors.feedback.error,
                content: colors.feedback.onErrorContainer)
        case .info:
            return .init(
                background: colors.states.infoContainerPressed,
                outline: colors.feedback.info,
                content: colors.feedback.onInfoContainer)
        case .main:
            return .init(
                background: colors.states.mainContainerPressed,
                outline: colors.main.main,
                content: colors.main.onMainContainer)
        case .neutral:
            return .init(
                background: colors.states.neutralContainerPressed,
                outline: colors.feedback.neutral,
                content: colors.feedback.onNeutralContainer)
        case .success:
            return .init(
                background: colors.states.successContainerPressed,
                outline: colors.feedback.success,
                content: colors.feedback.onSuccessContainer)
        case .support:
            return .init(
                background: colors.states.supportContainerPressed,
                outline: colors.support.support,
                content: colors.support.onSupportContainer)
        }
    }
}

