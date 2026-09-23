//
//  RatingInputViewModelTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentRating
@_spi(SI_SPI) @testable import SparkComponentRatingTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

final class RatingInputViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertNil(stub.viewModel.theme)
        XCTAssertNil(stub.viewModel.isEnabled)

        XCTAssertEqualToExpected(
            on: stub,
            otherDim: 0,
            otherSpacing: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getDimUseCase: true,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
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

        RatingInputGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        RatingInputGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        XCTAssertNotCalled(
            on: stub,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true
        )
    }

    // MARK: - Property Changes

    func test_themeChanged_shouldUpdateColorsAndDimAndSpacing() {
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

        RatingInputGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        RatingInputGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        XCTAssertNotCalled(
            on: stub,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true
        )
    }

    func test_isEnabledChanged_shouldUpdateDimOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsEnabled = !stub.givenIsEnabled

        // WHEN
        viewModel.isEnabled = newIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        RatingInputGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: newIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        XCTAssertNotCalled(
            on: stub,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.isEnabled = !stub.givenIsEnabled

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherDim: 0,
            otherSpacing: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getDimUseCase: true,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
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
        viewModel.isEnabled = stub.givenIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getDimUseCase: true,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
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
        viewModel.isEnabled = nil

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getDimUseCase: true,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }

    // MARK: - GetNewValue

    func test_getNewValue_shouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let givenRatio: CGFloat = 0.5

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        let result = viewModel.getNewValue(from: givenRatio)

        // THEN
        XCTAssertEqual(result, stub.expectedNewValue)

        RatingInputGetNewValueUseCaseableMockTest.XCTAssert(
            stub.getNewValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenRatio: givenRatio,
            expectedReturnValue: stub.expectedNewValue
        )

        XCTAssertNotCalled(
            on: stub,
            getDimUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }

    func test_getIncrementValue_shouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let givenValue: Double = 2.4

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        let result = viewModel.getIncrementedValue(from: givenValue)

        // THEN
        XCTAssertEqual(result, stub.expectedIncrementedValue)

        RatingInputGetNewValueUseCaseableMockTest.XCTAssert(
            stub.getNewValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValueToIncrement: givenValue,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedIncrementedValue
        )

        XCTAssertNotCalled(
            on: stub,
            getDimUseCase: true,
            getNewValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }

    func test_getDecrementValue_shouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let givenValue: Double = 4.4

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        let result = viewModel.getDecrementedValue(from: givenValue)

        // THEN
        XCTAssertEqual(result, stub.expectedDecrementedValue)

        RatingInputGetNewValueUseCaseableMockTest.XCTAssert(
            stub.getNewValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValueToDecrement: givenValue,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDecrementedValue
        )

        XCTAssertNotCalled(
            on: stub,
            getDimUseCase: true,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIsEnabled: Bool = true
    let givenIsPressed: Bool = false

    // MARK: - Expected

    let expectedDim: CGFloat = 0.0
    let expectedSpacing: CGFloat = 12.0

    let expectedNewValue: Double = 2.5
    let expectedIncrementedValue: Double = 4.1
    let expectedDecrementedValue: Double = 1.5

    // MARK: - Use Case Mocks

    let getDimUseCaseMock: RatingInputGetDimUseCaseableGeneratedMock
    let getNewValueUseCaseMock: RatingInputGetNewValueUseCaseableGeneratedMock
    let getSpacingUseCaseMock: RatingInputGetSpacingUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: RatingInputViewModel

    // MARK: - Initialization

    init() {
        let getDimUseCaseMock = RatingInputGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getNewValueUseCaseMock = RatingInputGetNewValueUseCaseableGeneratedMock()
        getNewValueUseCaseMock.executeWithRatioReturnValue = self.expectedNewValue
        getNewValueUseCaseMock.executeIncrementWithValueToIncrementAndIsEnabledReturnValue = self.expectedIncrementedValue
        getNewValueUseCaseMock.executeDecrementWithValueToDecrementAndIsEnabledReturnValue = self.expectedDecrementedValue

        let getSpacingUseCaseMock = RatingInputGetSpacingUseCaseableGeneratedMock()
        getSpacingUseCaseMock.executeWithThemeReturnValue = self.expectedSpacing

        self.viewModel = RatingInputViewModel(
            getDimUseCase: getDimUseCaseMock,
            getNewValueUseCase: getNewValueUseCaseMock,
            getSpacingUseCase: getSpacingUseCaseMock
        )

        self.getDimUseCaseMock = getDimUseCaseMock
        self.getNewValueUseCaseMock = getNewValueUseCaseMock
        self.getSpacingUseCaseMock = getSpacingUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getDimUseCaseMock.reset()
        self.getNewValueUseCaseMock.reset()
        self.getSpacingUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension RatingInputViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            isEnabled: stub.givenIsEnabled
        )
    }
}

private func XCTAssertNotCalled(
    on stub: Stub,
    getDimUseCase: Bool = false,
    getNewValueUseCase: Bool = false,
    getIncrementValueUseCase: Bool = false,
    getDecrementValueUseCase: Bool = false,
    getSpacingUseCase: Bool = false
) {
    RatingInputGetDimUseCaseableMockTest.XCTCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase
    )

    RatingInputGetNewValueUseCaseableMockTest.XCTCalled(
        stub.getNewValueUseCaseMock,
        executeWithRatioCalled: !getNewValueUseCase
    )

    RatingInputGetNewValueUseCaseableMockTest.XCTCalled(
        stub.getNewValueUseCaseMock,
        executeIncrementWithValueToIncrementAndIsEnabledCalled: !getIncrementValueUseCase
    )

    RatingInputGetNewValueUseCaseableMockTest.XCTCalled(
        stub.getNewValueUseCaseMock,
        executeDecrementWithValueToDecrementAndIsEnabledCalled: !getDecrementValueUseCase
    )

    RatingInputGetSpacingUseCaseableMockTest.XCTCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherDim: CGFloat? = nil,
    otherSpacing: CGFloat? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.dim,
        otherDim ?? stub.expectedDim,
        "Wrong dim value"
    )
    XCTAssertEqual(
        viewModel.spacing,
        otherSpacing ?? stub.expectedSpacing,
        "Wrong spacing value"
    )
}
