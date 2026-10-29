//
//  SpinnerGetColorUseCaseTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Spinner Get Color UseCase Tests")
struct SpinnerGetColorUseCaseTests {

    // MARK: - Private properties

    private let sut: SpinnerGetColorUseCase
    private let theme: ThemeGeneratedMock

    // MARK: - Setup

    init() {
        self.sut = SpinnerGetColorUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    @Test("Execute main")
    func executeMain() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .main)

        // THEN
        #expect(result.color == self.theme.colors.main.main.color)
    }

    @Test("Execute support")
    func executeSupport() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .support)

        // THEN
        #expect(result.color == self.theme.colors.support.support.color)
    }

    @Test("Execute alert")
    func executeAlert() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .alert)

        // THEN
        #expect(result.color == self.theme.colors.feedback.alert.color)
    }

    @Test("Execute error")
    func executeError() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .error)

        // THEN
        #expect(result.color == self.theme.colors.feedback.error.color)
    }

    @Test("Execute info")
    func executeInfo() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .info)

        // THEN
        #expect(result.color == self.theme.colors.feedback.info.color)
    }

    @Test("Execute neutral")
    func executeNeutral() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .neutral)

        // THEN
        #expect(result.color == self.theme.colors.feedback.neutral.color)
    }

    @Test("Execute success")
    func executeSuccess() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .success)

        // THEN
        #expect(result.color == self.theme.colors.feedback.success.color)
    }

    @Test("Execute accent")
    func executeAccent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .accent)

        // THEN
        #expect(result.color == self.theme.colors.accent.accent.color)
    }

    @Test("Execute custom")
    func executeCustom() {
        // GIVEN
        let customColorToken = ColorTokenGeneratedMock.blue()

        // WHEN
        let result = self.sut.execute(theme: self.theme, intent: .custom(customColorToken))

        // THEN
        #expect(result.color == customColorToken.color)
    }
}
