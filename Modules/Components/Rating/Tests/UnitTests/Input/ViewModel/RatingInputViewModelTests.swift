//
//  RatingInputViewModelTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
import SwiftUI
@testable import SparkComponentRating
@_spi(SI_SPI) @testable import SparkComponentRatingTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

@MainActor
@Suite("Rating Input ViewModel Tests")
struct RatingInputViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        #expect(stub.viewModel.theme == nil)
        #expect(stub.viewModel.isEnabled == nil)

        expectEqualToExpected(
            on: stub,
            otherDim: 0,
            otherSpacing: 0
        )

        expectNotCalled(
            on: stub,
            getDimUseCase: true,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }

    // MARK: - Setup

    @Test("Setup should call all use cases")
    func setupShouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        RatingInputGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        RatingInputGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        expectNotCalled(
            on: stub,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update colors and dim and spacing")
    func themeChangedShouldUpdateColorsAndDimAndSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = newTheme

        // THEN
        expectEqualToExpected(on: stub)

        RatingInputGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        RatingInputGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        expectNotCalled(
            on: stub,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true
        )
    }

    @Test("Is enabled changed should update dim only")
    func isEnabledChangedShouldUpdateDimOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsEnabled = !stub.givenIsEnabled

        // WHEN
        viewModel.isEnabled = newIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        RatingInputGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: newIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        expectNotCalled(
            on: stub,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.isEnabled = !stub.givenIsEnabled

        // THEN
        expectEqualToExpected(
            on: stub,
            otherDim: 0,
            otherSpacing: 0
        )

        expectNotCalled(
            on: stub,
            getDimUseCase: true,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }

    @Test("Properties changed without value change should not call use cases")
    func propertiesChangedWithoutValueChangeShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.isEnabled = stub.givenIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getDimUseCase: true,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }

    @Test("Properties changed with nil values should not call use cases")
    func propertiesChangedWithNilValuesShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = nil
        viewModel.isEnabled = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getDimUseCase: true,
            getNewValueUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }

    // MARK: - GetNewValue

    @Test("Get new value should call use case")
    func getNewValueShouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let givenRatio: CGFloat = 0.5

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        let result = viewModel.getNewValue(from: givenRatio)

        // THEN
        #expect(result == stub.expectedNewValue)

        RatingInputGetNewValueUseCaseableMockTest.expect(
            stub.getNewValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenRatio: givenRatio,
            expectedReturnValue: stub.expectedNewValue
        )

        expectNotCalled(
            on: stub,
            getDimUseCase: true,
            getIncrementValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }

    @Test("Get increment value should call use case")
    func getIncrementValueShouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let givenValue: Double = 2.4

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        let result = viewModel.getIncrementedValue(from: givenValue)

        // THEN
        #expect(result == stub.expectedIncrementedValue)

        RatingInputGetNewValueUseCaseableMockTest.expect(
            stub.getNewValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValueToIncrement: givenValue,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedIncrementedValue
        )

        expectNotCalled(
            on: stub,
            getDimUseCase: true,
            getNewValueUseCase: true,
            getDecrementValueUseCase: true,
            getSpacingUseCase: true
        )
    }

    @Test("Get decrement value should call use case")
    func getDecrementValueShouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let givenValue: Double = 4.4

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        let result = viewModel.getDecrementedValue(from: givenValue)

        // THEN
        #expect(result == stub.expectedDecrementedValue)

        RatingInputGetNewValueUseCaseableMockTest.expect(
            stub.getNewValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValueToDecrement: givenValue,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDecrementedValue
        )

        expectNotCalled(
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

private func expectNotCalled(
    on stub: Stub,
    getDimUseCase: Bool = false,
    getNewValueUseCase: Bool = false,
    getIncrementValueUseCase: Bool = false,
    getDecrementValueUseCase: Bool = false,
    getSpacingUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    RatingInputGetDimUseCaseableMockTest.expectCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase,
        sourceLocation: sourceLocation
    )

    RatingInputGetNewValueUseCaseableMockTest.expectCalled(
        stub.getNewValueUseCaseMock,
        executeWithRatioCalled: !getNewValueUseCase,
        sourceLocation: sourceLocation
    )

    RatingInputGetNewValueUseCaseableMockTest.expectCalled(
        stub.getNewValueUseCaseMock,
        executeIncrementWithValueToIncrementAndIsEnabledCalled: !getIncrementValueUseCase,
        sourceLocation: sourceLocation
    )

    RatingInputGetNewValueUseCaseableMockTest.expectCalled(
        stub.getNewValueUseCaseMock,
        executeDecrementWithValueToDecrementAndIsEnabledCalled: !getDecrementValueUseCase,
        sourceLocation: sourceLocation
    )

    RatingInputGetSpacingUseCaseableMockTest.expectCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherDim: CGFloat? = nil,
    otherSpacing: CGFloat? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.dim == otherDim ?? stub.expectedDim,
        "Wrong dim value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.spacing == otherSpacing ?? stub.expectedSpacing,
        "Wrong spacing value",
        sourceLocation: sourceLocation
    )
}
