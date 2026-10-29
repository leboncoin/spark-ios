//
//  ProgressTrackerGetTintedColorsUseCaseTests.swift
//  SparkComponentProgressTrackerUnitTests
//
//  Created by Michael Zimmermann on 18.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentProgressTracker
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Progress Tracker Get Tinted Colors Use Case Tests")
struct ProgressTrackerGetTintedColorsUseCaseTests {

    // MARK: Properties
    var sut: ProgressTrackerGetTintedColorsUseCase!
    var colors: ColorsGeneratedMock!

    // MARK: Setup
    init() {

        self.sut = ProgressTrackerGetTintedColorsUseCase()
        self.colors = ColorsGeneratedMock.mocked()
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

// MARK: - Private helpers
private extension ProgressTrackerIntent {

    func selectedColors(_ colors: any Colors) -> ProgressTrackerColors {
        let tintedColors: ProgressTrackerTintedColors = {
            switch self {
            case .accent:
                return .init(
                    background: colors.accent.accent,
                    content: colors.accent.onAccent)
            case .alert:
                return .init(
                    background: colors.feedback.alert,
                    content: colors.feedback.onAlert)
            case .danger:
                return .init(
                    background: colors.feedback.error,
                    content: colors.feedback.onError)
            case .info:
                return .init(
                    background: colors.feedback.info,
                    content: colors.feedback.onInfo)
            case .main:
                return .init(
                    background: colors.main.main,
                    content: colors.main.onMain)
            case .neutral:
                return .init(
                    background: colors.feedback.neutral,
                    content: colors.feedback.onNeutral)
            case .success:
                return .init(
                    background: colors.feedback.success,
                    content: colors.feedback.onSuccess)
            case .support:
                return .init(
                    background: colors.support.support,
                    content: colors.support.onSupport)
            }
        }()

        return ProgressTrackerColors(
            background: tintedColors.background,
            outline: tintedColors.background,
            content: tintedColors.content)
    }

    func enabledColors(_ colors: any Colors) -> ProgressTrackerColors {
        let tintedColors: ProgressTrackerTintedColors = {
            switch self {
            case .accent:
                return .init(
                    background: colors.accent.accentContainer,
                    content: colors.accent.onAccentContainer)
            case .alert:
                return .init(
                    background: colors.feedback.alertContainer,
                    content: colors.feedback.onAlertContainer)
            case .danger:
                return .init(
                    background: colors.feedback.errorContainer,
                    content: colors.feedback.onErrorContainer)
            case .info:
                return .init(
                    background: colors.feedback.infoContainer,
                    content: colors.feedback.onInfoContainer)
            case .main:
                return .init(
                    background: colors.main.mainContainer,
                    content: colors.main.onMainContainer)
            case .neutral:
                return .init(
                    background: colors.feedback.neutralContainer,
                    content: colors.feedback.onNeutralContainer)
            case .success:
                return .init(
                    background: colors.feedback.successContainer,
                    content: colors.feedback.onSuccessContainer)
            case .support:
                return .init(
                    background: colors.support.supportContainer,
                    content: colors.support.onSupportContainer)
            }
        }()

        return ProgressTrackerColors(
            background: tintedColors.background,
            outline: tintedColors.background,
            content: tintedColors.content)
    }

    func pressedColors(_ colors: any Colors) -> ProgressTrackerColors {
        let tintedColors: ProgressTrackerTintedColors = {
            switch self {
            case .accent:
                return .init(
                    background: colors.states.accentContainerPressed,
                    content: colors.accent.onAccentContainer)
            case .alert:
                return .init(
                    background: colors.states.alertContainerPressed,
                    content: colors.feedback.onAlertContainer)
            case .danger:
                return .init(
                    background: colors.states.errorContainerPressed,
                    content: colors.feedback.onErrorContainer)
            case .info:
                return .init(
                    background: colors.states.infoContainerPressed,
                    content: colors.feedback.onInfoContainer)
            case .main:
                return .init(
                    background: colors.states.mainContainerPressed,
                    content: colors.main.onMainContainer)
            case .neutral:
                return .init(
                    background: colors.states.neutralContainerPressed,
                    content: colors.feedback.onNeutralContainer)
            case .success:
                return .init(
                    background: colors.states.successContainerPressed,
                    content: colors.feedback.onSuccessContainer)
            case .support:
                return .init(
                    background: colors.states.supportContainerPressed,
                    content: colors.support.onSupportContainer)
            }
        }()

        return ProgressTrackerColors(
            background: tintedColors.background,
            outline: tintedColors.background,
            content: tintedColors.content)
    }
}

