//
//  RadioButtonUIViewModelTests.swift
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
@Suite("Radio Button UI ViewModel Tests")
struct RadioButtonUIViewModelTests {

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
            otherShowSelectedDot: false
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSelectedDot: true
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
        RadioButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsOn: false,
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
            getShowSelectedDot: true
        )

        RadioButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenIsOn: false,
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

    @Test("Intent changed should update some properties")
    func intentChangedShouldUpdateSomeProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        let givenIntent: RadioButtonIntent = .error

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getShowSelectedDot: true
        )

        RadioButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        RadioButtonGetColorsUseCaseableMockTest.expect(
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
        viewModel.selectedValueChanged(oldValue: false)

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSelectedDot: true
        )
    }

    @Test("All setter without load before")
    func allSetterWithoutLoadBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .support
        viewModel.selectedValueChanged(oldValue: true)

        // THEN
        expectEqualToExpected(
            on: stub,
            otherDynamicColors: .init(),
            otherStaticColors: .init(),
            otherShowSelectedDot: false
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSelectedDot: true
        )
    }

    // MARK: - Action

    @Test("Toggle if possible")
    func toggleIfPossible() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load(stub: stub)
        stub.resetMockedData()

        // WHEN
        let toggled = viewModel.toggleIfPossible()

        // THEN
        #expect(toggled)

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
            givenIsOn: true,
            expectedReturnValue: stub.expectedDynamicColors
        )

        RadioButtonGetShowSelectedDotUseCaseableMockTest.expect(
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
        #expect(!toggled2)

        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDynamicColors: true,
            getStaticColors: true,
            getShowSelectedDot: true
        )
        // ***
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

        RadioButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsOn: false,
            expectedReturnValue: stub.expectedDynamicColors
        )

        RadioButtonGetShowSelectedDotUseCaseableMockTest.expect(
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

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getDynamicColors getDynamicColorsNotCalled: Bool = false,
    getStaticColors getStaticColorsNotCalled: Bool = false,
    getShowSelectedDot getShowSelectedDotNotCalled: Bool = false,
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

    RadioButtonGetShowSelectedDotUseCaseableMockTest.expectCalled(
        stub.getShowSelectedDotUseCaseMock,
        executeWithIsSelectedCalled: !getShowSelectedDotNotCalled,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherDynamicColors: RadioButtonDynamicColors? = nil,
    otherStaticColors: RadioButtonStaticColors? = nil,
    otherShowSelectedDot: Bool? = nil,
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
        viewModel.showSelectedDot == (otherShowSelectedDot ?? stub.expectedShowSelectedDot),
        "Wrong showSelectedDot value",
        sourceLocation: sourceLocation
    )
}
