//
//  ProgressBarIndeterminateViewModelTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 31/01/2024.
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
@Suite("ProgressBar Indeterminate ViewModel Tests")
struct ProgressBarIndeterminateViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(!viewModel.isAnimated)

        expectEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData(),
            otherIsNoAnimationType: true,
            otherAnimationStatus: .stop,
            otherIndicatorOpacity: .zero
        )

        expectNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationStatusUseCase: true,
            getAnimationTypeExecuteUseCase: true,
            getAnimationTypeExecuteNextUseCase: true,
            getIndicatorOpacityUseCase: true
        )
    }

    // MARK: - Setup

    @Test("Setup should call all use cases except data")
    func setupShouldCallAllUseCasesExceptData() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData()
        )

        ProgressBarIndeterminateGetAnimationStatusUseCaseableMockTest.expect(
            stub.getAnimationStatusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsAnimated: stub.givenIsAnimated,
            expectedReturnValue: stub.expectedAnimationStatus
        )

        ProgressBarIndeterminateGetAnimationTypeUseCaseableMockTest.expect(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsAnimated: stub.givenIsAnimated,
            expectedReturnValue: stub.expectedAnimationType
        )

        ProgressBarIndeterminateGetIndicatorOpacityUseCaseableMockTest.expect(
            stub.getIndicatorOpacityUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.expectedAnimationType,
            expectedReturnValue: stub.expectedIndicatorOpacity
        )

        expectNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationTypeExecuteNextUseCase: true
        )
    }

    // MARK: - Property Changes

    @Test("Is animated changed should update animation state")
    func isAnimatedChangedShouldUpdateAnimationState() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsAnimated = !stub.givenIsAnimated

        // WHEN
        viewModel.isAnimated = givenIsAnimated

        // THEN
        expectEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData()
        )

        ProgressBarIndeterminateGetAnimationStatusUseCaseableMockTest.expect(
            stub.getAnimationStatusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsAnimated: givenIsAnimated,
            expectedReturnValue: stub.expectedAnimationStatus
        )

        ProgressBarIndeterminateGetAnimationTypeUseCaseableMockTest.expect(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsAnimated: givenIsAnimated,
            expectedReturnValue: stub.expectedAnimationType
        )

        ProgressBarIndeterminateGetIndicatorOpacityUseCaseableMockTest.expect(
            stub.getIndicatorOpacityUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.expectedAnimationType,
            expectedReturnValue: stub.expectedIndicatorOpacity
        )

        expectNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationTypeExecuteNextUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.isAnimated = !stub.givenIsAnimated

        // THEN
        expectEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData(),
            otherIsNoAnimationType: true,
            otherAnimationStatus: .stop,
            otherIndicatorOpacity: .zero
        )

        expectNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationStatusUseCase: true,
            getAnimationTypeExecuteUseCase: true,
            getAnimationTypeExecuteNextUseCase: true,
            getIndicatorOpacityUseCase: true
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
        viewModel.isAnimated = stub.givenIsAnimated

        // THEN
        expectEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData()
        )

        expectNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationStatusUseCase: true,
            getAnimationTypeExecuteUseCase: true,
            getAnimationTypeExecuteNextUseCase: true,
            getIndicatorOpacityUseCase: true
        )
    }

    // MARK: - Animation Data

    @Test("Update animated data should call use case")
    func updateAnimatedDataShouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let trackWidth: CGFloat = 180

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.updateAnimatedData(from: trackWidth)

        // THEN
        expectEqualToExpected(on: stub)

        ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.expect(
            stub.getAnimationDataUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.expectedAnimationType,
            givenTrackWidth: trackWidth,
            expectedReturnValue: stub.expectedAnimationData
        )

        expectNotCalled(
            on: stub,
            getAnimationStatusUseCase: true,
            getAnimationTypeExecuteUseCase: true,
            getAnimationTypeExecuteNextUseCase: true,
            getIndicatorOpacityUseCase: true
        )
    }

    // MARK: - Animation Step

    @Test("Animation step is done when animated should use next type")
    func animationStepIsDoneWhenAnimatedShouldUseNextType() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        viewModel.isAnimated = true
        stub.resetMockedData()

        // WHEN
        viewModel.animationStepIsDone()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData()
        )

        ProgressBarIndeterminateGetAnimationTypeUseCaseableMockTest.expect(
            stub.getAnimationTypeUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.expectedAnimationType,
            expectedReturnValue: stub.expectedAnimationType
        )

        expectNotCalled(
            on: stub,
            getAnimationDataUseCase: true,
            getAnimationStatusUseCase: true,
            getAnimationTypeExecuteUseCase: true,
            getIndicatorOpacityUseCase: true
        )
    }

    @Test("Animation step is done when not animated should refresh status")
    func animationStepIsDoneWhenNotAnimatedShouldRefreshStatus() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.animationStepIsDone()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherAnimationData: ProgressBarIndeterminateAnimatedData()
        )

        ProgressBarIndeterminateGetAnimationStatusUseCaseableMockTest.expect(
            stub.getAnimationStatusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsAnimated: stub.givenIsAnimated,
            expectedReturnValue: stub.expectedAnimationStatus
        )

        expectNotCalled(
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

private func expectNotCalled(
    on stub: Stub,
    getAnimationDataUseCase: Bool = false,
    getAnimationStatusUseCase: Bool = false,
    getAnimationTypeExecuteUseCase: Bool = false,
    getAnimationTypeExecuteNextUseCase: Bool = false,
    getIndicatorOpacityUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    ProgressBarIndeterminateGetAnimationDataUseCaseableMockTest.expectCalled(
        stub.getAnimationDataUseCaseMock,
        executeWithTypeAndTrackWidthCalled: !getAnimationDataUseCase,
        sourceLocation: sourceLocation
    )

    ProgressBarIndeterminateGetAnimationStatusUseCaseableMockTest.expectCalled(
        stub.getAnimationStatusUseCaseMock,
        executeWithIsAnimatedCalled: !getAnimationStatusUseCase,
        sourceLocation: sourceLocation
    )

    ProgressBarIndeterminateGetAnimationTypeUseCaseableMockTest.expectCalled(
        stub.getAnimationTypeUseCaseMock,
        executeWithIsAnimatedCalled: !getAnimationTypeExecuteUseCase,
        sourceLocation: sourceLocation
    )
    ProgressBarIndeterminateGetAnimationTypeUseCaseableMockTest.expectCalled(
        stub.getAnimationTypeUseCaseMock,
        executeNextWithTypeCalled: !getAnimationTypeExecuteNextUseCase,
        sourceLocation: sourceLocation
    )

    ProgressBarIndeterminateGetIndicatorOpacityUseCaseableMockTest.expectCalled(
        stub.getIndicatorOpacityUseCaseMock,
        executeWithTypeCalled: !getIndicatorOpacityUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherAnimationData: ProgressBarIndeterminateAnimatedData? = nil,
    otherIsNoAnimationType: Bool? = nil,
    otherAnimationStatus: ProgressBarIndeterminateStatus? = nil,
    otherIndicatorOpacity: Double? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.animationData == otherAnimationData ?? stub.expectedAnimationData,
        "Wrong animationData value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.animationType == (otherIsNoAnimationType == true ? nil : stub.expectedAnimationType),
        "Wrong animationType value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.animationStatus == otherAnimationStatus ?? stub.expectedAnimationStatus,
        "Wrong animationStatus value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.indicatorOpacity == otherIndicatorOpacity ?? stub.expectedIndicatorOpacity,
        "Wrong indicatorOpacity value",
        sourceLocation: sourceLocation
    )
}
