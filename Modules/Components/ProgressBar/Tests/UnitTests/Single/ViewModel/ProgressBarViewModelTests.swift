//
//  ProgressBarViewModelTests.swift
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
@Suite("ProgressBar ViewModel Tests")
struct ProgressBarViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        #expect(stub.viewModel.theme == nil)
        #expect(stub.viewModel.intent == nil)
        #expect(stub.viewModel.shape == nil)

        expectEqualToExpected(
            on: stub,
            otherColors: ProgressBarColors(),
            otherCornerRadius: 0
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true
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

        ProgressBarGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        ProgressBarGetCornerRadiusUseCaseableMockTest.expect(
            stub.getCornerRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenShape: stub.givenShape,
            expectedReturnValue: stub.expectedCornerRadius
        )

        expectNotCalled(
            on: stub
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update colors and corner radius only")
    func themeChangedShouldUpdateColorsAndCornerRadiusOnly() {
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

        ProgressBarGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        ProgressBarGetCornerRadiusUseCaseableMockTest.expect(
            stub.getCornerRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenShape: stub.givenShape,
            expectedReturnValue: stub.expectedCornerRadius
        )

        expectNotCalled(
            on: stub
        )
    }

    @Test("Intent changed should update colors only")
    func intentChangedShouldUpdateColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = ProgressBarIntent.danger

        // WHEN
        viewModel.intent = newIntent

        // THEN
        expectEqualToExpected(on: stub)

        ProgressBarGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getCornerRadiusUseCase: true
        )
    }

    @Test("Shape changed should update corner radius only")
    func shapeChangedShouldUpdateCornerRadiusOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newShape = ProgressBarShape.square

        // WHEN
        viewModel.shape = newShape

        // THEN
        expectEqualToExpected(on: stub)

        ProgressBarGetCornerRadiusUseCaseableMockTest.expect(
            stub.getCornerRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenShape: newShape,
            expectedReturnValue: stub.expectedCornerRadius
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true
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
            otherColors: ProgressBarColors(),
            otherCornerRadius: 0
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true
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
            getColorsUseCase: true,
            getCornerRadiusUseCase: true
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
            getColorsUseCase: true,
            getCornerRadiusUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: ProgressBarIntent = .support
    let givenShape: ProgressBarShape = .rounded

    // MARK: - Expected

    let expectedColors = ProgressBarColors()
    let expectedCornerRadius: CGFloat = 16.0
    let expectedIsValidValue = true

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: ProgressBarGetColorsUseCaseableGeneratedMock
    let getCornerRadiusUseCaseMock: ProgressBarGetCornerRadiusUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: ProgressBarViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = ProgressBarGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedColors

        let getCornerRadiusUseCaseMock = ProgressBarGetCornerRadiusUseCaseableGeneratedMock()
        getCornerRadiusUseCaseMock.executeWithThemeAndShapeReturnValue = self.expectedCornerRadius

        self.viewModel = ProgressBarViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getCornerRadiusUseCase: getCornerRadiusUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getCornerRadiusUseCaseMock = getCornerRadiusUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getCornerRadiusUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension ProgressBarViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            shape: stub.givenShape
        )
    }
}

private func expectNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getCornerRadiusUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    ProgressBarGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    ProgressBarGetCornerRadiusUseCaseableMockTest.expectCalled(
        stub.getCornerRadiusUseCaseMock,
        executeWithThemeAndShapeCalled: !getCornerRadiusUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherColors: ProgressBarColors? = nil,
    otherCornerRadius: CGFloat? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.colors == (otherColors ?? stub.expectedColors),
        "Wrong colors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.cornerRadius == otherCornerRadius ?? stub.expectedCornerRadius,
        "Wrong cornerRadius value",
        sourceLocation: sourceLocation
    )
}
