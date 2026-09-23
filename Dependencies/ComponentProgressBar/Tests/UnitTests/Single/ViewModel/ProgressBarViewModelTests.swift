//
//  ProgressBarViewModelTests.swift
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

final class ProgressBarViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertNil(stub.viewModel.theme)
        XCTAssertNil(stub.viewModel.intent)
        XCTAssertNil(stub.viewModel.shape)

        XCTAssertEqualToExpected(
            on: stub,
            otherColors: ProgressBarColors(),
            otherCornerRadius: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true
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

        ProgressBarGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        ProgressBarGetCornerRadiusUseCaseableMockTest.XCTAssert(
            stub.getCornerRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenShape: stub.givenShape,
            expectedReturnValue: stub.expectedCornerRadius
        )

        XCTAssertNotCalled(
            on: stub
        )
    }

    // MARK: - Property Changes

    func test_themeChanged_shouldUpdateColorsAndCornerRadiusOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = newTheme

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ProgressBarGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        ProgressBarGetCornerRadiusUseCaseableMockTest.XCTAssert(
            stub.getCornerRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenShape: stub.givenShape,
            expectedReturnValue: stub.expectedCornerRadius
        )

        XCTAssertNotCalled(
            on: stub
        )
    }

    func test_intentChanged_shouldUpdateColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = ProgressBarIntent.danger

        // WHEN
        viewModel.intent = newIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ProgressBarGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getCornerRadiusUseCase: true
        )
    }

    func test_shapeChanged_shouldUpdateCornerRadiusOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newShape = ProgressBarShape.square

        // WHEN
        viewModel.shape = newShape

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ProgressBarGetCornerRadiusUseCaseableMockTest.XCTAssert(
            stub.getCornerRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenShape: newShape,
            expectedReturnValue: stub.expectedCornerRadius
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true
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

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherColors: ProgressBarColors(),
            otherCornerRadius: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true
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

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true
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

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: ProgressBarIntent = .support
    let givenShape: ProgressBarShape = .rounded

    // MARK: - Expected

    let expectedColors = ProgressBarColors()
    let expectedCornerRadius: CGFloat = 16.0
    let expectedIsValidValue = true

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: ProgressBarGetColorsUseCaseableGeneratedMock
    let getCornerRadiusUseCaseMock: ProgressBarGetCornerRadiusUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: ProgressBarViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = ProgressBarGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedColors

        let getCornerRadiusUseCaseMock = ProgressBarGetCornerRadiusUseCaseableGeneratedMock()
        getCornerRadiusUseCaseMock.executeWithThemeAndShapeReturnValue = self.expectedCornerRadius

        self.viewModel = ProgressBarViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getCornerRadiusUseCase: getCornerRadiusUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getCornerRadiusUseCaseMock = getCornerRadiusUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getCornerRadiusUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension ProgressBarViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            shape: stub.givenShape
        )
    }
}

private func XCTAssertNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getCornerRadiusUseCase: Bool = false
) {
    ProgressBarGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorsUseCase
    )

    ProgressBarGetCornerRadiusUseCaseableMockTest.XCTCalled(
        stub.getCornerRadiusUseCaseMock,
        executeWithThemeAndShapeCalled: !getCornerRadiusUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherColors: ProgressBarColors? = nil,
    otherCornerRadius: CGFloat? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertTrue(
        viewModel.colors == (otherColors ?? stub.expectedColors),
        "Wrong colors value"
    )
    XCTAssertEqual(
        viewModel.cornerRadius,
        otherCornerRadius ?? stub.expectedCornerRadius,
        "Wrong cornerRadius value"
    )
}
