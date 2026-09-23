//
//  SpinnerGetIntentColorUseCaseDeprecatedTests.swift
//  SparkComponentSpinnerTests
//
//  Created by michael.zimmermann on 11.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentSpinner
@_spi(SI_SPI) import SparkThemingTesting
import XCTest

final class SpinnerGetIntentColorUseCaseDeprecatedTests: XCTestCase {

    // MARK: - Private properties
    private var sut: SpinnerGetIntentColorUseCaseDeprecated!
    private var colors: ColorsGeneratedMock!

    // MARK: - Setup
    override func setUp() {
        super.setUp()
        self.sut = SpinnerGetIntentColorUseCaseDeprecated()
        self.colors = ColorsGeneratedMock.mocked()
    }

    // MARK: - Tests
    func test_execute_main() {
        XCTAssertEqual(self.sut.execute(colors: self.colors, intent: .main).color, self.colors.main.main.color)
    }

    func test_execute_alert() {
        XCTAssertEqual(self.sut.execute(colors: self.colors, intent: .alert).color, self.colors.feedback.alert.color)
    }

    func test_execute_error() {
        XCTAssertEqual(self.sut.execute(colors: self.colors, intent: .error).color, self.colors.feedback.error.color)
    }

    func test_execute_info() {
        XCTAssertEqual(self.sut.execute(colors: self.colors, intent: .info).color, self.colors.feedback.info.color)
    }

    func test_execute_neutral() {
        XCTAssertEqual(self.sut.execute(colors: self.colors, intent: .neutral).color, self.colors.feedback.neutral.color)
    }

    func test_execute_success() {
        XCTAssertEqual(self.sut.execute(colors: self.colors, intent: .success).color, self.colors.feedback.success.color)
    }

    func test_execute_accent() {
        XCTAssertEqual(self.sut.execute(colors: self.colors, intent: .accent).color, self.colors.accent.accent.color)
    }

    func test_execute_support() {
        XCTAssertEqual(self.sut.execute(colors: self.colors, intent: .support).color, self.colors.support.support.color)
    }
}