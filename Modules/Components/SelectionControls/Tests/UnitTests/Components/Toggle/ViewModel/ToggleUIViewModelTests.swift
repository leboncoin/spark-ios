//
//  ToggleUIViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

final class ToggleUIViewModelTests: XCTestCase {

    // MARK: - Initialization Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init(),
            otherIsIcon: false,
            otherShowSpace: .left
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getShowSpace: true
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
        ToggleGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        ToggleGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedStaticColors
        )

        ToggleGetIsIconUseCaseableMockTest.XCTAssert(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOnOffSwitchLabelsEnabled: stub.givenIsOnOffSwitchLabelsEnabled,
            givenContrast: stub.givenContrast,
            expectedReturnValue: stub.expectedIsIcon
        )

        ToggleGetShowSpaceUseCaseableMockTest.XCTAssert(
            stub.getShowSpaceUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOn: false,
            expectedReturnValue: stub.expectedShowSpace
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
            getShowSpace: true
        )

        ToggleGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        ToggleGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedStaticColors
        )
        // **
    }

    func test_isOnOffSwitchLabelsEnabledChanged_shouldUpdateIsIcon() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenIsOnOffSwitchLabelsEnabled = true

        // WHEN
        viewModel.isOnOffSwitchLabelsEnabled = givenIsOnOffSwitchLabelsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSpace: true
        )

        ToggleGetIsIconUseCaseableMockTest.XCTAssert(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOnOffSwitchLabelsEnabled: givenIsOnOffSwitchLabelsEnabled,
            givenContrast: stub.givenContrast,
            expectedReturnValue: stub.expectedIsIcon
        )
        // **
    }

    func test_contrastChanged_shouldUpdateIsIcon() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenContrast = UIAccessibilityContrast.high

        // WHEN
        viewModel.contrast = givenContrast

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSpace: true
        )

        ToggleGetIsIconUseCaseableMockTest.XCTAssert(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOnOffSwitchLabelsEnabled: stub.givenIsOnOffSwitchLabelsEnabled,
            givenContrast: givenContrast,
            expectedReturnValue: stub.expectedIsIcon
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
        viewModel.selectedValueChanged(oldValue: false)
        viewModel.isOnOffSwitchLabelsEnabled = stub.givenIsOnOffSwitchLabelsEnabled
        viewModel.contrast = stub.givenContrast

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getShowSpace: true
        )
    }

    func test_allSetter_withoutLoadBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.isOnOffSwitchLabelsEnabled = true
        viewModel.contrast = .high

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init(),
            otherIsIcon: false,
            otherShowSpace: .left
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getShowSpace: true
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

        ToggleGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsOn: true,
            expectedReturnValue: stub.expectedDynamicColors
        )

        ToggleGetIsIconUseCaseableMockTest.XCTAssert(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOnOffSwitchLabelsEnabled: stub.givenIsOnOffSwitchLabelsEnabled,
            givenContrast: stub.givenContrast,
            expectedReturnValue: stub.expectedIsIcon
        )

        ToggleGetShowSpaceUseCaseableMockTest.XCTAssert(
            stub.getShowSpaceUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOn: true,
            expectedReturnValue: stub.expectedShowSpace
        )
        // **
    }

    func test_toggle_when_isEnabledIsFalse() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        viewModel.isEnabled = false

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
            getIsIcon: true,
            getShowSpace: true
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
        viewModel.selectedValueChanged(oldValue: true)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getStaticColors: true
        )

        ToggleGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        ToggleGetIsIconUseCaseableMockTest.XCTAssert(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOnOffSwitchLabelsEnabled: stub.givenIsOnOffSwitchLabelsEnabled,
            givenContrast: stub.givenContrast,
            expectedReturnValue: stub.expectedIsIcon
        )

        ToggleGetShowSpaceUseCaseableMockTest.XCTAssert(
            stub.getShowSpaceUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOn: false,
            expectedReturnValue: stub.expectedShowSpace
        )
        // **
    }
}

// MARK: - Stub

private final class Stub: ToggleUIViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIsOnOffSwitchLabelsEnabled: Bool = false
    let givenContrast: UIAccessibilityContrast = .normal
    let givenIsReduceMotionEnabled = false

    // MARK: - Expected Properties

    let expectedDynamicColors = ToggleDynamicColors()
    let expectedStaticColors = ToggleStaticColors()
    let expectedIsIcon: Bool = true
    let expectedShowSpace: ToggleSpace = .right

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = ToggleGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeStaticWithThemeReturnValue = self.expectedStaticColors
        getColorsUseCaseMock.executeDynamicWithThemeAndIsOnReturnValue = self.expectedDynamicColors

        let getIsIconUseCaseMock = ToggleGetIsIconUseCaseableGeneratedMock()
        getIsIconUseCaseMock.executeUIWithIsOnOffSwitchLabelsEnabledAndContrastReturnValue = self.expectedIsIcon

        let getShowSpaceUseCaseMock = ToggleGetShowSpaceUseCaseableGeneratedMock()
        getShowSpaceUseCaseMock.executeWithIsOnReturnValue = self.expectedShowSpace

        let viewModel = ToggleUIViewModel(
            theme: self.givenTheme,
            getColorsUseCase: getColorsUseCaseMock,
            getIsIconUseCase: getIsIconUseCaseMock,
            getShowSpaceUseCase: getShowSpaceUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getColorsUseCaseMock: getColorsUseCaseMock,
            getIsIconUseCaseMock: getIsIconUseCaseMock,
            getShowSpaceUseCaseMock: getShowSpaceUseCaseMock
        )
    }
}

// MARK: - Extension

private extension ToggleUIViewModel {

    func load(stub: Stub) {
        self.load(
            isOnOffSwitchLabelsEnabled: stub.givenIsOnOffSwitchLabelsEnabled,
            isReduceMotionEnabled: stub.givenIsReduceMotionEnabled,
            contrast: stub.givenContrast
        )
    }
}

// MARK: - XCT

private func XCTAssertNotCalled(
    on stub: Stub,
    getDynamicColors getDynamicColorsNotCalled: Bool = false,
    getStaticColors getStaticColorsNotCalled: Bool = false,
    getIsIcon getIsIconNotCalled: Bool = false,
    getShowSpace getShowSpaceNotCalled: Bool = false
) {
    ToggleGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeDynamicWithThemeAndIsOnCalled: !getDynamicColorsNotCalled
    )

    ToggleGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeStaticWithThemeCalled: !getStaticColorsNotCalled
    )

    ToggleGetIsIconUseCaseableMockTest.XCTCalled(
        stub.getIsIconUseCaseMock,
        executeUIWithIsOnOffSwitchLabelsEnabledAndContrastCalled: !getIsIconNotCalled
    )

    ToggleGetShowSpaceUseCaseableMockTest.XCTCalled(
        stub.getShowSpaceUseCaseMock,
        executeWithIsOnCalled: !getShowSpaceNotCalled
    )

    // Never called
    ToggleGetIsIconUseCaseableMockTest.XCTCalled(
        stub.getIsIconUseCaseMock,
        executeWithIsOnOffSwitchLabelsEnabledAndContrastCalled: false
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherDynamicColors: ToggleDynamicColors? = nil,
    otherStaticColors: ToggleStaticColors? = nil,
    otherIsIcon: Bool? = nil,
    otherShowSpace: ToggleSpace? = nil
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
    XCTAssertEqual(
        viewModel.showSpace,
        otherShowSpace ?? stub.expectedShowSpace,
        "Wrong showSpace value"
    )
}
