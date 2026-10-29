//
//  ProgressBarGetColorsUseCaseTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentProgressBar
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Progress Bar Get Colors Use Case Tests")
struct ProgressBarGetColorsUseCaseTests {

    // MARK: - Properties

    private let themeMock = ThemeGeneratedMock.mocked()

    // MARK: - Tests

    @Test("Execute colors when intent is accent")
    func executeColorsWhenIntentIsAccent() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .accent,
            expectedIndicatorColorToken: self.themeMock.colors.accent.accent
        )
    }

    @Test("Execute colors when intent is alert")
    func executeColorsWhenIntentIsAlert() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .alert,
            expectedIndicatorColorToken: self.themeMock.colors.feedback.alert
        )
    }

    @Test("Execute colors when intent is support")
    func executeColorsWhenIntentIsSupport() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .support,
            expectedIndicatorColorToken: self.themeMock.colors.support.support
        )
    }

    @Test("Execute colors when intent is danger")
    func executeColorsWhenIntentIsDanger() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .danger,
            expectedIndicatorColorToken: self.themeMock.colors.feedback.error
        )
    }

    @Test("Execute colors when intent is info")
    func executeColorsWhenIntentIsInfo() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .info,
            expectedIndicatorColorToken: self.themeMock.colors.feedback.info
        )
    }

    @Test("Execute colors when intent is main")
    func executeColorsWhenIntentIsMain() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .main,
            expectedIndicatorColorToken: self.themeMock.colors.main.main
        )
    }

    @Test("Execute colors when intent is neutral")
    func executeColorsWhenIntentIsNeutral() {
        // GIVEN / WHEN / THEN
        self.testExecute(
            givenIntent: .neutral,
            expectedIndicatorColorToken: self.themeMock.colors.feedback.neutral
        )
    }

    @Test("Execute colors when intent is success")
    func executeColorsWhenIntentIsSuccess() {
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
        #expect(colors.trackBackgroundColorToken.equals(expectedTrackBackgroundColorToken), "Wrong track background color token for .\(givenIntent) intent case")
        #expect(colors.indicatorBackgroundColorToken.equals(expectedIndicatorColorToken), "Wrong indicator background color token for .\(givenIntent) intent case")
    }
}
