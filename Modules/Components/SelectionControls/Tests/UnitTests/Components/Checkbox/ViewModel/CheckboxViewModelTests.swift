//
//  CheckboxViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 22/07/2025.
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
@Suite("Checkbox ViewModel Tests")
struct CheckboxViewModelTests {

    // MARK: - Initialization Test

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherDynamicColors: CheckboxDynamicColors(),
            otherStaticColors: CheckboxStaticColors(),
            otherIsIcon: false,
            otherToggleOpacities: CheckboxToggleOpacities()
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getColorsUseCaseDynamic: true,
            getColorsUseCaseStatic: true,
            getIsIconUseCase: true,
            getToggleOpacitiesUseCase: true
        )
    }

    // MARK: - Setup Tests

    @Test("Setup should call all use cases")
    func setupShouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: stub.givenSelectionState,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedStaticColors
        )

        CheckboxGetIsIconUseCaseableMockTest.expect(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: stub.givenSelectionState,
            expectedReturnValue: stub.expectedIsIcon
        )

        CheckboxGetToggleOpacitiesUseCaseableMockTest.expect(
            stub.getToggleOpacitiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: stub.givenSelectionState,
            expectedReturnValue: stub.expectedToggleOpacities
        )
    }

    // MARK: - Property Change Tests

    @Test("Theme changed should update colors")
    func themeChangedShouldUpdateColors() {
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

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: stub.givenSelectionState,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedStaticColors
        )

        expectNotCalled(
            on: stub,
            getIsIconUseCase: true,
            getToggleOpacitiesUseCase: true
        )
    }

    @Test("Intent changed should update colors")
    func intentChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIntent = CheckboxIntent.error

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        expectEqualToExpected(on: stub)

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenSelectionState: stub.givenSelectionState,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            expectedReturnValue: stub.expectedStaticColors
        )

        expectNotCalled(
            on: stub,
            getIsIconUseCase: true,
            getToggleOpacitiesUseCase: true
        )
    }

    @Test("Selection state changed should update dynamic colors and is icon")
    func selectionStateChangedShouldUpdateDynamicColorsAndIsIcon() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenSelectionState = CheckboxSelectionState.indeterminate

        // WHEN
        viewModel.selectionState = givenSelectionState

        // THEN
        expectEqualToExpected(on: stub)

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: givenSelectionState,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetIsIconUseCaseableMockTest.expect(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: givenSelectionState,
            expectedReturnValue: stub.expectedIsIcon
        )

        CheckboxGetToggleOpacitiesUseCaseableMockTest.expect(
            stub.getToggleOpacitiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: givenSelectionState,
            expectedReturnValue: stub.expectedToggleOpacities
        )

        expectNotCalled(on: stub, getColorsUseCaseStatic: true)
    }

    @Test("Properties changed without setup before should not call use cases")
    func propertiesChangedWithoutSetupBeforeShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.intent = CheckboxIntent.error
        viewModel.selectionState = CheckboxSelectionState.selected

        // THEN
        expectEqualToExpected(
            on: stub,
            otherDynamicColors: CheckboxDynamicColors(),
            otherStaticColors: CheckboxStaticColors(),
            otherIsIcon: false,
            otherToggleOpacities: CheckboxToggleOpacities()
        )

        expectNotCalled(
            on: stub,
            getColorsUseCaseDynamic: true,
            getColorsUseCaseStatic: true,
            getIsIconUseCase: true,
            getToggleOpacitiesUseCase: true
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
        viewModel.intent = stub.givenIntent
        viewModel.selectionState = stub.givenSelectionState

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
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

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getColorsUseCaseDynamic getColorsUseCaseDynamicNotCalled: Bool = false,
    getColorsUseCaseStatic getColorsUseCaseStaticNotCalled: Bool = false,
    getIsIconUseCase getIsIconUseCaseNotCalled: Bool = false,
    getToggleOpacitiesUseCase getToggleOpacitiesUseCaeNotCalled: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    CheckboxGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeDynamicWithThemeAndIntentAndSelectionStateCalled: !getColorsUseCaseDynamicNotCalled,
        sourceLocation: sourceLocation
    )

    CheckboxGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeStaticWithThemeAndIntentCalled: !getColorsUseCaseStaticNotCalled,
        sourceLocation: sourceLocation
    )

    CheckboxGetIsIconUseCaseableMockTest.expectCalled(
        stub.getIsIconUseCaseMock,
        executeWithSelectionStateCalled: !getIsIconUseCaseNotCalled,
        sourceLocation: sourceLocation
    )

    CheckboxGetToggleOpacitiesUseCaseableMockTest.expectCalled(
        stub.getToggleOpacitiesUseCaseMock,
        executeWithSelectionStateCalled: !getToggleOpacitiesUseCaeNotCalled,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherDynamicColors: CheckboxDynamicColors? = nil,
    otherStaticColors: CheckboxStaticColors? = nil,
    otherIsIcon: Bool? = nil,
    otherToggleOpacities: CheckboxToggleOpacities? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.dynamicColors == (otherDynamicColors ?? stub.expectedDynamicColors),
        "Wrong dynamicColors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.staticColors == (otherStaticColors ?? stub.expectedStaticColors),
        "Wrong staticColors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.isIcon == (otherIsIcon ?? stub.expectedIsIcon),
        "Wrong isIcon value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.toggleOpacities == (otherToggleOpacities ?? stub.expectedToggleOpacities),
        "Wrong toggleOpacities value",
        sourceLocation: sourceLocation
    )
}
