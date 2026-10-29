//
//  ToggleUIViewModelTests.swift
//  SparkComponentSelectionControlsTests
//
//  Created by robin.lemaire on 10/07/2025.
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
@Suite("Toggle UI ViewModel Tests")
struct ToggleUIViewModelTests {

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
            otherIsIcon: false,
            otherShowSpace: .left
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getShowSpace: true
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
        ToggleGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        ToggleGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedStaticColors
        )

        ToggleGetIsIconUseCaseableMockTest.expect(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOnOffSwitchLabelsEnabled: stub.givenIsOnOffSwitchLabelsEnabled,
            givenContrast: stub.givenContrast,
            expectedReturnValue: stub.expectedIsIcon
        )

        ToggleGetShowSpaceUseCaseableMockTest.expect(
            stub.getShowSpaceUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOn: false,
            expectedReturnValue: stub.expectedShowSpace
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
            getShowSpace: true
        )

        ToggleGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        ToggleGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedStaticColors
        )
        // **
    }

    @Test("Is on off switch labels enabled changed should update is icon")
    func isOnOffSwitchLabelsEnabledChangedShouldUpdateIsIcon() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenIsOnOffSwitchLabelsEnabled = true

        // WHEN
        viewModel.isOnOffSwitchLabelsEnabled = givenIsOnOffSwitchLabelsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSpace: true
        )

        ToggleGetIsIconUseCaseableMockTest.expect(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOnOffSwitchLabelsEnabled: givenIsOnOffSwitchLabelsEnabled,
            givenContrast: stub.givenContrast,
            expectedReturnValue: stub.expectedIsIcon
        )
        // **
    }

    @Test("Contrast changed should update is icon")
    func contrastChangedShouldUpdateIsIcon() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenContrast = UIAccessibilityContrast.high

        // WHEN
        viewModel.contrast = givenContrast

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSpace: true
        )

        ToggleGetIsIconUseCaseableMockTest.expect(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOnOffSwitchLabelsEnabled: stub.givenIsOnOffSwitchLabelsEnabled,
            givenContrast: givenContrast,
            expectedReturnValue: stub.expectedIsIcon
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
        viewModel.selectedValueChanged(oldValue: false)
        viewModel.isOnOffSwitchLabelsEnabled = stub.givenIsOnOffSwitchLabelsEnabled
        viewModel.contrast = stub.givenContrast

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getShowSpace: true
        )
    }

    @Test("All setter without load before")
    func allSetterWithoutLoadBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.isOnOffSwitchLabelsEnabled = true
        viewModel.contrast = .high

        // THEN
        expectEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init(),
            otherIsIcon: false,
            otherShowSpace: .left
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true,
            getShowSpace: true
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

        ToggleGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsOn: true,
            expectedReturnValue: stub.expectedDynamicColors
        )

        ToggleGetIsIconUseCaseableMockTest.expect(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOnOffSwitchLabelsEnabled: stub.givenIsOnOffSwitchLabelsEnabled,
            givenContrast: stub.givenContrast,
            expectedReturnValue: stub.expectedIsIcon
        )

        ToggleGetShowSpaceUseCaseableMockTest.expect(
            stub.getShowSpaceUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOn: true,
            expectedReturnValue: stub.expectedShowSpace
        )
        // **
    }

    @Test("Toggle when is enabled is false")
    func toggleWhenIsEnabledIsFalse() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        viewModel.isEnabled = false

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
            getIsIcon: true,
            getShowSpace: true
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
        viewModel.selectedValueChanged(oldValue: true)

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getStaticColors: true
        )

        ToggleGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        ToggleGetIsIconUseCaseableMockTest.expect(
            stub.getIsIconUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsOnOffSwitchLabelsEnabled: stub.givenIsOnOffSwitchLabelsEnabled,
            givenContrast: stub.givenContrast,
            expectedReturnValue: stub.expectedIsIcon
        )

        ToggleGetShowSpaceUseCaseableMockTest.expect(
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

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getDynamicColors getDynamicColorsNotCalled: Bool = false,
    getStaticColors getStaticColorsNotCalled: Bool = false,
    getIsIcon getIsIconNotCalled: Bool = false,
    getShowSpace getShowSpaceNotCalled: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    ToggleGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeDynamicWithThemeAndIsOnCalled: !getDynamicColorsNotCalled,
        sourceLocation: sourceLocation
    )

    ToggleGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeStaticWithThemeCalled: !getStaticColorsNotCalled,
        sourceLocation: sourceLocation
    )

    ToggleGetIsIconUseCaseableMockTest.expectCalled(
        stub.getIsIconUseCaseMock,
        executeUIWithIsOnOffSwitchLabelsEnabledAndContrastCalled: !getIsIconNotCalled,
        sourceLocation: sourceLocation
    )

    ToggleGetShowSpaceUseCaseableMockTest.expectCalled(
        stub.getShowSpaceUseCaseMock,
        executeWithIsOnCalled: !getShowSpaceNotCalled,
        sourceLocation: sourceLocation
    )

    // Never called
    ToggleGetIsIconUseCaseableMockTest.expectCalled(
        stub.getIsIconUseCaseMock,
        executeWithIsOnOffSwitchLabelsEnabledAndContrastCalled: false,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherDynamicColors: ToggleDynamicColors? = nil,
    otherStaticColors: ToggleStaticColors? = nil,
    otherIsIcon: Bool? = nil,
    otherShowSpace: ToggleSpace? = nil,
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
        viewModel.showSpace == (otherShowSpace ?? stub.expectedShowSpace),
        "Wrong showSpace value",
        sourceLocation: sourceLocation
    )
}
