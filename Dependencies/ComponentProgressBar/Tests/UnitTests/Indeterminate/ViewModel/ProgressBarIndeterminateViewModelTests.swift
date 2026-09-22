//
//  ProgressBarIndeterminateViewModelTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 31/01/2024.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import UIKit

@testable import SparkComponentProgressBar
@_spi(SI_SPI) @testable import SparkComponentProgressBarTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

final class ProgressBarIndeterminateViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        XCTAssertFalse(viewModel.isAnimated)

        XCTAssertEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData(),
            otherIsNoAnimationType: true,
            otherAnimationStatus: .stop,
            otherIndicatorOpacity: .zero
        )

        XCTAssertNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationStatusUseCase: true,
            getAnimationTypeExecuteUseCase: true,
            getAnimationTypeExecuteNextUseCase: true,
            getIndicatorOpacityUseCase: true
        )
    }

    // MARK: - Setup

    func test_setup_shouldCallAllUseCasesExceptData() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData()
        )

        ProgressBarIndeterminateGetAnimationStatusUseCaseableMockTest.XCTAssert(
            stub.getAnimationStatusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsAnimated: stub.givenIsAnimated,
            expectedReturnValue: stub.expectedAnimationStatus
        )

        ProgressBarIndeterminateGetAnimationTypeUseCaseableMockTest.XCTAssert(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsAnimated: stub.givenIsAnimated,
            expectedReturnValue: stub.expectedAnimationType
        )

        ProgressBarIndeterminateGetIndicatorOpacityUseCaseableMockTest.XCTAssert(
            stub.getIndicatorOpacityUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.expectedAnimationType,
            expectedReturnValue: stub.expectedIndicatorOpacity
        )

        XCTAssertNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationTypeExecuteNextUseCase: true
        )
    }

    // MARK: - Property Changes

    func test_isAnimatedChanged_shouldUpdateAnimationState() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsAnimated = !stub.givenIsAnimated

        // WHEN
        viewModel.isAnimated = givenIsAnimated

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData()
        )

        ProgressBarIndeterminateGetAnimationStatusUseCaseableMockTest.XCTAssert(
            stub.getAnimationStatusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsAnimated: givenIsAnimated,
            expectedReturnValue: stub.expectedAnimationStatus
        )

        ProgressBarIndeterminateGetAnimationTypeUseCaseableMockTest.XCTAssert(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsAnimated: givenIsAnimated,
            expectedReturnValue: stub.expectedAnimationType
        )

        ProgressBarIndeterminateGetIndicatorOpacityUseCaseableMockTest.XCTAssert(
            stub.getIndicatorOpacityUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.expectedAnimationType,
            expectedReturnValue: stub.expectedIndicatorOpacity
        )

        XCTAssertNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationTypeExecuteNextUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.isAnimated = !stub.givenIsAnimated

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData(),
            otherIsNoAnimationType: true,
            otherAnimationStatus: .stop,
            otherIndicatorOpacity: .zero
        )

        XCTAssertNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationStatusUseCase: true,
            getAnimationTypeExecuteUseCase: true,
            getAnimationTypeExecuteNextUseCase: true,
            getIndicatorOpacityUseCase: true
        )
    }

    func test_propertiesChanged_withoutValueChange_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.isAnimated = stub.givenIsAnimated

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData()
        )

        XCTAssertNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationStatusUseCase: true,
            getAnimationTypeExecuteUseCase: true,
            getAnimationTypeExecuteNextUseCase: true,
            getIndicatorOpacityUseCase: true
        )
    }

    // MARK: - Animation Data

    func test_updateAnimatedData_shouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let trackWidth: CGFloat = 180

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.updateAnimatedData(from: trackWidth)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.XCTAssert(
            stub.getAnimationDataUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.expectedAnimationType,
            givenTrackWidth: trackWidth,
            expectedReturnValue: stub.expectedAnimationData
        )

        XCTAssertNotCalled(
            on: stub,
            getAnimationStatusUseCase: true,
            getAnimationTypeExecuteUseCase: true,
            getAnimationTypeExecuteNextUseCase: true,
            getIndicatorOpacityUseCase: true
        )
    }

    // MARK: - Animation Step

    func test_animationStepIsDone_whenAnimated_shouldUseNextType() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        viewModel.isAnimated = true
        stub.resetMockedData()

        // WHEN
        viewModel.animationStepIsDone()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData()
        )

        ProgressBarIndeterminateGetAnimationTypeUseCaseableMockTest.XCTAssert(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.expectedAnimationType,
            expectedReturnValue: stub.expectedAnimationType
        )

        XCTAssertNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationStatusUseCase: true,
            getAnimationTypeExecuteUseCase: true,
            getIndicatorOpacityUseCase: true
        )
    }

    func test_animationStepIsDone_whenNotAnimated_shouldRefreshStatus() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.animationStepIsDone()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData()
        )

        ProgressBarIndeterminateGetAnimationStatusUseCaseableMockTest.XCTAssert(
            stub.getAnimationStatusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsAnimated: stub.givenIsAnimated,
            expectedReturnValue: stub.expectedAnimationStatus
        )

        XCTAssertNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationTypeExecuteUseCase: true,
            getAnimationTypeExecuteNextUseCase: true,
            getIndicatorOpacityUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme: ThemeGeneratedMock = ThemeGeneratedMock.mocked()
    let givenIntent: ProgressBarIntent = .support
    let givenShape: ProgressBarShape = .rounded
    let givenIsAnimated: Bool = false

    // MARK: - Expected

    let expectedColors: ProgressBarColors = .init(
        trackBackgroundColorToken: ColorTokenGeneratedMock.blue(),
        indicatorBackgroundColorToken: ColorTokenGeneratedMock.orange()
    )
    let expectedCornerRadius: CGFloat = 0.5
    let expectedAnimationData: ProgressBarIndeterminateAnimatedData = ProgressBarIndeterminateAnimatedData(
        leadingSpaceWidth: 10,
        indicatorWidth: 50
    )
    let expectedAnimationStatus: ProgressBarIndeterminateStatus = .start
    let expectedAnimationType: ProgressBarIndeterminateAnimationType = .easeIn
    let expectedIndicatorOpacity: CGFloat = 0.8

    // MARK: - Use Case Mocks

    let getAnimationDataUseCaseMock: ProgressBarIndeterminateGetAnimationDataUseCaseableGeneratedMock
    let getAnimationStatusUseCaseMock: ProgressBarIndeterminateGetAnimationStatusUseCaseableGeneratedMock
    let getAnimationTypeUseCaseMock: ProgressBarIndeterminateGetAnimationTypeUseCaseableGeneratedMock
    let getIndicatorOpacityUseCaseMock: ProgressBarIndeterminateGetIndicatorOpacityUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: ProgressBarIndeterminateViewModel

    // MARK: - Initialization

    init() {
        let getAnimationDataUseCaseMock = ProgressBarIndeterminateGetAnimationDataUseCaseableGeneratedMock()
        getAnimationDataUseCaseMock.executeWithTypeAndTrackWidthReturnValue = self.expectedAnimationData

        let getAnimationStatusUseCaseMock = ProgressBarIndeterminateGetAnimationStatusUseCaseableGeneratedMock()
        getAnimationStatusUseCaseMock.executeWithIsAnimatedReturnValue = self.expectedAnimationStatus

        let getAnimationTypeUseCaseMock = ProgressBarIndeterminateGetAnimationTypeUseCaseableGeneratedMock()
        getAnimationTypeUseCaseMock.executeWithIsAnimatedReturnValue = self.expectedAnimationType
        getAnimationTypeUseCaseMock.executeNextWithTypeReturnValue = self.expectedAnimationType

        let getIndicatorOpacityUseCaseMock = ProgressBarIndeterminateGetIndicatorOpacityUseCaseableGeneratedMock()
        getIndicatorOpacityUseCaseMock.executeWithTypeReturnValue = self.expectedIndicatorOpacity

        self.viewModel = ProgressBarIndeterminateViewModel(
            getAnimationDataUseCase: getAnimationDataUseCaseMock,
            getAnimationStatusUseCase: getAnimationStatusUseCaseMock,
            getAnimationTypeUseCase: getAnimationTypeUseCaseMock,
            getIndicatorOpacityUseCase: getIndicatorOpacityUseCaseMock
        )

        self.getAnimationDataUseCaseMock = getAnimationDataUseCaseMock
        self.getAnimationStatusUseCaseMock = getAnimationStatusUseCaseMock
        self.getAnimationTypeUseCaseMock = getAnimationTypeUseCaseMock
        self.getIndicatorOpacityUseCaseMock = getIndicatorOpacityUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getAnimationDataUseCaseMock.reset()
        self.getAnimationStatusUseCaseMock.reset()
        self.getAnimationTypeUseCaseMock.reset()
        self.getIndicatorOpacityUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension ProgressBarIndeterminateViewModel {

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
    getAnimationDataUseCase: Bool = false,
    getAnimationStatusUseCase: Bool = false,
    getAnimationTypeExecuteUseCase: Bool = false,
    getAnimationTypeExecuteNextUseCase: Bool = false,
    getIndicatorOpacityUseCase: Bool = false
) {
    ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.XCTCalled(
        stub.getAnimationDataUseCaseMock,
        executeWithTypeAndTrackWidthCalled: !getAnimationDataUseCase
    )

    ProgressBarIndeterminateGetAnimationStatusUseCaseableMockTest.XCTCalled(
        stub.getAnimationStatusUseCaseMock,
        executeWithIsAnimatedCalled: !getAnimationStatusUseCase
    )

    ProgressBarIndeterminateGetAnimationTypeUseCaseableMockTest.XCTCalled(
        stub.getAnimationTypeUseCaseMock,
        executeWithIsAnimatedCalled: !getAnimationTypeExecuteUseCase
    )
    ProgressBarIndeterminateGetAnimationTypeUseCaseableMockTest.XCTCalled(
        stub.getAnimationTypeUseCaseMock,
        executeNextWithTypeCalled: !getAnimationTypeExecuteNextUseCase
    )

    ProgressBarIndeterminateGetIndicatorOpacityUseCaseableMockTest.XCTCalled(
        stub.getIndicatorOpacityUseCaseMock,
        executeWithTypeCalled: !getIndicatorOpacityUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherAnimationData: ProgressBarIndeterminateAnimatedData? = nil,
    otherIsNoAnimationType: Bool? = nil,
    otherAnimationStatus: ProgressBarIndeterminateStatus? = nil,
    otherIndicatorOpacity: Double? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.animationData,
        otherAnimationData ?? stub.expectedAnimationData,
        "Wrong animationData value"
    )
    XCTAssertEqual(
        viewModel.animationType,
        otherIsNoAnimationType == true ? nil : stub.expectedAnimationType,
        "Wrong animationType value"
    )
    XCTAssertEqual(
        viewModel.animationStatus,
        otherAnimationStatus ?? stub.expectedAnimationStatus,
        "Wrong animationStatus value"
    )
    XCTAssertEqual(
        viewModel.indicatorOpacity,
        otherIndicatorOpacity ?? stub.expectedIndicatorOpacity,
        "Wrong indicatorOpacity value"
    )
}
