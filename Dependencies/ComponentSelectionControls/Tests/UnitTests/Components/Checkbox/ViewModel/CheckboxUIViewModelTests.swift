//
//  CheckboxUIViewModelTests.swift
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

final class CheckboxUIViewModelTests: XCTestCase {

    // MARK: - Initialization Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init(),
            otherIsIcon: false
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getNewSelectedValue: true
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
        XCTAssertNotCalled(
            on: stub,
            getNewSelectedValue: true
        )

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: .default,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedStaticColors
        )

        CheckboxGetIsIconUseCaseableMockTest.XCTAssert(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: .default,
            expectedReturnValue: stub.expectedIsIcon
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
            getIsIcon: true,
            getNewSelectedValue: true
        )

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: .default,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
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

        let givenIntent: CheckboxIntent = .error

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getIsIcon: true,
            getNewSelectedValue: true
        )

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenSelectionState: .default,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
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
        viewModel.selectedValueChanged(oldValue: .default)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getNewSelectedValue: true
        )
    }

    func test_allSetter_withoutLoadBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .error
        viewModel.selectedValueChanged(oldValue: .selected)

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init(),
            otherIsIcon: false
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getNewSelectedValue: true
        )
    }

    // MARK: - Action

    func test_toggle() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.toggle()

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticColors: true
        )

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: stub.expectedNewSelectedValue,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetIsIconUseCaseableMockTest.XCTAssert(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: stub.expectedNewSelectedValue,
            expectedReturnValue: stub.expectedIsIcon
        )

        CheckboxGetNewSelectedValueUseCaseableMockTest.XCTAssert(
            stub.getNewSelectedValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: .default,
            givenIsEnabled: true,
            expectedReturnValue: stub.expectedNewSelectedValue
        )
        // **
    }

    func test_toggle_when_getNewSelectedValueUseCaseReturnNil() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        stub.getNewSelectedValueUseCaseMock.executeWithSelectionStateAndIsEnabledReturnValue = nil

        // WHEN
        viewModel.toggle()

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true
        )

        CheckboxGetNewSelectedValueUseCaseableMockTest.XCTAssert(
            stub.getNewSelectedValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: .default,
            givenIsEnabled: true,
            expectedReturnValue: nil
        )
        // **
    }

    func test_selectedValueChanged() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.selectedValueChanged(oldValue: .selected)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticColors: true,
            getNewSelectedValue: true
        )

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: .default,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetIsIconUseCaseableMockTest.XCTAssert(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: .default,
            expectedReturnValue: stub.expectedIsIcon
        )
        // **
    }
}

// MARK: - Stub

private final class Stub: CheckboxUIViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent = CheckboxIntent.default
    let givenIsOnOffSwitchLabelsEnabled: Bool = false
    let givenContrast: UIAccessibilityContrast = .normal
    let givenIsReduceMotionEnabled = false

    // MARK: - Expected Properties

    let expectedDynamicColors = CheckboxDynamicColors()
    let expectedStaticColors = CheckboxStaticColors()
    let expectedIsIcon: Bool = true
    let expectedNewSelectedValue: CheckboxSelectionState = .selected

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = CheckboxGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeStaticWithThemeAndIntentReturnValue = self.expectedStaticColors
        getColorsUseCaseMock.executeDynamicWithThemeAndIntentAndSelectionStateReturnValue = self.expectedDynamicColors

        let getIsIconUseCaseMock = CheckboxGetIsIconUseCaseableGeneratedMock()
        getIsIconUseCaseMock.executeWithSelectionStateReturnValue = self.expectedIsIcon

        let getNewSelectedValueUseCaseMock = CheckboxGetNewSelectedValueUseCaseableGeneratedMock()
        getNewSelectedValueUseCaseMock.executeWithSelectionStateAndIsEnabledReturnValue = self.expectedNewSelectedValue

        let viewModel = CheckboxUIViewModel(
            theme: self.givenTheme,
            getColorsUseCase: getColorsUseCaseMock,
            getIsIconUseCase: getIsIconUseCaseMock,
            getNewSelectedValueUseCase: getNewSelectedValueUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getColorsUseCaseMock: getColorsUseCaseMock,
            getIsIconUseCaseMock: getIsIconUseCaseMock,
            getNewSelectedValueUseCaseMock: getNewSelectedValueUseCaseMock
        )
    }
}

// MARK: - Extension

private extension CheckboxUIViewModel {

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
    getIsIcon getIsIconNotCalled: Bool = false,
    getNewSelectedValue getNewSelectedValueNotCalled: Bool = false
) {
    CheckboxGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeDynamicWithThemeAndIntentAndSelectionStateCalled: !getDynamicColorsNotCalled
    )

    CheckboxGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeStaticWithThemeAndIntentCalled: !getStaticColorsNotCalled
    )

    CheckboxGetIsIconUseCaseableMockTest.XCTCalled(
        stub.getIsIconUseCaseMock,
        executeWithSelectionStateCalled: !getIsIconNotCalled
    )

    CheckboxGetNewSelectedValueUseCaseableMockTest.XCTCalled(
        stub.getNewSelectedValueUseCaseMock,
        executeWithSelectionStateAndIsEnabledCalled: !getNewSelectedValueNotCalled
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherDynamicColors: CheckboxDynamicColors? = nil,
    otherStaticColors: CheckboxStaticColors? = nil,
    otherIsIcon: Bool? = nil
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
        viewModel.isIcon,
        otherIsIcon ?? stub.expectedIsIcon,
        "Wrong isIcon value"
    )
}
