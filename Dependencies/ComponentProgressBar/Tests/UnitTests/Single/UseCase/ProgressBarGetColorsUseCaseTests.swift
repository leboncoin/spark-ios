//
//  ProgressBarGetColorsUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentProgressBar
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ProgressBarGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    func test_execute_colors_when_intent_is_accent() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .accent,
            expectedIndicatorColorToken: self.themeMock.colors.accent.accent
        )
    }

    func test_execute_colors_when_intent_is_alert() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .alert,
            expectedIndicatorColorToken: self.themeMock.colors.feedback.alert
        )
    }

    func test_execute_colors_when_intent_is_support() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .support,
            expectedIndicatorColorToken: self.themeMock.colors.support.support
        )
    }

    func test_execute_colors_when_intent_is_danger() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .danger,
            expectedIndicatorColorToken: self.themeMock.colors.feedback.error
        )
    }

    func test_execute_colors_when_intent_is_info() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .info,
            expectedIndicatorColorToken: self.themeMock.colors.feedback.info
        )
    }

    func test_execute_colors_when_intent_is_main() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .main,
            expectedIndicatorColorToken: self.themeMock.colors.main.main
        )
    }

    func test_execute_colors_when_intent_is_neutral() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .neutral,
            expectedIndicatorColorToken: self.themeMock.colors.feedback.neutral
        )
    }

    func test_execute_colors_when_intent_is_success() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .success,
            expectedIndicatorColorToken: self.themeMock.colors.feedback.success
        )
    }
}

// MARK: - Execute Testing

private extension ProgressBarGetColorsUseCaseTests {

    func testExecute(
        givenIntent: ProgressBarIntent,
        expectedIndicatorColorToken: any ColorToken
    ) {
        // GIVEN
        let useCase = ProgressBarGetColorsUseCase()
        let expectedTrackBackgroundColorToken = self.themeMock.colors.base.onBackground.opacity(self.themeMock.dims.dim4)

        // WHEN
        let colors = useCase.execute(
            theme: self.themeMock,
            intent: givenIntent
        )

        // THEN
        XCTAssertTrue(
            colors.trackBackgroundColorToken.equals(expectedTrackBackgroundColorToken),
            "Wrong track background color token for .\(givenIntent) intent case"
        )
        XCTAssertTrue(
            colors.indicatorBackgroundColorToken.equals(expectedIndicatorColorToken),
            "Wrong indicator background color token for .\(givenIntent) intent case"
        )
    }
}
