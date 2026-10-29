//
//  SpinnerViewModelTests.swift
//  SparkComponentSpinnerTests
//
//  Created by robin.lemaire on 10/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import UIKit

@testable import SparkComponentSpinner
@_spi(SI_SPI) @testable import SparkComponentSpinnerTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting

@MainActor
@Suite("Spinner ViewModel Tests")
struct SpinnerViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.intent == nil)
        #expect(viewModel.size == nil)

        expectEqualToExpected(
            on: stub,
            othercolorToken: ColorTokenClear(),
            otherContentSize: 0,
            otherIsAnimated: false
        )

        expectNotCalled(
            on: stub,
            getSizeUseCase: true,
            getColorUseCase: true
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

        SpinnerGetSizeUseCaseableMockTest.expect(
            stub.getSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedContentSize
        )

        SpinnerGetColorUseCaseableMockTest.expect(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedcolorToken
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update tint color only")
    func themeChangedShouldUpdateTintColorOnly() {
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

        SpinnerGetColorUseCaseableMockTest.expect(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedcolorToken
        )

        expectNotCalled(
            on: stub,
            getSizeUseCase: true
        )
    }

    @Test("Intent changed should update tint color only")
    func intentChangedShouldUpdateTintColorOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = SpinnerIntent.error

        // WHEN
        viewModel.intent = newIntent

        // THEN
        expectEqualToExpected(on: stub)

        SpinnerGetColorUseCaseableMockTest.expect(
            stub.getColorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedcolorToken
        )

        expectNotCalled(
            on: stub,
            getSizeUseCase: true
        )
    }

    @Test("Size changed should update content size only")
    func sizeChangedShouldUpdateContentSizeOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize = SpinnerSize.small

        // WHEN
        viewModel.size = newSize

        // THEN
        expectEqualToExpected(on: stub)

        SpinnerGetSizeUseCaseableMockTest.expect(
            stub.getSizeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            expectedReturnValue: stub.expectedContentSize
        )

        expectNotCalled(
            on: stub,
            getColorUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = stub.givenIntent.otherRandom(theme: stub.givenTheme)
        viewModel.size = stub.givenSize.otherRandom

        // THEN
        expectEqualToExpected(
            on: stub,
            othercolorToken: ColorTokenClear(),
            otherContentSize: 0,
            otherIsAnimated: false
        )

        expectNotCalled(
            on: stub,
            getSizeUseCase: true,
            getColorUseCase: true
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
        viewModel.intent = stub.givenIntent
        viewModel.size = stub.givenSize

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getSizeUseCase: true,
            getColorUseCase: true
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
        viewModel.intent = nil
        viewModel.size = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
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
    let expectedIsAnimated = true

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

private func expectNotCalled(
    on stub: Stub,
    getSizeUseCase: Bool = false,
    getColorUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    SpinnerGetSizeUseCaseableMockTest.expectCalled(
        stub.getSizeUseCaseMock,
        executeWithSizeCalled: !getSizeUseCase,
        sourceLocation: sourceLocation
    )

    SpinnerGetColorUseCaseableMockTest.expectCalled(
        stub.getColorUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    othercolorToken: (any ColorToken)? = nil,
    otherContentSize: CGFloat? = nil,
    otherIsAnimated: Bool? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.colorToken.equals(othercolorToken ?? stub.expectedcolorToken),
        "Wrong colorToken value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.contentSize == (otherContentSize ?? stub.expectedContentSize),
        "Wrong contentSize value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.isAnimated == (otherIsAnimated ?? stub.expectedIsAnimated),
        "Wrong isAnimated value",
        sourceLocation: sourceLocation
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

    static func expectCalled(
        _ mock: SpinnerGetSizeUseCaseableMock,
        executeWithSizeCalled isCalled: Bool,
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        #expect(
            mock.executeWithSizeCalled == isCalled,
            "Wrong execute(size: SpinnerSize) isCalled on SpinnerGetSizeUseCaseable",
            sourceLocation: sourceLocation
        )
    }

    static func expect(
        _ mock: SpinnerGetSizeUseCaseableMock,
        expectedNumberOfCalls: Int,
        givenSize: SpinnerSize? = nil,
        expectedReturnValue: CGFloat,
        sourceLocation: Testing.SourceLocation = #_sourceLocation
    ) {
        #expect(
            mock.executeWithSizeCallsCount == expectedNumberOfCalls,
            "Wrong execute(size: SpinnerSize) number of called on SpinnerGetSizeUseCaseable",
            sourceLocation: sourceLocation
        )

        if expectedNumberOfCalls > 0 {
            if let givenSize {
                #expect(
                    mock.executeWithSizeReceivedSize == givenSize,
                    "Wrong execute(size: SpinnerSize) size parameter on SpinnerGetSizeUseCaseable",
                    sourceLocation: sourceLocation
                )
            } else {
                #expect(
                    mock.executeWithSizeReceivedSize == nil,
                    "Wrong execute(size: SpinnerSize) size parameter value on SpinnerGetSizeUseCaseable. Should be nil",
                    sourceLocation: sourceLocation
                )
            }
        }

        #expect(
            mock.executeWithSizeReturnValue == expectedReturnValue,
            "Wrong execute(size: SpinnerSize) return value on SpinnerGetSizeUseCaseable",
            sourceLocation: sourceLocation
        )
    }
}

// MARK: - Extension

private extension SpinnerIntent {

    func otherRandom(theme: any Theme) -> Self {
        SpinnerTestingIntent(intent: self).otherRandom.toIntent(theme)
    }
}
