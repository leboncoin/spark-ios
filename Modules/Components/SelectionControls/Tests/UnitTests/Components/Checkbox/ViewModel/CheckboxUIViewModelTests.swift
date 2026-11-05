//
//  CheckboxUIViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 09/09/2025.
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
@Suite("Checkbox UI ViewModel Tests")
struct CheckboxUIViewModelTests {

    // MARK: - Initialization Tests

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init(),
            otherIsIcon: false
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getNewSelectedValue: true
        )
    }

    // MARK: - Load Tests

    @Test("Load should call all use cases except animation type")
    func loadShouldCallAllUseCasesExceptAnimationType() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.load(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getNewSelectedValue: true
        )

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: .default,
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
            givenSelectionState: .default,
            expectedReturnValue: stub.expectedIsIcon
        )
        // **
    }

    // MARK: - Setter Tests

    @Test("Theme changed should update some properties")
    func themeChangedShouldUpdateSomeProperties() {
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
        expectNotCalled(
            on: stub,
            getIsIcon: true,
            getNewSelectedValue: true
        )

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: .default,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedStaticColors
        )
        // **
    }

    @Test("Intent changed should update some properties")
    func intentChangedShouldUpdateSomeProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenIntent: CheckboxIntent = .error

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getIsIcon: true,
            getNewSelectedValue: true
        )

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenSelectionState: .default,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            expectedReturnValue: stub.expectedStaticColors
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
        viewModel.intent = stub.givenIntent
        viewModel.selectedValueChanged(oldValue: .default)

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getNewSelectedValue: true
        )
    }

    @Test("All setter without load before")
    func allSetterWithoutLoadBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .error
        viewModel.selectedValueChanged(oldValue: .selected)

        // THEN
        expectEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init(),
            otherIsIcon: false
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getNewSelectedValue: true
        )
    }

    // MARK: - Action

    @Test("Toggle")
    func toggle() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.toggle()

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getStaticColors: true
        )

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: stub.expectedNewSelectedValue,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetIsIconUseCaseableMockTest.expect(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: stub.expectedNewSelectedValue,
            expectedReturnValue: stub.expectedIsIcon
        )

        CheckboxGetNewSelectedValueUseCaseableMockTest.expect(
            stub.getNewSelectedValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: .default,
            givenIsEnabled: true,
            expectedReturnValue: stub.expectedNewSelectedValue
        )
        // **
    }

    @Test("Toggle when get new selected value use case return nil")
    func toggleWhenGetNewSelectedValueUseCaseReturnNil() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        stub.getNewSelectedValueUseCaseMock.executeWithSelectionStateAndIsEnabledReturnValue = nil

        // WHEN
        viewModel.toggle()

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true
        )

        CheckboxGetNewSelectedValueUseCaseableMockTest.expect(
            stub.getNewSelectedValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSelectionState: .default,
            givenIsEnabled: true,
            expectedReturnValue: nil
        )
        // **
    }

    @Test("Selected value changed")
    func selectedValueChanged() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.selectedValueChanged(oldValue: .selected)

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getStaticColors: true,
            getNewSelectedValue: true
        )

        CheckboxGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenSelectionState: .default,
            expectedReturnValue: stub.expectedDynamicColors
        )

        CheckboxGetIsIconUseCaseableMockTest.expect(
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

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getDynamicColors getDynamicColorsNotCalled: Bool = false,
    getStaticColors getStaticColorsNotCalled: Bool = false,
    getIsIcon getIsIconNotCalled: Bool = false,
    getNewSelectedValue getNewSelectedValueNotCalled: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    CheckboxGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeDynamicWithThemeAndIntentAndSelectionStateCalled: !getDynamicColorsNotCalled,
        sourceLocation: sourceLocation
    )

    CheckboxGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeStaticWithThemeAndIntentCalled: !getStaticColorsNotCalled,
        sourceLocation: sourceLocation
    )

    CheckboxGetIsIconUseCaseableMockTest.expectCalled(
        stub.getIsIconUseCaseMock,
        executeWithSelectionStateCalled: !getIsIconNotCalled,
        sourceLocation: sourceLocation
    )

    CheckboxGetNewSelectedValueUseCaseableMockTest.expectCalled(
        stub.getNewSelectedValueUseCaseMock,
        executeWithSelectionStateAndIsEnabledCalled: !getNewSelectedValueNotCalled,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherDynamicColors: CheckboxDynamicColors? = nil,
    otherStaticColors: CheckboxStaticColors? = nil,
    otherIsIcon: Bool? = nil,
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
}
