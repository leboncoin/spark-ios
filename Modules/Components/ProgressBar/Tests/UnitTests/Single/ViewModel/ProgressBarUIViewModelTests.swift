//
//  ProgressBarUIViewModelTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import Foundation
import SwiftUI
import UIKit

@testable import SparkComponentProgressBar
@_spi(SI_SPI) @testable import SparkComponentProgressBarTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

@MainActor
@Suite("ProgressBar UI ViewModel Tests")
struct ProgressBarUIViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        #expect(stub.viewModel.indicatorIsHidden)

        expectEqualToExpected(
            on: stub,
            otherIndicatorIsHidden: true
        )

        expectNotCalled(
            on: stub,
            getIsIndicatorHiddenUseCase: true
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

        ProgressBarGetIsIndicatorHiddenUseCaseableMockTest.expect(
            stub.getIsIndicatorHiddenUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: stub.givenValue,
            expectedReturnValue: stub.expectedIndicatorIsHidden
        )
    }

    // MARK: - Property Changes

    @Test("Value changed should update indicator is hidden only")
    func valueChangedShouldUpdateIndicatorIsHiddenOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newValue: CGFloat = 0.8

        // WHEN
        viewModel.value = newValue

        // THEN
        expectEqualToExpected(on: stub)

        ProgressBarGetIsIndicatorHiddenUseCaseableMockTest.expect(
            stub.getIsIndicatorHiddenUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: newValue,
            expectedReturnValue: stub.expectedIndicatorIsHidden
        )

        expectNotCalled(
            on: stub
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .danger
        viewModel.shape = .square
        viewModel.value = 0.5

        // THEN
        expectEqualToExpected(
            on: stub,
            otherIndicatorIsHidden: true
        )

        expectNotCalled(
            on: stub,
            getIsIndicatorHiddenUseCase: true
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
        viewModel.shape = stub.givenShape
        viewModel.value = stub.givenValue

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getIsIndicatorHiddenUseCase: true
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
        viewModel.shape = nil
        viewModel.value = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
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

private func expectNotCalled(
    on stub: Stub,
    getIsIndicatorHiddenUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    ProgressBarGetIsIndicatorHiddenUseCaseableMockTest.expectCalled(
        stub.getIsIndicatorHiddenUseCaseMock,
        executeWithValueCalled: !getIsIndicatorHiddenUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherIndicatorIsHidden: Bool? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.indicatorIsHidden == otherIndicatorIsHidden ?? stub.expectedIndicatorIsHidden,
        "Wrong indicatorIsHidden value",
        sourceLocation: sourceLocation
    )
}
