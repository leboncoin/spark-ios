//
//  TabViewModelTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import UIKit

@testable import SparkComponentTab
@_spi(SI_SPI) @testable import SparkComponentTabTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting

@MainActor
@Suite("Tab ViewModel Tests")
struct TabViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.intent == nil)
        #expect(viewModel.size == nil)
        #expect(viewModel.isEnabled == nil)

        expectEqualToExpected(
            on: stub,
            otherLinesColors: TabLinesColors(),
            otherAccessibilityColors: TabAccessibilityColors(),
            otherSizes: TabSizes(),
            otherLayout: TabLayout(),
            otherDim: 0
        )

        expectNotCalled(
            on: stub,
            getLinesColorsUseCase: true,
            getAccessibilityColorsUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true
        )
    }

    // MARK: - Setup

    @Test("Setup should call all use cases")
    func setupShouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        TabGetLinesColorsUseCaseableMockTest.expect(
            stub.getLinesColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedLinesColors
        )

        TabAccessibilityColorsUseCaseableMockTest.expect(
            stub.getAccessibilityColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedAccessibilityColors
        )

        TabGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLayout
        )

        TabGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedSizes
        )

        TabGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update all properties")
    func themeChangedShouldUpdateAllProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = newTheme

        // THEN
        expectEqualToExpected(on: stub)

        TabGetLinesColorsUseCaseableMockTest.expect(
            stub.getLinesColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedLinesColors
        )

        TabAccessibilityColorsUseCaseableMockTest.expect(
            stub.getAccessibilityColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedAccessibilityColors
        )

        TabGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLayout
        )

        TabGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedSizes
        )

        TabGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
    }

    @Test("Intent changed should update lines colors and accessibility colors only")
    func intentChangedShouldUpdateLinesColorsAndAccessibilityColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = TabIntent.main

        // WHEN
        viewModel.intent = newIntent

        // THEN
        expectEqualToExpected(on: stub)

        TabGetLinesColorsUseCaseableMockTest.expect(
            stub.getLinesColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedLinesColors
        )

        TabAccessibilityColorsUseCaseableMockTest.expect(
            stub.getAccessibilityColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedAccessibilityColors
        )

        expectNotCalled(
            on: stub,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true
        )
    }

    @Test("Size changed should update sizes only")
    func sizeChangedShouldUpdateSizesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize = TabSize.small

        // WHEN
        viewModel.size = newSize

        // THEN
        expectEqualToExpected(on: stub)

        TabGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: newSize,
            expectedReturnValue: stub.expectedSizes
        )

        expectNotCalled(
            on: stub,
            getLinesColorsUseCase: true,
            getAccessibilityColorsUseCase: true,
            getLayoutUseCase: true,
            getDimUseCase: true
        )
    }

    @Test("Is enabled changed should update dim only")
    func isEnabledChangedShouldUpdateDimOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsEnabled = false

        // WHEN
        viewModel.isEnabled = newIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        TabGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: newIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        expectNotCalled(
            on: stub,
            getLinesColorsUseCase: true,
            getAccessibilityColorsUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = stub.givenIntent.otherRandom
        viewModel.size = stub.givenSize.otherRandom
        viewModel.isEnabled = false

        // THEN
        expectEqualToExpected(
            on: stub,
            otherLinesColors: TabLinesColors(),
            otherAccessibilityColors: TabAccessibilityColors(),
            otherSizes: TabSizes(),
            otherLayout: TabLayout(),
            otherDim: 0
        )

        expectNotCalled(
            on: stub,
            getLinesColorsUseCase: true,
            getAccessibilityColorsUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true
        )
    }

    @Test("Properties changed without value change should not call use cases")
    func propertiesChangedWithoutValueChangeShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.intent = stub.givenIntent
        viewModel.size = stub.givenSize
        viewModel.isEnabled = stub.givenIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getLinesColorsUseCase: true,
            getAccessibilityColorsUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true
        )
    }

    @Test("Properties changed with nil values should not call use cases")
    func propertiesChangedWithNilValuesShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = nil
        viewModel.intent = nil
        viewModel.size = nil
        viewModel.isEnabled = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getLinesColorsUseCase: true,
            getAccessibilityColorsUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: TabIntent = .support
    let givenSize: TabSize = .medium
    let givenIsEnabled: Bool = true

    // MARK: - Expected

    let expectedLinesColors = TabLinesColors(
        colorToken: ColorTokenGeneratedMock.blue(),
        selectedColorToken: ColorTokenGeneratedMock.red()
    )
    let expectedAccessibilityColors = TabAccessibilityColors(
        selectedTintColorToken: ColorTokenGeneratedMock.green(),
        selectedBackgroundColorToken: ColorTokenGeneratedMock.purple()
    )
    let expectedSizes = TabSizes(iconHeight: 16.0)
    let expectedLayout = TabLayout(
        verticalPadding: 8.0,
        horizontalPadding: 16.0,
        spacing: 8.0
    )
    let expectedDim: CGFloat = 0.0

    // MARK: - Use Case Mocks

    let getLinesColorsUseCaseMock: TabGetLinesColorsUseCaseableGeneratedMock
    let getAccessibilityColorsUseCaseMock: TabAccessibilityColorsUseCaseableGeneratedMock
    let getLayoutUseCaseMock: TabGetLayoutUseCaseableGeneratedMock
    let getSizesUseCaseMock: TabGetSizesUseCaseableGeneratedMock
    let getDimUseCaseMock: TabGetDimUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: TabViewModel

    // MARK: - Initialization

    init() {
        let getLinesColorsUseCaseMock = TabGetLinesColorsUseCaseableGeneratedMock()
        getLinesColorsUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedLinesColors

        let getAccessibilityColorsUseCaseMock = TabAccessibilityColorsUseCaseableGeneratedMock()
        getAccessibilityColorsUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedAccessibilityColors

        let getLayoutUseCaseMock = TabGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        let getSizesUseCaseMock = TabGetSizesUseCaseableGeneratedMock()
        getSizesUseCaseMock.executeWithThemeAndSizeReturnValue = self.expectedSizes

        let getDimUseCaseMock = TabGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        self.viewModel = TabViewModel(
            getLinesColorsUseCase: getLinesColorsUseCaseMock,
            getAccessibilityColorsUseCase: getAccessibilityColorsUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock,
            getSizesUseCase: getSizesUseCaseMock,
            getDimUseCase: getDimUseCaseMock
        )

        self.getLinesColorsUseCaseMock = getLinesColorsUseCaseMock
        self.getAccessibilityColorsUseCaseMock = getAccessibilityColorsUseCaseMock
        self.getLayoutUseCaseMock = getLayoutUseCaseMock
        self.getSizesUseCaseMock = getSizesUseCaseMock
        self.getDimUseCaseMock = getDimUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getLinesColorsUseCaseMock.reset()
        self.getAccessibilityColorsUseCaseMock.reset()
        self.getLayoutUseCaseMock.reset()
        self.getSizesUseCaseMock.reset()
        self.getDimUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension TabViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            size: stub.givenSize,
            isEnabled: stub.givenIsEnabled
        )
    }
}

private func expectNotCalled(
    on stub: Stub,
    getLinesColorsUseCase: Bool = false,
    getAccessibilityColorsUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    getSizesUseCase: Bool = false,
    getDimUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    TabGetLinesColorsUseCaseableMockTest.expectCalled(
        stub.getLinesColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getLinesColorsUseCase,
        sourceLocation: sourceLocation
    )

    TabAccessibilityColorsUseCaseableMockTest.expectCalled(
        stub.getAccessibilityColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getAccessibilityColorsUseCase,
        sourceLocation: sourceLocation
    )

    TabGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCase,
        sourceLocation: sourceLocation
    )

    TabGetSizesUseCaseableMockTest.expectCalled(
        stub.getSizesUseCaseMock,
        executeWithThemeAndSizeCalled: !getSizesUseCase,
        sourceLocation: sourceLocation
    )

    TabGetDimUseCaseableMockTest.expectCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherLinesColors: TabLinesColors? = nil,
    otherAccessibilityColors: TabAccessibilityColors? = nil,
    otherSizes: TabSizes? = nil,
    otherLayout: TabLayout? = nil,
    otherDim: CGFloat? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.linesColors == (otherLinesColors ?? stub.expectedLinesColors),
        "Wrong linesColors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.accessibilityColors == (otherAccessibilityColors ?? stub.expectedAccessibilityColors),
        "Wrong accessibilityColors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.sizes == (otherSizes ?? stub.expectedSizes),
        "Wrong sizes value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.layout == (otherLayout ?? stub.expectedLayout),
        "Wrong layout value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.dim == (otherDim ?? stub.expectedDim),
        "Wrong dim value",
        sourceLocation: sourceLocation
    )
}
