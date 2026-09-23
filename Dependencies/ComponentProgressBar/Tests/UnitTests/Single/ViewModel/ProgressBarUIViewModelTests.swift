//
//  ProgressBarUIViewModelTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import UIKit

@testable import SparkComponentProgressBar
@_spi(SI_SPI) @testable import SparkComponentProgressBarTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

final class ProgressBarUIViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertTrue(stub.viewModel.indicatorIsHidden)

        XCTAssertEqualToExpected(
            on: stub,
            otherIndicatorIsHidden: true
        )

        XCTAssertNotCalled(
            on: stub,
            getIsIndicatorHiddenUseCase: true
        )
    }

    // MARK: - Setup

    func test_setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ProgressBarGetIsIndicatorHiddenUseCaseableMockTest.XCTAssert(
            stub.getIsIndicatorHiddenUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: stub.givenValue,
            expectedReturnValue: stub.expectedIndicatorIsHidden
        )
    }

    // MARK: - Property Changes

    func test_valueChanged_shouldUpdateIndicatorIsHiddenOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newValue: CGFloat = 0.8

        // WHEN
        viewModel.value = newValue

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ProgressBarGetIsIndicatorHiddenUseCaseableMockTest.XCTAssert(
            stub.getIsIndicatorHiddenUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: newValue,
            expectedReturnValue: stub.expectedIndicatorIsHidden
        )

        XCTAssertNotCalled(
            on: stub
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .danger
        viewModel.shape = .square
        viewModel.value = 0.5

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherIndicatorIsHidden: true
        )

        XCTAssertNotCalled(
            on: stub,
            getIsIndicatorHiddenUseCase: true
        )
    }

    func test_propertiesChanged_withoutValueChange_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.intent = stub.givenIntent
        viewModel.shape = stub.givenShape
        viewModel.value = stub.givenValue

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getIsIndicatorHiddenUseCase: true
        )
    }

    func test_propertiesChanged_withNilValues_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = nil
        viewModel.intent = nil
        viewModel.shape = nil
        viewModel.value = nil

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getIsIndicatorHiddenUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: ProgressBarIntent = .support
    let givenShape: ProgressBarShape = .rounded
    let givenValue: CGFloat = 0.5

    // MARK: - Expected

    let expectedIndicatorIsHidden = false

    // MARK: - Use Case Mocks

    let getIsIndicatorHiddenUseCaseMock: ProgressBarGetIsIndicatorHiddenUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: ProgressBarUIViewModel

    // MARK: - Initialization

    init() {
        let getIsIndicatorHiddenUseCaseMock = ProgressBarGetIsIndicatorHiddenUseCaseableGeneratedMock()
        getIsIndicatorHiddenUseCaseMock.executeWithValueReturnValue = self.expectedIndicatorIsHidden

        self.viewModel = ProgressBarUIViewModel(
            getIsIndicatorHiddenUseCase: getIsIndicatorHiddenUseCaseMock
        )

        self.getIsIndicatorHiddenUseCaseMock = getIsIndicatorHiddenUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getIsIndicatorHiddenUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension ProgressBarUIViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            shape: stub.givenShape,
            value: stub.givenValue
        )
    }
}

private func XCTAssertNotCalled(
    on stub: Stub,
    getIsIndicatorHiddenUseCase: Bool = false
) {
    ProgressBarGetIsIndicatorHiddenUseCaseableMockTest.XCTCalled(
        stub.getIsIndicatorHiddenUseCaseMock,
        executeWithValueCalled: !getIsIndicatorHiddenUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherIndicatorIsHidden: Bool? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.indicatorIsHidden,
        otherIndicatorIsHidden ?? stub.expectedIndicatorIsHidden,
        "Wrong indicatorIsHidden value"
    )
}
