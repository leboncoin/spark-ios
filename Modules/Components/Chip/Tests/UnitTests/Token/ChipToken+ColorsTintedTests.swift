//
//  ChipToken+ColorsTintedTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

// MARK: - Tests

struct ChipTokenColorsTintedTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: ChipToken.Colors {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test
    func colorsWithAccentIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .accent,
            default: .init(
                background: self.theme.colors.accent.accentContainer,
                border: self.theme.colors.accent.accentContainer,
                content: self.theme.colors.accent.onAccentContainer
            ),
            selected: .init(
                background: self.theme.colors.accent.accent,
                border: self.theme.colors.accent.accent,
                content: self.theme.colors.accent.onAccent
            ),
            pressed: .init(
                background: self.theme.colors.states.accentContainerPressed,
                border: self.theme.colors.states.accentContainerPressed,
                content: self.theme.colors.accent.onAccentContainer
            )
        )
    }

    @Test
    func colorsWithAlertIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .alert,
            default: .init(
                background: self.theme.colors.feedback.alertContainer,
                border: self.theme.colors.feedback.alertContainer,
                content: self.theme.colors.feedback.onAlertContainer
            ),
            selected: .init(
                background: self.theme.colors.feedback.alert,
                border: self.theme.colors.feedback.alert,
                content: self.theme.colors.feedback.onAlert
            ),
            pressed: .init(
                background: self.theme.colors.states.alertContainerPressed,
                border: self.theme.colors.states.alertContainerPressed,
                content: self.theme.colors.feedback.onAlertContainer
            )
        )
    }

    @Test
    func colorsWithDangerIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .danger,
            default: .init(
                background: self.theme.colors.feedback.errorContainer,
                border: self.theme.colors.feedback.errorContainer,
                content: self.theme.colors.feedback.onErrorContainer
            ),
            selected: .init(
                background: self.theme.colors.feedback.error,
                border: self.theme.colors.feedback.error,
                content: self.theme.colors.feedback.onError
            ),
            pressed: .init(
                background: self.theme.colors.states.errorContainerPressed,
                border: self.theme.colors.states.errorContainerPressed,
                content: self.theme.colors.feedback.onErrorContainer
            )
        )
    }

    @Test
    func colorsWithInfoIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .info,
            default: .init(
                background: self.theme.colors.feedback.infoContainer,
                border: self.theme.colors.feedback.infoContainer,
                content: self.theme.colors.feedback.onInfoContainer
            ),
            selected: .init(
                background: self.theme.colors.feedback.info,
                border: self.theme.colors.feedback.info,
                content: self.theme.colors.feedback.onInfo
            ),
            pressed: .init(
                background: self.theme.colors.states.infoContainerPressed,
                border: self.theme.colors.states.infoContainerPressed,
                content: self.theme.colors.feedback.onInfoContainer
            )
        )
    }

    @Test
    func colorsWithMainIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .main,
            default: .init(
                background: self.theme.colors.main.mainContainer,
                border: self.theme.colors.main.mainContainer,
                content: self.theme.colors.main.onMainContainer
            ),
            selected: .init(
                background: self.theme.colors.main.main,
                border: self.theme.colors.main.main,
                content: self.theme.colors.main.onMain
            ),
            pressed: .init(
                background: self.theme.colors.states.mainContainerPressed,
                border: self.theme.colors.states.mainContainerPressed,
                content: self.theme.colors.main.onMainContainer
            )
        )
    }

    @Test
    func colorsWithNeutralIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .neutral,
            default: .init(
                background: self.theme.colors.feedback.neutralContainer,
                border: self.theme.colors.feedback.neutralContainer,
                content: self.theme.colors.feedback.onNeutralContainer
            ),
            selected: .init(
                background: self.theme.colors.feedback.neutral,
                border: self.theme.colors.feedback.neutral,
                content: self.theme.colors.feedback.onNeutral
            ),
            pressed: .init(
                background: self.theme.colors.states.neutralContainerPressed,
                border: self.theme.colors.states.neutralContainerPressed,
                content: self.theme.colors.feedback.onNeutralContainer
            )
        )
    }

    @Test
    func colorsWithSupportIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .support,
            default: .init(
                background: self.theme.colors.support.supportContainer,
                border: self.theme.colors.support.supportContainer,
                content: self.theme.colors.support.onSupportContainer
            ),
            selected: .init(
                background: self.theme.colors.support.support,
                border: self.theme.colors.support.support,
                content: self.theme.colors.support.onSupport
            ),
            pressed: .init(
                background: self.theme.colors.states.supportContainerPressed,
                border: self.theme.colors.states.supportContainerPressed,
                content: self.theme.colors.support.onSupportContainer
            )
        )
    }

    @Test
    func colorsWithSurfaceIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .surface,
            default: .init(
                background: self.theme.colors.base.surface.opacity(self.theme.dims.dim1),
                border: ColorTokenDefault.clear,
                content: self.theme.colors.base.surfaceInverse
            ),
            selected: .init(
                background: self.theme.colors.base.surface,
                border: self.theme.colors.base.surface,
                content: self.theme.colors.base.onSurface
            ),
            pressed: .init(
                background: self.theme.colors.states.surfacePressed,
                border: self.theme.colors.states.surfacePressed,
                content: self.theme.colors.base.surfaceInverse
            )
        )
    }

    @Test
    func colorsWithSuccessIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .success,
            default: .init(
                background: self.theme.colors.feedback.successContainer,
                border: self.theme.colors.feedback.successContainer,
                content: self.theme.colors.feedback.onSuccessContainer
            ),
            selected: .init(
                background: self.theme.colors.feedback.success,
                border: self.theme.colors.feedback.success,
                content: self.theme.colors.feedback.onSuccess
            ),
            pressed: .init(
                background: self.theme.colors.states.successContainerPressed,
                border: self.theme.colors.states.successContainerPressed,
                content: self.theme.colors.feedback.onSuccessContainer
            )
        )
    }

    // MARK: - Utils

    private struct ExpectedColors {
        let background: any ColorToken
        let border: any ColorToken
        let content: any ColorToken
    }

    private func expectColors(
        intent: ChipIntent,
        default defaultColors: ExpectedColors,
        selected selectedColors: ExpectedColors,
        pressed pressedColors: ExpectedColors,
        sourceLocation: SourceLocation = #_sourceLocation
    ) {
        let states: [(isSelected: Bool, isPressed: Bool)] = [
            (false, false),
            (true, false),
            (false, true),
            (true, true)
        ]

        for state in states {
            let expected = switch (state.isSelected, state.isPressed) {
            case (_, true): pressedColors
            case (true, false): selectedColors
            case (false, false): defaultColors
            }

            let background = self.token.background(
                intent: intent,
                variant: .tinted,
                isSelected: state.isSelected,
                isPressed: state.isPressed
            )
            let border = self.token.border(
                intent: intent,
                variant: .tinted,
                isSelected: state.isSelected,
                isPressed: state.isPressed
            )
            let content = self.token.content(
                intent: intent,
                variant: .tinted,
                isSelected: state.isSelected,
                isPressed: state.isPressed
            )

            let comment: Comment = "isSelected: \(state.isSelected), isPressed: \(state.isPressed)"
            #expect(background.equals(expected.background), comment, sourceLocation: sourceLocation)
            #expect(border.equals(expected.border), comment, sourceLocation: sourceLocation)
            #expect(content.equals(expected.content), comment, sourceLocation: sourceLocation)
        }
    }
}
