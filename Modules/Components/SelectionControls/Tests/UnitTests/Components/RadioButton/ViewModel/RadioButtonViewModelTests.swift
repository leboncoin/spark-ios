//
//  RadioButtonViewModelTests.swift
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
@Suite("Radio Button ViewModel Tests")
struct RadioButtonViewModelTests {

    // MARK: - Initialization Test

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init()
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true
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
        RadioButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsOn: stub.givenIsSelected,
            expectedReturnValue: stub.expectedDynamicColors
        )

        RadioButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedStaticColors
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
            on: stub
        )

        RadioButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenIsOn: stub.givenIsSelected,
            expectedReturnValue: stub.expectedDynamicColors
        )

        RadioButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedStaticColors
        )
        // **
    }

    @Test("Intent changed should update colors")
    func intentChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIntent = RadioButtonIntent.error

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub
        )

        RadioButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenIsOn: stub.givenIsSelected,
            expectedReturnValue: stub.expectedDynamicColors
        )
        // **
    }

    @Test("Is selected changed should update dynamic colors")
    func isSelectedChangedShouldUpdateDynamicColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsSelected = false

        // WHEN
        viewModel.isSelected = givenIsSelected

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getStaticColors: true
        )

        RadioButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsOn: givenIsSelected,
            expectedReturnValue: stub.expectedDynamicColors
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
        viewModel.intent = stub.givenIntent
        viewModel.isSelected = stub.givenIsSelected

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true
        )
    }

    @Test("All setter without setup before")
    func allSetterWithoutSetupBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .error
        viewModel.isSelected = false

        // THEN
        expectEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init()
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true
        )
    }
}

// MARK: - Stub

private final class Stub: RadioButtonViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent = RadioButtonIntent.default
    let givenIsSelected = true

    // MARK: - Expected Properties

    let expectedDynamicColors = RadioButtonDynamicColors()
    let expectedStaticColors = RadioButtonStaticColors()

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = RadioButtonGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeStaticWithThemeAndIntentReturnValue = self.expectedStaticColors
        getColorsUseCaseMock.executeDynamicWithThemeAndIntentAndIsOnReturnValue = self.expectedDynamicColors

        let viewModel = RadioButtonViewModel(
            getColorsUseCase: getColorsUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getColorsUseCaseMock: getColorsUseCaseMock
        )
    }
}

// MARK: - Extension

private extension RadioButtonViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            isSelected: stub.givenIsSelected,
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
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    RadioButtonGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeDynamicWithThemeAndIntentAndIsOnCalled: !getDynamicColorsNotCalled,
        sourceLocation: sourceLocation
    )

    RadioButtonGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeStaticWithThemeAndIntentCalled: !getStaticColorsNotCalled,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherDynamicColors: RadioButtonDynamicColors? = nil,
    otherStaticColors: RadioButtonStaticColors? = nil,
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
}
