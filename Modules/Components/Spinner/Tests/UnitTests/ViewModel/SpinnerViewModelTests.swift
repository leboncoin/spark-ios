//
//  SpinnerViewModelTests.swift
//  SparkComponentSpinnerTests
//
//  Created by robin.lemaire on 10/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import UIKit

@testable import SparkComponentSpinner
@_spi(SI_SPI) @testable import SparkComponentSpinnerTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting

final class SpinnerViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        XCTAssertNil(viewModel.theme)
        XCTAssertNil(viewModel.intent)
        XCTAssertNil(viewModel.size)

        XCTAssertEqualToExpected(
            on: stub,
            othercolorToken: ColorTokenClear(),
            otherContentSize: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getSizeUseCase: true,
            getColorUseCase: true
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

        SpinnerGetSizeUseCaseableMockTest.XCTAssert(
            stub.getSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedContentSize
        )

        SpinnerGetColorUseCaseableMockTest.XCTAssert(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedcolorToken
        )
    }

    // MARK: - Property Changes

    func test_themeChanged_shouldUpdateTintColorOnly() {
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

        SpinnerGetColorUseCaseableMockTest.XCTAssert(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedcolorToken
        )

        XCTAssertNotCalled(
            on: stub,
            getSizeUseCase: true
        )
    }

    func test_intentChanged_shouldUpdateTintColorOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = SpinnerIntent.error

        // WHEN
        viewModel.intent = newIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        SpinnerGetColorUseCaseableMockTest.XCTAssert(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedcolorToken
        )

        XCTAssertNotCalled(
            on: stub,
            getSizeUseCase: true
        )
    }

    func test_sizeChanged_shouldUpdateContentSizeOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize = SpinnerSize.small

        // WHEN
        viewModel.size = newSize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        SpinnerGetSizeUseCaseableMockTest.XCTAssert(
            stub.getSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            expectedReturnValue: stub.expectedContentSize
        )

        XCTAssertNotCalled(
            on: stub,
            getColorUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = stub.givenIntent.otherRandom(theme: stub.givenTheme)
        viewModel.size = stub.givenSize.otherRandom

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            othercolorToken: ColorTokenClear(),
            otherContentSize: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getSizeUseCase: true,
            getColorUseCase: true
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
        viewModel.size = stub.givenSize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getSizeUseCase: true,
            getColorUseCase: true
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
        viewModel.size = nil

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getSizeUseCase: true,
            getColorUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: SpinnerIntent = .support
    let givenSize: SpinnerSize = .medium

    // MARK: - Expected

    let expectedcolorToken = ColorTokenGeneratedMock.red()
    let expectedContentSize: CGFloat = 24.0

    // MARK: - Use Case Mocks

    let getSizeUseCaseMock: SpinnerGetSizeUseCaseableMock
    let getColorUseCaseMock: SpinnerGetColorUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: SpinnerViewModel

    // MARK: - Initialization

    init() {
        let getSizeUseCaseMock = SpinnerGetSizeUseCaseableMock()
        getSizeUseCaseMock.executeWithSizeReturnValue = self.expectedContentSize

        let getColorUseCaseMock = SpinnerGetColorUseCaseableGeneratedMock()
        getColorUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedcolorToken

        self.viewModel = SpinnerViewModel(
            getSizeUseCase: getSizeUseCaseMock,
            getColorUseCase: getColorUseCaseMock
        )

        self.getSizeUseCaseMock = getSizeUseCaseMock
        self.getColorUseCaseMock = getColorUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getSizeUseCaseMock.reset()
        self.getColorUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension SpinnerViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            size: stub.givenSize
        )
    }
}

private func XCTAssertNotCalled(
    on stub: Stub,
    getSizeUseCase: Bool = false,
    getColorUseCase: Bool = false
) {
    SpinnerGetSizeUseCaseableMockTest.XCTCalled(
        stub.getSizeUseCaseMock,
        executeWithSizeCalled: !getSizeUseCase
    )

    SpinnerGetColorUseCaseableMockTest.XCTCalled(
        stub.getColorUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    othercolorToken: (any ColorToken)? = nil,
    otherContentSize: CGFloat? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertTrue(
        viewModel.colorToken.equals(othercolorToken ?? stub.expectedcolorToken),
        "Wrong colorToken value"
    )
    XCTAssertEqual(
        viewModel.contentSize,
        otherContentSize ?? stub.expectedContentSize,
        "Wrong contentSize value"
    )
}

// MARK: - SpinnerGetSizeUseCaseable Mock

private final class SpinnerGetSizeUseCaseableMock: SpinnerGetSizeUseCaseable {

    // MARK: - Properties

    private(set) var executeWithSizeCallsCount = 0
    var executeWithSizeCalled: Bool {
        return self.executeWithSizeCallsCount > 0
    }
    private(set) var executeWithSizeReceivedSize: SpinnerSize?
    var executeWithSizeReturnValue: CGFloat = 0

    // MARK: - Execute

    func execute(size: SpinnerSize) -> CGFloat {
        self.executeWithSizeCallsCount += 1
        self.executeWithSizeReceivedSize = size
        return self.executeWithSizeReturnValue
    }

    // MARK: - Reset

    func reset() {
        self.executeWithSizeCallsCount = 0
        self.executeWithSizeReceivedSize = nil
    }
}

private enum SpinnerGetSizeUseCaseableMockTest {

    static func XCTCalled(
        _ mock: SpinnerGetSizeUseCaseableMock,
        executeWithSizeCalled isCalled: Bool
    ) {
        XCTAssertEqual(
            mock.executeWithSizeCalled,
            isCalled,
            "Wrong execute(size: SpinnerSize) isCalled on SpinnerGetSizeUseCaseable"
        )
    }

    static func XCTAssert(
        _ mock: SpinnerGetSizeUseCaseableMock,
        expectedNumberOfCalls: Int,
        givenSize: SpinnerSize? = nil,
        expectedReturnValue: CGFloat
    ) {
        XCTAssertEqual(
            mock.executeWithSizeCallsCount,
            expectedNumberOfCalls,
            "Wrong execute(size: SpinnerSize) number of called on SpinnerGetSizeUseCaseable"
        )

        if expectedNumberOfCalls > 0 {
            if let givenSize {
                XCTAssertEqual(
                    mock.executeWithSizeReceivedSize,
                    givenSize,
                    "Wrong execute(size: SpinnerSize) size parameter on SpinnerGetSizeUseCaseable"
                )
            } else {
                XCTAssertNil(
                    mock.executeWithSizeReceivedSize,
                    "Wrong execute(size: SpinnerSize) size parameter value on SpinnerGetSizeUseCaseable. Should be nil"
                )
            }
        }

        XCTAssertEqual(
            mock.executeWithSizeReturnValue,
            expectedReturnValue,
            "Wrong execute(size: SpinnerSize) return value on SpinnerGetSizeUseCaseable"
        )
    }
}

// MARK: - Extension

private extension SpinnerIntent {

    func otherRandom(theme: any Theme) -> Self {
        SpinnerTestingIntent(intent: self).otherRandom.toIntent(theme)
    }
}
