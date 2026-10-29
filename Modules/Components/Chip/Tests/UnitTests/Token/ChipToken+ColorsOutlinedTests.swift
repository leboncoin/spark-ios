//
//  ChipToken+ColorsOutlinedTests.swift
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

struct ChipTokenColorsOutlinedTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    private var token: ChipToken.Colors {
        return .init(theme: self.theme)
    }

    // MARK: - Tests

    @Test("Colors with accent intent should return expected colors")
    func colorsWithAccentIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .accent,
            default: .init(
                background: ColorTokenDefault.clear,
                border: self.theme.colors.accent.accent,
                content: self.theme.colors.accent.accent
            ),
            selected: .init(
                background: self.theme.colors.accent.accentContainer,
                border: self.theme.colors.accent.accent,
                content: self.theme.colors.accent.accent
            ),
            pressed: .init(
                background: self.theme.colors.accent.accent.opacity(self.theme.dims.dim5),
                border: self.theme.colors.accent.accent,
                content: self.theme.colors.accent.accent
            )
        )
    }

    @Test("Colors with alert intent should return expected colors")
    func colorsWithAlertIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .alert,
            default: .init(
                background: ColorTokenDefault.clear,
                border: self.theme.colors.feedback.alert,
                content: self.theme.colors.feedback.alert
            ),
            selected: .init(
                background: self.theme.colors.feedback.alertContainer,
                border: self.theme.colors.feedback.alert,
                content: self.theme.colors.feedback.alert
            ),
            pressed: .init(
                background: self.theme.colors.feedback.alert.opacity(self.theme.dims.dim5),
                border: self.theme.colors.feedback.alert,
                content: self.theme.colors.feedback.alert
            )
        )
    }

    @Test("Colors with danger intent should return expected colors")
    func colorsWithDangerIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .danger,
            default: .init(
                background: ColorTokenDefault.clear,
                border: self.theme.colors.feedback.error,
                content: self.theme.colors.feedback.error
            ),
            selected: .init(
                background: self.theme.colors.feedback.errorContainer,
                border: self.theme.colors.feedback.error,
                content: self.theme.colors.feedback.error
            ),
            pressed: .init(
                background: self.theme.colors.feedback.error.opacity(self.theme.dims.dim5),
                border: self.theme.colors.feedback.error,
                content: self.theme.colors.feedback.error
            )
        )
    }

    @Test("Colors with info intent should return expected colors")
    func colorsWithInfoIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .info,
            default: .init(
                background: ColorTokenDefault.clear,
                border: self.theme.colors.feedback.info,
                content: self.theme.colors.feedback.info
            ),
            selected: .init(
                background: self.theme.colors.feedback.infoContainer,
                border: self.theme.colors.feedback.info,
                content: self.theme.colors.feedback.info
            ),
            pressed: .init(
                background: self.theme.colors.feedback.info.opacity(self.theme.dims.dim5),
                border: self.theme.colors.feedback.info,
                content: self.theme.colors.feedback.info
            )
        )
    }

    @Test("Colors with main intent should return expected colors")
    func colorsWithMainIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .main,
            default: .init(
                background: ColorTokenDefault.clear,
                border: self.theme.colors.main.main,
                content: self.theme.colors.main.main
            ),
            selected: .init(
                background: self.theme.colors.main.mainContainer,
                border: self.theme.colors.main.main,
                content: self.theme.colors.main.main
            ),
            pressed: .init(
                background: self.theme.colors.main.main.opacity(self.theme.dims.dim5),
                border: self.theme.colors.main.main,
                content: self.theme.colors.main.main
            )
        )
    }

    @Test("Colors with neutral intent should return expected colors")
    func colorsWithNeutralIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .neutral,
            default: .init(
                background: ColorTokenDefault.clear,
                border: self.theme.colors.feedback.neutral,
                content: self.theme.colors.feedback.neutral
            ),
            selected: .init(
                background: self.theme.colors.feedback.neutralContainer,
                border: self.theme.colors.feedback.neutral,
                content: self.theme.colors.feedback.neutral
            ),
            pressed: .init(
                background: self.theme.colors.feedback.neutral.opacity(self.theme.dims.dim5),
                border: self.theme.colors.feedback.neutral,
                content: self.theme.colors.feedback.neutral
            )
        )
    }

    @Test("Colors with success intent should return expected colors")
    func colorsWithSuccessIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .success,
            default: .init(
                background: ColorTokenDefault.clear,
                border: self.theme.colors.feedback.success,
                content: self.theme.colors.feedback.success
            ),
            selected: .init(
                background: self.theme.colors.feedback.successContainer,
                border: self.theme.colors.feedback.success,
                content: self.theme.colors.feedback.success
            ),
            pressed: .init(
                background: self.theme.colors.feedback.success.opacity(self.theme.dims.dim5),
                border: self.theme.colors.feedback.success,
                content: self.theme.colors.feedback.success
            )
        )
    }

    @Test("Colors with support intent should return expected colors")
    func colorsWithSupportIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .support,
            default: .init(
                background: ColorTokenDefault.clear,
                border: self.theme.colors.support.support,
                content: self.theme.colors.support.support
            ),
            selected: .init(
                background: self.theme.colors.support.supportContainer,
                border: self.theme.colors.support.support,
                content: self.theme.colors.support.support
            ),
            pressed: .init(
                background: self.theme.colors.support.support.opacity(self.theme.dims.dim5),
                border: self.theme.colors.support.support,
                content: self.theme.colors.support.support
            )
        )
    }

    @Test("Colors with surface intent should return expected colors")
    func colorsWithSurfaceIntentShouldReturnExpectedColors() {
        self.expectColors(
            intent: .surface,
            default: .init(
                background: ColorTokenDefault.clear,
                border: self.theme.colors.base.onSurface,
                content: self.theme.colors.base.onSurface
            ),
            selected: .init(
                background: self.theme.colors.base.surface,
                border: self.theme.colors.base.onSurface,
                content: self.theme.colors.base.onSurface
            ),
            pressed: .init(
                background: self.theme.colors.base.onSurface.opacity(self.theme.dims.dim5),
                border: self.theme.colors.base.onSurface,
                content: self.theme.colors.base.onSurface
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
                variant: .outlined,
                isSelected: state.isSelected,
                isPressed: state.isPressed
            )
            let border = self.token.border(
                intent: intent,
                variant: .outlined,
                isSelected: state.isSelected,
                isPressed: state.isPressed
            )
            let content = self.token.content(
                intent: intent,
                variant: .outlined,
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
