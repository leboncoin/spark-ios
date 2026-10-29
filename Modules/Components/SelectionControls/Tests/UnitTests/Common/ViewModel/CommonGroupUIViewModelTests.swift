//
//  CommonGroupUIViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/09/2025.
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
@Suite("Common Group UI ViewModel Tests")
struct CommonGroupUIViewModelTests {

    // MARK: - Initialization Tests

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

    // MARK: - Load Tests

    @Test("Load should call all use cases")
    func loadShouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.load(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        CommonGroupGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAxis: .default,
            givenIsAccessibilitySize: stub.givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
        // **
    }

    // MARK: - Setter Tests

    @Test("Theme changed should update spacing")
    func themeChangedShouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        CommonGroupGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenAxis: .default,
            givenIsAccessibilitySize: stub.givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
        // **
    }

    @Test("Axis changed should update spacing")
    func axisChangedShouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenAxis: SelectionControlsAxis = .horizontal

        // WHEN
        viewModel.axis = givenAxis

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        CommonGroupGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAxis: givenAxis,
            givenIsAccessibilitySize: stub.givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
        // **
    }

    @Test("Is accessibility size changed should update spacing")
    func isAccessibilitySizeChangedShouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenIsAccessibilitySize = true

        // WHEN
        viewModel.isAccessibilitySize = givenIsAccessibilitySize

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        CommonGroupGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAxis: .default,
            givenIsAccessibilitySize: givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
        // **
    }

    @Test("All setter without change")
    func allSetterWithoutChange() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.axis = .default
        viewModel.isAccessibilitySize = stub.givenIsAccessibilitySize

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getSpacing: true
        )
    }

    @Test("All setter without load before")
    func allSetterWithoutLoadBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.axis = .horizontal
        viewModel.isAccessibilitySize = true

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
}

// MARK: - Stub

private final class Stub: CommonGroupUIViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIsAccessibilitySize: Bool = false

    // MARK: - Expected Properties

    let expectedSpacing: CGFloat = 16

    // MARK: - Initialization

    init() {
        let getSpacingUseCaseMock = CommonGroupGetSpacingUseCaseableGeneratedMock()
        getSpacingUseCaseMock.executeWithThemeAndAxisAndIsAccessibilitySizeReturnValue = self.expectedSpacing

        let viewModel = CommonGroupUIViewModel(
            theme: self.givenTheme,
            getSpacingUseCase: getSpacingUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getSpacingUseCaseMock: getSpacingUseCaseMock
        )
    }
}

// MARK: - Extension

private extension CommonGroupUIViewModel {

    func load(stub: Stub) {
        self.load(
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
