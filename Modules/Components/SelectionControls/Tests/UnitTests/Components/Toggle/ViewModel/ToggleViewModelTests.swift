//
//  ToggleViewModelTests.swift
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
@Suite("Toggle ViewModel Tests")
struct ToggleViewModelTests {

    // MARK: - Initialization Test

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
            getIsIcon: true
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

        // **
        // UseCase Calls Count
        ToggleGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsOn: stub.givenIsOn,
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
        // **
    }

    // MARK: - Setter

    @Test("Theme changed should update all properties except is icon")
    func themeChangedShouldUpdateAllPropertiesExceptIsIcon() {
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

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getIsIcon: true
        )

        ToggleGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIsOn: stub.givenIsOn,
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

    @Test("Is on changed should update dynamic colors")
    func isOnChangedShouldUpdateDynamicColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsOn = false

        // WHEN
        viewModel.isOn = givenIsOn

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getStaticColors: true,
            getIsIcon: true
        )

        ToggleGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsOn: givenIsOn,
            expectedReturnValue: stub.expectedDynamicColors
        )
        // **
    }

    @Test("Is on off switch labels enabled changed should update is icon")
    func isOnOffSwitchLabelsEnabledChangedShouldUpdateIsIcon() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
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
            getStaticColors: true
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

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenContrast = ColorSchemeContrast.increased

        // WHEN
        viewModel.contrast = givenContrast

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true
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

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.isOn = stub.givenIsOn
        viewModel.isOnOffSwitchLabelsEnabled = stub.givenIsOnOffSwitchLabelsEnabled
        viewModel.contrast = stub.givenContrast

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getIsIcon: true
        )
    }

    @Test("All setter without setup before")
    func allSetterWithoutSetupBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.isOn = false
        viewModel.isOnOffSwitchLabelsEnabled = true
        viewModel.contrast = .increased

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
            getIsIcon: true
        )
    }
}

// MARK: - Stub

private final class Stub: ToggleViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIsOn = true
    let givenIsOnOffSwitchLabelsEnabled: Bool = false
    let givenContrast: ColorSchemeContrast = .standard

    // MARK: - Expected Properties

    let expectedDynamicColors = ToggleDynamicColors()
    let expectedStaticColors = ToggleStaticColors()
    let expectedIsIcon = true

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = ToggleGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeStaticWithThemeReturnValue = self.expectedStaticColors
        getColorsUseCaseMock.executeDynamicWithThemeAndIsOnReturnValue = self.expectedDynamicColors

        let getIsIconUseCaseMock = ToggleGetIsIconUseCaseableGeneratedMock()
        getIsIconUseCaseMock.executeWithIsOnOffSwitchLabelsEnabledAndContrastReturnValue = self.expectedIsIcon

        let viewModel = ToggleViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getIsIconUseCase: getIsIconUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getColorsUseCaseMock: getColorsUseCaseMock,
            getIsIconUseCaseMock: getIsIconUseCaseMock
        )
    }
}

// MARK: - Extension

private extension ToggleViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            isOn: stub.givenIsOn,
            isOnOffSwitchLabelsEnabled: stub.givenIsOnOffSwitchLabelsEnabled,
            contrast: stub.givenContrast,
            isEnabled: false,
            isCustomLabel: false
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getDynamicColors getDynamicColorsNotCalled: Bool = false,
    getStaticColors getStaticColorsNotCalled: Bool = false,
    getIsIcon getIsIconNotCalled: Bool = false,
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
        executeWithIsOnOffSwitchLabelsEnabledAndContrastCalled: !getIsIconNotCalled,
        sourceLocation: sourceLocation
    )

    // Never called
    ToggleGetIsIconUseCaseableMockTest.expectCalled(
        stub.getIsIconUseCaseMock,
        executeUIWithIsOnOffSwitchLabelsEnabledAndContrastCalled: false,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherDynamicColors: ToggleDynamicColors? = nil,
    otherStaticColors: ToggleStaticColors? = nil,
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
