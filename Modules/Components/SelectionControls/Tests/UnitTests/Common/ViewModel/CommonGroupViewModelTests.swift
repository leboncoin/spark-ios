//
//  CommonGroupViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

@MainActor
@Suite("Common Group ViewModel Tests")
struct CommonGroupViewModelTests {

    // MARK: - Initialization Test

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherSpacing: 0
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getSpacing: true
        )
    }

    // MARK: - Setup Tests

    @Test("Setup should call spacing use case")
    func setupShouldCallSpacingUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        CommonGroupGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAxis: stub.givenAxis,
            givenIsAccessibilitySize: stub.givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
    }

    // MARK: - Property Change Tests

    @Test("Theme changed should update spacing")
    func themeChangedShouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        expectEqualToExpected(on: stub)

        CommonGroupGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenAxis: stub.givenAxis,
            givenIsAccessibilitySize: stub.givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
    }

    @Test("Axis changed should update spacing")
    func axisChangedShouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenAxis = SelectionControlsAxis.horizontal

        // WHEN
        viewModel.axis = givenAxis

        // THEN
        expectEqualToExpected(on: stub)

        CommonGroupGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAxis: givenAxis,
            givenIsAccessibilitySize: stub.givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
    }

    @Test("Is accessibility size changed should update spacing")
    func isAccessibilitySizeChangedShouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsAccessibilitySize = false

        // WHEN
        viewModel.isAccessibilitySize = givenIsAccessibilitySize

        // THEN
        expectEqualToExpected(on: stub)

        CommonGroupGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAxis: stub.givenAxis,
            givenIsAccessibilitySize: givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
    }

    @Test("Properties changed without setup before should not call use cases")
    func propertiesChangedWithoutSetupBeforeShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.axis = SelectionControlsAxis.horizontal
        viewModel.isAccessibilitySize = false

        // THEN
        expectEqualToExpected(
            on: stub,
            otherSpacing: 0
        )

        expectNotCalled(
            on: stub,
            getSpacing: true
        )
    }

    @Test("Properties changed without change should not call use cases")
    func propertiesChangedWithoutChangeShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.axis = stub.givenAxis
        viewModel.isAccessibilitySize = stub.givenIsAccessibilitySize

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getSpacing: true
        )
    }
}

// MARK: - Stub

private final class Stub: CommonGroupViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenAxis = SelectionControlsAxis.vertical
    let givenIsAccessibilitySize = true

    // MARK: - Expected Properties

    let expectedSpacing: CGFloat = 12.0

    // MARK: - Initialization

    init() {
        let getSpacingUseCaseMock = CommonGroupGetSpacingUseCaseableGeneratedMock()
        getSpacingUseCaseMock.executeWithThemeAndAxisAndIsAccessibilitySizeReturnValue = self.expectedSpacing

        let viewModel = CommonGroupViewModel(
            getSpacingUseCase: getSpacingUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getSpacingUseCaseMock: getSpacingUseCaseMock
        )
    }
}

// MARK: - Extension

private extension CommonGroupViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            axis: stub.givenAxis,
            isAccessibilitySize: stub.givenIsAccessibilitySize
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getSpacing getSpacingNotCalled: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    CommonGroupGetSpacingUseCaseableMockTest.expectCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeAndAxisAndIsAccessibilitySizeCalled: !getSpacingNotCalled,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherSpacing: CGFloat? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.spacing == (otherSpacing ?? stub.expectedSpacing),
        "Wrong spacing value",
        sourceLocation: sourceLocation
    )
}
