//
//  RadioButtonUIViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 09/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

final class RadioButtonUIViewModelTests: XCTestCase {

    // MARK: - Initialization Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init(),
            otherShowSelectedDot: false
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSelectedDot: true
        )
    }

    // MARK: - Load Tests

    func test_load_shouldCallAllUseCases_exceptAnimationType() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.load(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        RadioButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        RadioButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedStaticColors
        )
        // **
    }

    // MARK: - Setter Tests

    func test_themeChanged_shouldUpdateSomeProperties() {
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
        XCTAssertNotCalled(
            on: stub,
            getShowSelectedDot: true
        )

        RadioButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        RadioButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedStaticColors
        )
        // **
    }

    func test_intentChanged_shouldUpdateSomeProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenIntent: RadioButtonIntent = .error

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getShowSelectedDot: true
        )

        RadioButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        RadioButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            expectedReturnValue: stub.expectedStaticColors
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
        viewModel.intent = stub.givenIntent
        viewModel.selectedValueChanged(oldValue: false)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSelectedDot: true
        )
    }

    func test_allSetter_withoutLoadBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .support
        viewModel.selectedValueChanged(oldValue: true)

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init(),
            otherShowSelectedDot: false
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSelectedDot: true
        )
    }

    // MARK: - Action

    func test_toggleIfPossible() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        let toggled = viewModel.toggleIfPossible()

        // THEN
        XCTAssertTrue(toggled)

        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticColors: true
        )

        RadioButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsOn: true,
            expectedReturnValue: stub.expectedDynamicColors
        )

        RadioButtonGetShowSelectedDotUseCaseableMockTest.XCTAssert(
            stub.getShowSelectedDotUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsSelected: true,
            expectedReturnValue: stub.expectedShowSelectedDot
        )
        // **

        // ***
        // 2nd Test

        // GIVEN
        stub.resetMockedData()

        // WHEN
        let toggled2 = viewModel.toggleIfPossible()

        // THEN
        XCTAssertFalse(toggled2)

        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSelectedDot: true
        )
        // ***
    }

    func test_selectedValueChanged() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.selectedValueChanged(oldValue: true)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticColors: true
        )

        RadioButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        RadioButtonGetShowSelectedDotUseCaseableMockTest.XCTAssert(
            stub.getShowSelectedDotUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsSelected: false,
            expectedReturnValue: stub.expectedShowSelectedDot
        )
        // **
    }
}

// MARK: - Stub

private final class Stub: RadioButtonUIViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent = RadioButtonIntent.default
    let givenIsSelectedOffSwitchLabelsEnabled: Bool = false
    let givenContrast: UIAccessibilityContrast = .normal
    let givenIsReduceMotionEnabled = false

    // MARK: - Expected Properties

    let expectedDynamicColors = RadioButtonDynamicColors()
    let expectedStaticColors = RadioButtonStaticColors()
    let expectedShowSelectedDot = true

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = RadioButtonGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeStaticWithThemeAndIntentReturnValue = self.expectedStaticColors
        getColorsUseCaseMock.executeDynamicWithThemeAndIntentAndIsOnReturnValue = self.expectedDynamicColors

        let getShowSelectedDotUseCaseMock = RadioButtonGetShowSelectedDotUseCaseableGeneratedMock()
        getShowSelectedDotUseCaseMock.executeWithIsSelectedReturnValue = self.expectedShowSelectedDot

        let viewModel = RadioButtonUIViewModel(
            theme: self.givenTheme,
            getColorsUseCase: getColorsUseCaseMock,
            getShowSelectedDotUseCase: getShowSelectedDotUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getColorsUseCaseMock: getColorsUseCaseMock,
            getShowSelectedDotUseCaseMock: getShowSelectedDotUseCaseMock
        )
    }
}

// MARK: - Extension

private extension RadioButtonUIViewModel {

    func load(stub: Stub) {
        self.load(
            isReduceMotionEnabled: stub.givenIsReduceMotionEnabled
        )
    }
}

// MARK: - XCT

private func XCTAssertNotCalled(
    on stub: Stub,
    getDynamicColors getDynamicColorsNotCalled: Bool = false,
    getStaticColors getStaticColorsNotCalled: Bool = false,
    getShowSelectedDot getShowSelectedDotNotCalled: Bool = false
) {
    RadioButtonGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeDynamicWithThemeAndIntentAndIsOnCalled: !getDynamicColorsNotCalled
    )

    RadioButtonGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeStaticWithThemeAndIntentCalled: !getStaticColorsNotCalled
    )

    RadioButtonGetShowSelectedDotUseCaseableMockTest.XCTCalled(
        stub.getShowSelectedDotUseCaseMock,
        executeWithIsSelectedCalled: !getShowSelectedDotNotCalled
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherDynamicColors: RadioButtonDynamicColors? = nil,
    otherStaticColors: RadioButtonStaticColors? = nil,
    otherShowSelectedDot: Bool? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.dynamicColors,
        otherDynamicColors ?? stub.expectedDynamicColors,
        "Wrong dynamicColors value"
    )
    XCTAssertEqual(
        viewModel.staticColors,
        otherStaticColors ?? stub.expectedStaticColors,
        "Wrong staticColors value"
    )
    XCTAssertEqual(
        viewModel.showSelectedDot,
        otherShowSelectedDot ?? stub.expectedShowSelectedDot,
        "Wrong showSelectedDot value"
    )
}
