//
//  IconViewModelTests.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import UIKit

@testable import SparkComponentIcon
@_spi(SI_SPI) @testable import SparkComponentIconTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

final class IconViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherTintColorToken: ColorTokenClear(),
            otherContentSize: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getSizeUseCase: true,
            getTintColorUseCase: true
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

        IconGetSizeUseCaseableMockTest.XCTAssert(
            stub.getSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedContentSize
        )

        IconGetTintColorUseCaseableMockTest.XCTAssert(
            stub.getTintColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedTintColorToken
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

        IconGetTintColorUseCaseableMockTest.XCTAssert(
            stub.getTintColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedTintColorToken
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

        let newIntent = IconIntent.error

        // WHEN
        viewModel.intent = newIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        IconGetTintColorUseCaseableMockTest.XCTAssert(
            stub.getTintColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedTintColorToken
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

        let newSize = IconSize.large

        // WHEN
        viewModel.size = newSize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        IconGetSizeUseCaseableMockTest.XCTAssert(
            stub.getSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            expectedReturnValue: stub.expectedContentSize
        )

        XCTAssertNotCalled(
            on: stub,
            getTintColorUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .error
        viewModel.size = .large

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherTintColorToken: ColorTokenClear(),
            otherContentSize: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getSizeUseCase: true,
            getTintColorUseCase: true
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
            getTintColorUseCase: true
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
            getTintColorUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: IconIntent = .support
    let givenSize: IconSize = .medium

    // MARK: - Expected

    let expectedTintColorToken = ColorTokenGeneratedMock.red()
    let expectedContentSize: CGFloat = 24.0

    // MARK: - Use Case Mocks

    let getSizeUseCaseMock: IconGetSizeUseCaseableGeneratedMock
    let getTintColorUseCaseMock: IconGetTintColorUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: IconViewModel

    // MARK: - Initialization

    init() {
        let getSizeUseCaseMock = IconGetSizeUseCaseableGeneratedMock()
        getSizeUseCaseMock.executeWithSizeReturnValue = self.expectedContentSize

        let getTintColorUseCaseMock = IconGetTintColorUseCaseableGeneratedMock()
        getTintColorUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedTintColorToken

        self.viewModel = IconViewModel(
            getSizeUseCase: getSizeUseCaseMock,
            getTintColorUseCase: getTintColorUseCaseMock
        )

        self.getSizeUseCaseMock = getSizeUseCaseMock
        self.getTintColorUseCaseMock = getTintColorUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getSizeUseCaseMock.reset()
        self.getTintColorUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension IconViewModel {

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
    getTintColorUseCase: Bool = false
) {
    IconGetSizeUseCaseableMockTest.XCTCalled(
        stub.getSizeUseCaseMock,
        executeWithSizeCalled: !getSizeUseCase
    )

    IconGetTintColorUseCaseableMockTest.XCTCalled(
        stub.getTintColorUseCaseMock,
        executeWithThemeAndIntentCalled: !getTintColorUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherTintColorToken: (any ColorToken)? = nil,
    otherContentSize: CGFloat? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertTrue(
        viewModel.tintColorToken.equals(otherTintColorToken ?? stub.expectedTintColorToken),
        "Wrong tintColorToken value"
    )
    XCTAssertEqual(
        viewModel.contentSize,
        otherContentSize ?? stub.expectedContentSize,
        "Wrong contentSize value"
    )
}
