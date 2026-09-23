//
//  SpinnerViewModelDeprecatedTests.swift
//  SparkComponentSpinnerTests
//
//  Created by michael.zimmermann on 11.07.23.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Combine
@testable import SparkComponentSpinner
@_spi(SI_SPI) @testable import SparkComponentSpinnerTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkThemingTesting
import XCTest
import SwiftUI

final class SpinnerViewModelDeprecatedTests: XCTestCase {

    // MARK: - Private properties
    private var useCase: SpinnerGetIntentColorUseCasableGeneratedMock!
    private var subscriptions = Set<AnyCancellable>()

    // MARK: - Setup
    override func setUp() {
        super.setUp()

        self.useCase = SpinnerGetIntentColorUseCasableGeneratedMock()
        let colorToken = ColorTokenGeneratedMock.mock(Color.red)
        self.useCase.executeWithColorsAndIntentReturnValue = colorToken
    }

    // MARK: - Tests
    func test_variables_published_on_init() {
        let sut = sut(intent: .main, spinnerSize: .small)
        let expect = expectation(description: "All publishers should have published")

        Publishers.Zip(sut.$intentColor, sut.$size).subscribe(in: &self.subscriptions) { colorToken, size in

            XCTAssertEqual(colorToken.color, Color.red)
            XCTAssertEqual(size, SpinnerViewModelDeprecated.Constants.Size.small)
            expect.fulfill()
        }

        wait(for: [expect], timeout: 0.1)
    }

    func test_non_published_variables_on_init() {
        let sut = sut(intent: .error, spinnerSize: .medium)

        XCTAssertEqual(sut.size, SpinnerViewModelDeprecated.Constants.Size.medium, "Expected size to be \(SpinnerViewModelDeprecated.Constants.Size.medium)")
        XCTAssertEqual(sut.intentColor.color, Color.red, "Expected intent.color to be red")
        XCTAssertEqual(sut.duration, SpinnerViewModelDeprecated.Constants.duration, "Expected duration to be \(SpinnerViewModelDeprecated.Constants.duration)")
        XCTAssertEqual(sut.strokeWidth, SpinnerViewModelDeprecated.Constants.stroke, "Expected strokeWidth to be \(SpinnerViewModelDeprecated.Constants.stroke)")
    }

    func test_colors_republished_on_theme_update() {
        let sut = sut(intent: .main, spinnerSize: .small)
        let expect = expectation(description: "All publisher should have published")
        expect.expectedFulfillmentCount = 2

        sut.$intentColor.subscribe(in: &self.subscriptions) { colorToken in
            XCTAssertEqual(colorToken.color, Color.red)
            expect.fulfill()
        }

        sut.theme = ThemeGeneratedMock.mocked()

        wait(for: [expect], timeout: 0.1)
    }

    func test_size_republished_on_size_update() {
        let sut = sut(intent: .main, spinnerSize: .small)
        let expect = expectation(description: "All publisher should have published")
        expect.expectedFulfillmentCount = 2

        var expectedSize = 20.0
        sut.$size.subscribe(in: &self.subscriptions) { size in
            XCTAssertEqual(size, expectedSize)
            expectedSize = 28
            expect.fulfill()
        }

        sut.spinnerSize = .medium

        wait(for: [expect], timeout: 0.1)
    }

    // MARK: - Private helper function
    private func sut(intent: SpinnerIntent, spinnerSize: SpinnerSize) -> SpinnerViewModelDeprecated {
        return .init(theme: ThemeGeneratedMock.mocked(),
                     intent: intent,
                     spinnerSize: spinnerSize,
                     useCase: self.useCase
        )
    }
}
