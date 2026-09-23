//
//  CheckboxViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentSelectionControls
@_spi(SI_SPI) @testable import SparkComponentSelectionControlsTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

final class CheckboxViewModelTests: XCTestCase {

    // MARK: - Initialization Test

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherDynamicColors: CheckboxDynamicColors(),
            otherStaticColors: CheckboxStaticColors(),
            otherIsIcon: false,
            otherToggleOpacities: CheckboxToggleOpacities()
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getColorsUseCaseDynamic: true,
            getColorsUseCaseStatic: true,
            getIsIconUseCase: true,
            getToggleOpacitiesUseCase: true
        )
    }

    // MARK: - Setup Tests

    func test_setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: stub.givenSelectionState,
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
            givenSelectionState: stub.givenSelectionState,
            expectedReturnValue: stub.expectedIsIcon
        )

        CheckboxGetToggleOpacitiesUseCaseableMockTest.XCTAssert(
            stub.getToggleOpacitiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: stub.givenSelectionState,
            expectedReturnValue: stub.expectedToggleOpacities
        )
    }

    // MARK: - Property Change Tests

    func test_themeChanged_shouldUpdateColors() {
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

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: stub.givenSelectionState,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedStaticColors
        )

        XCTAssertNotCalled(
            on: stub,
            getIsIconUseCase: true,
            getToggleOpacitiesUseCase: true
        )
    }

    func test_intentChanged_shouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIntent = CheckboxIntent.error

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenSelectionState: stub.givenSelectionState,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            expectedReturnValue: stub.expectedStaticColors
        )

        XCTAssertNotCalled(
            on: stub,
            getIsIconUseCase: true,
            getToggleOpacitiesUseCase: true
        )
    }

    func test_selectionStateChanged_shouldUpdateDynamicColorsAndIsIcon() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenSelectionState = CheckboxSelectionState.indeterminate

        // WHEN
        viewModel.selectionState = givenSelectionState

        // THEN
        XCTAssertEqualToExpected(on: stub)

        CheckboxGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: givenSelectionState,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetIsIconUseCaseableMockTest.XCTAssert(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: givenSelectionState,
            expectedReturnValue: stub.expectedIsIcon
        )

        CheckboxGetToggleOpacitiesUseCaseableMockTest.XCTAssert(
            stub.getToggleOpacitiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: givenSelectionState,
            expectedReturnValue: stub.expectedToggleOpacities
        )

        XCTAssertNotCalled(on: stub, getColorsUseCaseStatic: true)
    }

    func test_propertiesChanged_withoutSetupBefore_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.intent = CheckboxIntent.error
        viewModel.selectionState = CheckboxSelectionState.selected

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherDynamicColors: CheckboxDynamicColors(),
            otherStaticColors: CheckboxStaticColors(),
            otherIsIcon: false,
            otherToggleOpacities: CheckboxToggleOpacities()
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCaseDynamic: true,
            getColorsUseCaseStatic: true,
            getIsIconUseCase: true,
            getToggleOpacitiesUseCase: true
        )
    }

    func test_propertiesChanged_withoutChange_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.intent = stub.givenIntent
        viewModel.selectionState = stub.givenSelectionState

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCaseDynamic: true,
            getColorsUseCaseStatic: true,
            getIsIconUseCase: true,
            getToggleOpacitiesUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub: CheckboxViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent = CheckboxIntent.default
    let givenSelectionState = CheckboxSelectionState.selected
    let givenIsEnabled = true
    let givenIsCustomLabel = false

    // MARK: - Expected Properties

    let expectedDynamicColors = CheckboxDynamicColors()
    let expectedStaticColors = CheckboxStaticColors()
    let expectedIsIcon = true
    let expectedToggleOpacities = CheckboxToggleOpacities()

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = CheckboxGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeStaticWithThemeAndIntentReturnValue = self.expectedStaticColors
        getColorsUseCaseMock.executeDynamicWithThemeAndIntentAndSelectionStateReturnValue = self.expectedDynamicColors

        let getIsIconUseCaseMock = CheckboxGetIsIconUseCaseableGeneratedMock()
        getIsIconUseCaseMock.executeWithSelectionStateReturnValue = self.expectedIsIcon

        let getToggleOpacitiesUseCaseMock = CheckboxGetToggleOpacitiesUseCaseableGeneratedMock()
        getToggleOpacitiesUseCaseMock.executeWithSelectionStateReturnValue = self.expectedToggleOpacities

        let viewModel = CheckboxViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getIsIconUseCase: getIsIconUseCaseMock,
            getToggleOpacitiesUseCase: getToggleOpacitiesUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getColorsUseCaseMock: getColorsUseCaseMock,
            getIsIconUseCaseMock: getIsIconUseCaseMock,
            getToggleOpacitiesUseCaseMock: getToggleOpacitiesUseCaseMock
        )
    }
}

// MARK: - Extension

private extension CheckboxViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            selectionState: stub.givenSelectionState,
            isEnabled: stub.givenIsEnabled,
            isCustomLabel: stub.givenIsCustomLabel
        )
    }
}

// MARK: - XCT Helpers

private func XCTAssertNotCalled(
    on stub: Stub,
    getColorsUseCaseDynamic getColorsUseCaseDynamicNotCalled: Bool = false,
    getColorsUseCaseStatic getColorsUseCaseStaticNotCalled: Bool = false,
    getIsIconUseCase getIsIconUseCaseNotCalled: Bool = false,
    getToggleOpacitiesUseCase getToggleOpacitiesUseCaeNotCalled: Bool = false
) {
    CheckboxGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeDynamicWithThemeAndIntentAndSelectionStateCalled: !getColorsUseCaseDynamicNotCalled
    )

    CheckboxGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeStaticWithThemeAndIntentCalled: !getColorsUseCaseStaticNotCalled
    )

    CheckboxGetIsIconUseCaseableMockTest.XCTCalled(
        stub.getIsIconUseCaseMock,
        executeWithSelectionStateCalled: !getIsIconUseCaseNotCalled
    )

    CheckboxGetToggleOpacitiesUseCaseableMockTest.XCTCalled(
        stub.getToggleOpacitiesUseCaseMock,
        executeWithSelectionStateCalled: !getToggleOpacitiesUseCaeNotCalled
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherDynamicColors: CheckboxDynamicColors? = nil,
    otherStaticColors: CheckboxStaticColors? = nil,
    otherIsIcon: Bool? = nil,
    otherToggleOpacities: CheckboxToggleOpacities? = nil
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
        viewModel.toggleOpacities,
        otherToggleOpacities ?? stub.expectedToggleOpacities,
        "Wrong toggleOpacities value"
    )
}
