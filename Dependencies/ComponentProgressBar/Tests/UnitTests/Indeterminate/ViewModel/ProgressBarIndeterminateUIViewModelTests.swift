//
//  ProgressBarIndeterminateUIViewModelTests.swift
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

final class ProgressBarIndeterminateUIViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertFalse(stub.viewModel.isAnimated)

        XCTAssertEqualToExpected(
            on: stub,
            otherIsAnimated: false
        )

        XCTAssertNotCalled(
            on: stub,
            getAnimationDataUseCase: true
        )
    }

    // MARK: - Setup

    func test_setup_shouldCallParentSetupAndSetIsAnimated() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getAnimationDataUseCase: true
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
            otherIsAnimated: false
        )

        XCTAssertNotCalled(
            on: stub,
            getAnimationDataUseCase: true
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
            getAnimationDataUseCase: true
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
            getAnimationDataUseCase: true
        )
    }

    // MARK: - Animation Data Methods

    func test_easeInAnimatedData_shouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let trackWidth: CGFloat = 200

        // WHEN
        let animatedData = viewModel.easeInAnimatedData(trackWidth: trackWidth)

        // THEN
        XCTAssertEqual(animatedData, stub.expectedAnimatedData)

        ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.XCTAssert(
            stub.getAnimationDataUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: .easeIn,
            givenTrackWidth: trackWidth,
            expectedReturnValue: stub.expectedAnimatedData
        )
    }

    func test_easeOutAnimatedData_shouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let trackWidth: CGFloat = 200

        // WHEN
        let animatedData = viewModel.easeOutAnimatedData(trackWidth: trackWidth)

        // THEN
        XCTAssertEqual(animatedData, stub.expectedAnimatedData)

        ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.XCTAssert(
            stub.getAnimationDataUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: .easeOut,
            givenTrackWidth: trackWidth,
            expectedReturnValue: stub.expectedAnimatedData
        )
    }

    func test_resetAnimatedData_shouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let trackWidth: CGFloat = 200

        // WHEN
        let animatedData = viewModel.resetAnimatedData(trackWidth: trackWidth)

        // THEN
        XCTAssertEqual(animatedData, stub.expectedAnimatedData)

        ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.XCTAssert(
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

private func XCTAssertNotCalled(
    on stub: Stub,
    getAnimationDataUseCase: Bool = false
) {
    ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.XCTCalled(
        stub.getAnimationDataUseCaseMock,
        executeWithTypeAndTrackWidthCalled: !getAnimationDataUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherIsAnimated: Bool? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.isAnimated,
        otherIsAnimated ?? stub.givenIsAnimated,
        "Wrong isAnimated value"
    )
}
