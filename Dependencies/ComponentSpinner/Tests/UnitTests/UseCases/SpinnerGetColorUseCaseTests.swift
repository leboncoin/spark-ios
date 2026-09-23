//
//  SpinnerGetColorUseCaseTests.swift
//  SparkComponentSpinnerTests
//
//  Created by Claude on 10.12.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
@_spi(SI_SPI) import SparkThemingTesting
import XCTest

final class SpinnerGetColorUseCaseTests: XCTestCase {

    // MARK: - Private properties

    private var sut: SpinnerGetColorUseCase!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.sut = SpinnerGetColorUseCase()
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_main() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .main)

        // THEN
        XCTAssertEqual(result.color, self.theme.colors.main.main.color)
    }

    func test_execute_support() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .support)

        // THEN
        XCTAssertEqual(result.color, self.theme.colors.support.support.color)
    }

    func test_execute_alert() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .alert)

        // THEN
        XCTAssertEqual(result.color, self.theme.colors.feedback.alert.color)
    }

    func test_execute_error() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .error)

        // THEN
        XCTAssertEqual(result.color, self.theme.colors.feedback.error.color)
    }

    func test_execute_info() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .info)

        // THEN
        XCTAssertEqual(result.color, self.theme.colors.feedback.info.color)
    }

    func test_execute_neutral() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .neutral)

        // THEN
        XCTAssertEqual(result.color, self.theme.colors.feedback.neutral.color)
    }

    func test_execute_success() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .success)

        // THEN
        XCTAssertEqual(result.color, self.theme.colors.feedback.success.color)
    }

    func test_execute_accent() {
        // GIVEN / WHEN
        let result = self.sut.execute(theme: self.theme, intent: .accent)

        // THEN
        XCTAssertEqual(result.color, self.theme.colors.accent.accent.color)
    }

    func test_execute_custom() {
        // GIVEN
        let customColorToken = ColorTokenGeneratedMock.blue()

        // WHEN
        let result = self.sut.execute(theme: self.theme, intent: .custom(customColorToken))

        // THEN
        XCTAssertEqual(result.color, customColorToken.color)
    }
}
