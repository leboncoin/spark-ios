//
//  CommonGroupUIViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

final class CommonGroupUIViewModelTests: XCTestCase {

    // MARK: - Initialization Tests

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

    // MARK: - Load Tests

    func test_load_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.load(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        CommonGroupGetSpacingUseCaseableMockTest.XCTAssert(
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

    func test_themeChanged_shouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        CommonGroupGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenAxis: .default,
            givenIsAccessibilitySize: stub.givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
        // **
    }

    func test_axisChanged_shouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenAxis: SelectionControlsAxis = .horizontal

        // WHEN
        viewModel.axis = givenAxis

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        CommonGroupGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAxis: givenAxis,
            givenIsAccessibilitySize: stub.givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
        // **
    }

    func test_isAccessibilitySizeChanged_shouldUpdateSpacing() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenIsAccessibilitySize = true

        // WHEN
        viewModel.isAccessibilitySize = givenIsAccessibilitySize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        CommonGroupGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAxis: .default,
            givenIsAccessibilitySize: givenIsAccessibilitySize,
            expectedReturnValue: stub.expectedSpacing
        )
        // **
    }

    func test_allSetter_withoutChange() {
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
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getSpacing: true
        )
    }

    func test_allSetter_withoutLoadBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.axis = .horizontal
        viewModel.isAccessibilitySize = true

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

// MARK: - XCT

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
