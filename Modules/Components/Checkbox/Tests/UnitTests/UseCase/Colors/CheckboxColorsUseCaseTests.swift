//
//  CheckboxColorsUseCaseTests.swift
//  SparkComponentCheckbox
//
//  Created by janniklas.freundt.ext on 17.04.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentCheckbox
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Checkbox Colors UseCase Tests")
struct CheckboxColorsUseCaseTests {

    var sut: CheckboxColorsUseCase!
    var theme: ThemeGeneratedMock!

    init() {
        self.sut = .init()
        self.theme = .mocked()
    }

    // MARK: - Tests

    @Test("Execute for all intent cases")
    func executeForAllIntentCases() {
        let intents = CheckboxIntent.allCases

        intents.forEach {

            let checkboxColors = sut.execute(from: theme.colors, intent: $0)

            let expectedColors: CheckboxColors

            switch $0 {
            case .accent:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.accent.accent,
                    iconColor: theme.colors.accent.onAccent,
                    pressedBorderColor: theme.colors.accent.accentContainer
                )
            case .error:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.feedback.error,
                    iconColor: theme.colors.feedback.onError,
                    pressedBorderColor: theme.colors.feedback.errorContainer
                )
            case .success:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.feedback.success,
                    iconColor: theme.colors.feedback.onSuccess,
                    pressedBorderColor: theme.colors.feedback.successContainer
                )
            case .alert:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.feedback.alert,
                    iconColor: theme.colors.feedback.onAlert,
                    pressedBorderColor: theme.colors.feedback.alertContainer
                )
            case .info:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.feedback.info,
                    iconColor: theme.colors.feedback.onInfo,
                    pressedBorderColor: theme.colors.feedback.infoContainer
                )
            case .neutral:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.feedback.neutral,
                    iconColor: theme.colors.feedback.onNeutral,
                    pressedBorderColor: theme.colors.feedback.neutralContainer
                )
            case .support:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.support.support,
                    iconColor: theme.colors.support.onSupport,
                    pressedBorderColor: theme.colors.support.supportContainer
                )
            case .main:
                expectedColors = CheckboxColors(
                    textColor: theme.colors.base.onSurface,
                    borderColor: theme.colors.base.outline,
                    tintColor: theme.colors.main.main,
                    iconColor: theme.colors.main.onMain,
                    pressedBorderColor: theme.colors.main.mainContainer
                )
            }

            #expect(checkboxColors.textColor.uiColor == expectedColors.textColor.uiColor)
            #expect(checkboxColors.borderColor.uiColor == expectedColors.borderColor.uiColor)
            #expect(checkboxColors.tintColor.uiColor == expectedColors.tintColor.uiColor)
            #expect(checkboxColors.iconColor.uiColor == expectedColors.iconColor.uiColor)
            #expect(checkboxColors.pressedBorderColor.uiColor == expectedColors.pressedBorderColor.uiColor)
        }
    }
}
