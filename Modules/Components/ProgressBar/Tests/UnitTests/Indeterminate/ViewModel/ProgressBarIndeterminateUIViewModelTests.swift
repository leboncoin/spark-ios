//
//  ProgressBarIndeterminateUIViewModelTests.swift
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
@Suite("ProgressBar Indeterminate UI ViewModel Tests")
struct ProgressBarIndeterminateUIViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        #expect(!stub.viewModel.isAnimated)

        expectEqualToExpected(
            on: stub,
            otherIsAnimated: false
        )

        expectNotCalled(
            on: stub,
            getAnimationDataUseCase: true
        )
    }

    // MARK: - Setup

    @Test("Setup should call parent setup and set is animated")
    func setupShouldCallParentSetupAndSetIsAnimated() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getAnimationDataUseCase: true
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

        // THEN
        expectEqualToExpected(
            on: stub,
            otherIsAnimated: false
        )

        expectNotCalled(
            on: stub,
            getAnimationDataUseCase: true
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

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getAnimationDataUseCase: true
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

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getAnimationDataUseCase: true
        )
    }

    // MARK: - Animation Data Methods

    @Test("Ease in animated data should call use case")
    func easeInAnimatedDataShouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let trackWidth: CGFloat = 200

        // WHEN
        let animatedData = viewModel.easeInAnimatedData(trackWidth: trackWidth)

        // THEN
        #expect(animatedData == stub.expectedAnimatedData)

        ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.expect(
            stub.getAnimationDataUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: .easeIn,
            givenTrackWidth: trackWidth,
            expectedReturnValue: stub.expectedAnimatedData
        )
    }

    @Test("Ease out animated data should call use case")
    func easeOutAnimatedDataShouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let trackWidth: CGFloat = 200

        // WHEN
        let animatedData = viewModel.easeOutAnimatedData(trackWidth: trackWidth)

        // THEN
        #expect(animatedData == stub.expectedAnimatedData)

        ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.expect(
            stub.getAnimationDataUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: .easeOut,
            givenTrackWidth: trackWidth,
            expectedReturnValue: stub.expectedAnimatedData
        )
    }

    @Test("Reset animated data should call use case")
    func resetAnimatedDataShouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let trackWidth: CGFloat = 200

        // WHEN
        let animatedData = viewModel.resetAnimatedData(trackWidth: trackWidth)

        // THEN
        #expect(animatedData == stub.expectedAnimatedData)

        ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.expect(
            stub.getAnimationDataUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: .reset,
            givenTrackWidth: trackWidth,
            expectedReturnValue: stub.expectedAnimatedData
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: ProgressBarIntent = .support
    let givenShape: ProgressBarShape = .rounded
    let givenIsAnimated: Bool = true

    // MARK: - Expected

    let expectedColors = ProgressBarColors()
    let expectedCornerRadius: CGFloat = 16.0
    let expectedAnimatedData = ProgressBarIndeterminateAnimatedData(
        leadingSpaceWidth: 10.0,
        indicatorWidth: 50.0
    )

    // MARK: - Use Case Mocks

    let getAnimationDataUseCaseMock: ProgressBarIndeterminateGetAnimationDataUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: ProgressBarIndeterminateUIViewModel

    // MARK: - Initialization

    init() {
        let getAnimationDataUseCaseMock = ProgressBarIndeterminateGetAnimationDataUseCaseableGeneratedMock()
        getAnimationDataUseCaseMock.executeWithTypeAndTrackWidthReturnValue = self.expectedAnimatedData

        self.viewModel = ProgressBarIndeterminateUIViewModel(
            getAnimationDataUseCase: getAnimationDataUseCaseMock
        )

        self.getAnimationDataUseCaseMock = getAnimationDataUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getAnimationDataUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension ProgressBarIndeterminateUIViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            shape: stub.givenShape,
            isAnimated: stub.givenIsAnimated
        )
    }
}

private func expectNotCalled(
    on stub: Stub,
    getAnimationDataUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.expectCalled(
        stub.getAnimationDataUseCaseMock,
        executeWithTypeAndTrackWidthCalled: !getAnimationDataUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherIsAnimated: Bool? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.isAnimated == otherIsAnimated ?? stub.givenIsAnimated,
        "Wrong isAnimated value",
        sourceLocation: sourceLocation
    )
}
