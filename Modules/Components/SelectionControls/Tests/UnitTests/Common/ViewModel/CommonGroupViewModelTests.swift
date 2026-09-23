//
//  CommonGroupViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 28/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

final class CommonGroupViewModelTests: XCTestCase {

    // MARK: - Initialization Test

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherSpacing: 0
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getSpacing: true
        )
    }

    // MARK: - Setup Tests

    func test_setup_shouldCallSpacingUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        CommonGroupGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAxis: stub.givenAxis,
            givenIsAccessibilitySize: stub.givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
    }

    // MARK: - Property Change Tests

    func test_themeChanged_shouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CommonGroupGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenAxis: stub.givenAxis,
            givenIsAccessibilitySize: stub.givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
    }

    func test_axisChanged_shouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenAxis = SelectionControlsAxis.horizontal

        // WHEN
        viewModel.axis = givenAxis

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CommonGroupGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAxis: givenAxis,
            givenIsAccessibilitySize: stub.givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
    }

    func test_isAccessibilitySizeChanged_shouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsAccessibilitySize = false

        // WHEN
        viewModel.isAccessibilitySize = givenIsAccessibilitySize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CommonGroupGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAxis: stub.givenAxis,
            givenIsAccessibilitySize: givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
    }

    func test_propertiesChanged_withoutSetupBefore_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.axis = SelectionControlsAxis.horizontal
        viewModel.isAccessibilitySize = false

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherSpacing: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getSpacing: true
        )
    }

    func test_propertiesChanged_withoutChange_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.axis = stub.givenAxis
        viewModel.isAccessibilitySize = stub.givenIsAccessibilitySize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
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

// MARK: - XCT Helpers

private func XCTAssertNotCalled(
    on stub: Stub,
    getSpacing getSpacingNotCalled: Bool = false
) {
    CommonGroupGetSpacingUseCaseableMockTest.XCTCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeAndAxisAndIsAccessibilitySizeCalled: !getSpacingNotCalled
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherSpacing: CGFloat? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.spacing,
        otherSpacing ?? stub.expectedSpacing,
        "Wrong spacing value"
    )
}
