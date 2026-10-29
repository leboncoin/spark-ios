//
//  TextInputGetColorsUseCaseTests.swift
//  SparkTextFieldUnitTests
//
//  Created by louis.borlee on 01/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Text Input Get Colors UseCase Tests")
struct TextInputGetColorsUseCaseTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Is focused is enabled is not read only")
    func isFocusedIsEnabledIsNotReadOnly() {
        let intentAndExpectedBorderColorArray: [(intent: TextInputIntent, expectedBorderColor: any ColorToken)] = [
            (intent: .success, self.theme.colors.feedback.success),
            (intent: .error, self.theme.colors.feedback.error),
            (intent: .alert, self.theme.colors.feedback.alert),
            (intent: .neutral, self.theme.colors.base.outlineHigh),
        ]
        #expect(intentAndExpectedBorderColorArray.count == TextInputIntent.allCases.count, "Wrong intentAndExpectedBorderColorArray count")

        intentAndExpectedBorderColorArray.forEach {
            self._test_isFocused_isEnabled_isNotReadOnly(with: $0.intent, expectedBorderColor: $0.expectedBorderColor)
        }
    }

    private func _test_isFocused_isEnabled_isNotReadOnly(
        with intent: TextInputIntent,
        expectedBorderColor: any ColorToken
    ) {
        // GIVEN
        let isFocused = true
        let isEnabled = true
        let isReadOnly = false
        let useCase = TextInputGetColorsUseCase()

        // WHEN
        let colors = useCase.execute(
            theme: self.theme,
            intent: intent,
            isFocused: isFocused,
            isEnabled: isEnabled,
            isReadOnly: isReadOnly
        )

        // THEN
        #expect(colors.text.equals(self.theme.colors.base.onSurface), "Wrong text color for intent: \(intent)")
        #expect(colors.placeholder.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)), "Wrong placeholder color for intent: \(intent)")
        #expect(colors.border.equals(expectedBorderColor), "Wrong border color for intent: \(intent)")
        #expect(colors.background.equals(self.theme.colors.base.surface), "Wrong background color for intent: \(intent)")
    }

    @Test("Is not focused is enabled is not read only")
    func isNotFocusedIsEnabledIsNotReadOnly() {
        let intentAndExpectedBorderColorArray: [(intent: TextInputIntent, expectedBorderColor: any ColorToken)] = [
            (intent: .success, self.theme.colors.feedback.success),
            (intent: .error, self.theme.colors.feedback.error),
            (intent: .alert, self.theme.colors.feedback.alert),
            (intent: .neutral, self.theme.colors.base.outline),
        ]
        #expect(intentAndExpectedBorderColorArray.count == TextInputIntent.allCases.count, "Wrong intentAndExpectedBorderColorArray count")

        intentAndExpectedBorderColorArray.forEach {
            self._test_isNotFocused_isEnabled_isNotReadOnly(with: $0.intent, expectedBorderColor: $0.expectedBorderColor)
        }
    }

    private func _test_isNotFocused_isEnabled_isNotReadOnly(
        with intent: TextInputIntent,
        expectedBorderColor: any ColorToken
    ) {
        // GIVEN
        let isFocused = false
        let isEnabled = true
        let isReadOnly = false
        let useCase = TextInputGetColorsUseCase()

        // WHEN
        let colors = useCase.execute(
            theme: self.theme,
            intent: intent,
            isFocused: isFocused,
            isEnabled: isEnabled,
            isReadOnly: isReadOnly
        )

        // THEN
        #expect(colors.text.equals(self.theme.colors.base.onSurface), "Wrong text color for intent: \(intent)")
        #expect(colors.placeholder.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)), "Wrong placeholder color for intent: \(intent)")
        #expect(colors.border.equals(expectedBorderColor), "Wrong border color for intent: \(intent)")
        #expect(colors.background.equals(self.theme.colors.base.surface), "Wrong background color for intent: \(intent)")
    }

    @Test("Is not focused is enabled is read only")
    func isNotFocusedIsEnabledIsReadOnly() {
        let intentAndExpectedBorderColorArray: [(intent: TextInputIntent, expectedBorderColor: any ColorToken)] = [
            (intent: .success, self.theme.colors.base.outline),
            (intent: .error, self.theme.colors.base.outline),
            (intent: .alert, self.theme.colors.base.outline),
            (intent: .neutral, self.theme.colors.base.outline),
        ]
        #expect(intentAndExpectedBorderColorArray.count == TextInputIntent.allCases.count, "Wrong intentAndExpectedBorderColorArray count")

        intentAndExpectedBorderColorArray.forEach {
            self._test_isNotFocused_isEnabled_isReadOnly(with: $0.intent, expectedBorderColor: $0.expectedBorderColor)
        }
    }

    private func _test_isNotFocused_isEnabled_isReadOnly(
        with intent: TextInputIntent,
        expectedBorderColor: any ColorToken
    ) {
        // GIVEN
        let isFocused = false
        let isEnabled = true
        let isReadOnly = true
        let useCase = TextInputGetColorsUseCase()

        // WHEN
        let colors = useCase.execute(
            theme: self.theme,
            intent: intent,
            isFocused: isFocused,
            isEnabled: isEnabled,
            isReadOnly: isReadOnly
        )

        // THEN
        #expect(colors.text.equals(self.theme.colors.base.onSurface), "Wrong text color for intent: \(intent)")
        #expect(colors.placeholder.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)), "Wrong placeholder color for intent: \(intent)")
        #expect(colors.border.equals(expectedBorderColor), "Wrong border color for intent: \(intent)")
        #expect(colors.background.equals(self.theme.colors.base.onSurface.opacity(theme.dims.dim5)), "Wrong background color for intent: \(intent)")
    }

    @Test("Is focused is not enabled is not read only")
    func isFocusedIsNotEnabledIsNotReadOnly() {
        let intentAndExpectedBorderColorArray: [(intent: TextInputIntent, expectedBorderColor: any ColorToken)] = [
            (intent: .success, self.theme.colors.base.outline),
            (intent: .error, self.theme.colors.base.outline),
            (intent: .alert, self.theme.colors.base.outline),
            (intent: .neutral, self.theme.colors.base.outline),
        ]
        #expect(intentAndExpectedBorderColorArray.count == TextInputIntent.allCases.count, "Wrong intentAndExpectedBorderColorArray count")

        intentAndExpectedBorderColorArray.forEach {
            self._test_isFocused_isNotEnabled_isNotReadOnly(with: $0.intent, expectedBorderColor: $0.expectedBorderColor)
        }
    }

    private func _test_isFocused_isNotEnabled_isNotReadOnly(
        with intent: TextInputIntent,
        expectedBorderColor: any ColorToken
    ) {
        // GIVEN
        let isFocused = true
        let isEnabled = false
        let isReadOnly = false
        let useCase = TextInputGetColorsUseCase()

        // WHEN
        let colors = useCase.execute(
            theme: self.theme,
            intent: intent,
            isFocused: isFocused,
            isEnabled: isEnabled,
            isReadOnly: isReadOnly
        )

        // THEN
        #expect(colors.text.equals(self.theme.colors.base.onSurface), "Wrong text color for intent: \(intent)")
        #expect(colors.placeholder.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)), "Wrong placeholder color for intent: \(intent)")
        #expect(colors.border.equals(expectedBorderColor), "Wrong border color for intent: \(intent)")
        #expect(colors.background.equals(self.theme.colors.base.onSurface.opacity(theme.dims.dim5)), "Wrong background color for intent: \(intent)")
    }
}
