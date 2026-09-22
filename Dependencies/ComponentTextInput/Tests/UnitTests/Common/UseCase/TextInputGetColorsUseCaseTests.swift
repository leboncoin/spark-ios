//
//  TextInputGetColorsUseCaseTests.swift
//  SparkTextFieldUnitTests
//
//  Created by louis.borlee on 01/02/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class TextInputGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func test_isFocused_isEnabled_isNotReadOnly() {
        let intentAndExpectedBorderColorArray: [(intent: TextInputIntent, expectedBorderColor: any ColorToken)] = [
            (intent: .success, self.theme.colors.feedback.success),
            (intent: .error, self.theme.colors.feedback.error),
            (intent: .alert, self.theme.colors.feedback.alert),
            (intent: .neutral, self.theme.colors.base.outlineHigh),
        ]
        XCTAssertEqual(intentAndExpectedBorderColorArray.count, TextInputIntent.allCases.count, "Wrong intentAndExpectedBorderColorArray count")

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
        XCTAssertTrue(colors.text.equals(self.theme.colors.base.onSurface), "Wrong text color for intent: \(intent)")
        XCTAssertTrue(colors.placeholder.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)), "Wrong placeholder color for intent: \(intent)")
        XCTAssertTrue(colors.border.equals(expectedBorderColor), "Wrong border color for intent: \(intent)")
        XCTAssertTrue(colors.background.equals(self.theme.colors.base.surface), "Wrong background color for intent: \(intent)")
    }

    func test_isNotFocused_isEnabled_isNotReadOnly() {
        let intentAndExpectedBorderColorArray: [(intent: TextInputIntent, expectedBorderColor: any ColorToken)] = [
            (intent: .success, self.theme.colors.feedback.success),
            (intent: .error, self.theme.colors.feedback.error),
            (intent: .alert, self.theme.colors.feedback.alert),
            (intent: .neutral, self.theme.colors.base.outline),
        ]
        XCTAssertEqual(intentAndExpectedBorderColorArray.count, TextInputIntent.allCases.count, "Wrong intentAndExpectedBorderColorArray count")

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
        XCTAssertTrue(colors.text.equals(self.theme.colors.base.onSurface), "Wrong text color for intent: \(intent)")
        XCTAssertTrue(colors.placeholder.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)), "Wrong placeholder color for intent: \(intent)")
        XCTAssertTrue(colors.border.equals(expectedBorderColor), "Wrong border color for intent: \(intent)")
        XCTAssertTrue(colors.background.equals(self.theme.colors.base.surface), "Wrong background color for intent: \(intent)")
    }

    func test_isNotFocused_isEnabled_isReadOnly() {
        let intentAndExpectedBorderColorArray: [(intent: TextInputIntent, expectedBorderColor: any ColorToken)] = [
            (intent: .success, self.theme.colors.base.outline),
            (intent: .error, self.theme.colors.base.outline),
            (intent: .alert, self.theme.colors.base.outline),
            (intent: .neutral, self.theme.colors.base.outline),
        ]
        XCTAssertEqual(intentAndExpectedBorderColorArray.count, TextInputIntent.allCases.count, "Wrong intentAndExpectedBorderColorArray count")

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
        XCTAssertTrue(colors.text.equals(self.theme.colors.base.onSurface), "Wrong text color for intent: \(intent)")
        XCTAssertTrue(colors.placeholder.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)), "Wrong placeholder color for intent: \(intent)")
        XCTAssertTrue(colors.border.equals(expectedBorderColor), "Wrong border color for intent: \(intent)")
        XCTAssertTrue(colors.background.equals(self.theme.colors.base.onSurface.opacity(theme.dims.dim5)), "Wrong background color for intent: \(intent)")
    }

    func test_isFocused_isNotEnabled_isNotReadOnly() {
        let intentAndExpectedBorderColorArray: [(intent: TextInputIntent, expectedBorderColor: any ColorToken)] = [
            (intent: .success, self.theme.colors.base.outline),
            (intent: .error, self.theme.colors.base.outline),
            (intent: .alert, self.theme.colors.base.outline),
            (intent: .neutral, self.theme.colors.base.outline),
        ]
        XCTAssertEqual(intentAndExpectedBorderColorArray.count, TextInputIntent.allCases.count, "Wrong intentAndExpectedBorderColorArray count")

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
        XCTAssertTrue(colors.text.equals(self.theme.colors.base.onSurface), "Wrong text color for intent: \(intent)")
        XCTAssertTrue(colors.placeholder.equals(self.theme.colors.base.onSurface.opacity(self.theme.dims.dim1)), "Wrong placeholder color for intent: \(intent)")
        XCTAssertTrue(colors.border.equals(expectedBorderColor), "Wrong border color for intent: \(intent)")
        XCTAssertTrue(colors.background.equals(self.theme.colors.base.onSurface.opacity(theme.dims.dim5)), "Wrong background color for intent: \(intent)")
    }
}
