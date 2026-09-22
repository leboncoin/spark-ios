//
//  TabViewModelTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import UIKit

@testable import SparkComponentTab
@_spi(SI_SPI) @testable import SparkComponentTabTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting

final class TabViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        XCTAssertNil(viewModel.theme)
        XCTAssertNil(viewModel.intent)
        XCTAssertNil(viewModel.size)
        XCTAssertNil(viewModel.isEnabled)

        XCTAssertEqualToExpected(
            on: stub,
            otherLinesColors: TabLinesColors(),
            otherAccessibilityColors: TabAccessibilityColors(),
            otherSizes: TabSizes(),
            otherLayout: TabLayout(),
            otherDim: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getLinesColorsUseCase: true,
            getAccessibilityColorsUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true
        )
    }

    // MARK: - Setup

    func test_setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TabGetLinesColorsUseCaseableMockTest.XCTAssert(
            stub.getLinesColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedLinesColors
        )

        TabAccessibilityColorsUseCaseableMockTest.XCTAssert(
            stub.getAccessibilityColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedAccessibilityColors
        )

        TabGetLayoutUseCaseableMockTest.XCTAssert(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLayout
        )

        TabGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedSizes
        )

        TabGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
    }

    // MARK: - Property Changes

    func test_themeChanged_shouldUpdateAllProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = newTheme

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TabGetLinesColorsUseCaseableMockTest.XCTAssert(
            stub.getLinesColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedLinesColors
        )

        TabAccessibilityColorsUseCaseableMockTest.XCTAssert(
            stub.getAccessibilityColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedAccessibilityColors
        )

        TabGetLayoutUseCaseableMockTest.XCTAssert(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLayout
        )

        TabGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedSizes
        )

        TabGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
    }

    func test_intentChanged_shouldUpdateLinesColorsAndAccessibilityColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = TabIntent.main

        // WHEN
        viewModel.intent = newIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TabGetLinesColorsUseCaseableMockTest.XCTAssert(
            stub.getLinesColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedLinesColors
        )

        TabAccessibilityColorsUseCaseableMockTest.XCTAssert(
            stub.getAccessibilityColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedAccessibilityColors
        )

        XCTAssertNotCalled(
            on: stub,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true
        )
    }

    func test_sizeChanged_shouldUpdateSizesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize = TabSize.small

        // WHEN
        viewModel.size = newSize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TabGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: newSize,
            expectedReturnValue: stub.expectedSizes
        )

        XCTAssertNotCalled(
            on: stub,
            getLinesColorsUseCase: true,
            getAccessibilityColorsUseCase: true,
            getLayoutUseCase: true,
            getDimUseCase: true
        )
    }

    func test_isEnabledChanged_shouldUpdateDimOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsEnabled = false

        // WHEN
        viewModel.isEnabled = newIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TabGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: newIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        XCTAssertNotCalled(
            on: stub,
            getLinesColorsUseCase: true,
            getAccessibilityColorsUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = stub.givenIntent.otherRandom
        viewModel.size = stub.givenSize.otherRandom
        viewModel.isEnabled = false

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherLinesColors: TabLinesColors(),
            otherAccessibilityColors: TabAccessibilityColors(),
            otherSizes: TabSizes(),
            otherLayout: TabLayout(),
            otherDim: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getLinesColorsUseCase: true,
            getAccessibilityColorsUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true
        )
    }

    func test_propertiesChanged_withoutValueChange_shouldNotCallUseCases() {
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
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getLinesColorsUseCase: true,
            getAccessibilityColorsUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true
        )
    }

    func test_propertiesChanged_withNilValues_shouldNotCallUseCases() {
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
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
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

private func XCTAssertNotCalled(
    on stub: Stub,
    getLinesColorsUseCase: Bool = false,
    getAccessibilityColorsUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    getSizesUseCase: Bool = false,
    getDimUseCase: Bool = false
) {
    TabGetLinesColorsUseCaseableMockTest.XCTCalled(
        stub.getLinesColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getLinesColorsUseCase
    )

    TabAccessibilityColorsUseCaseableMockTest.XCTCalled(
        stub.getAccessibilityColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getAccessibilityColorsUseCase
    )

    TabGetLayoutUseCaseableMockTest.XCTCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCase
    )

    TabGetSizesUseCaseableMockTest.XCTCalled(
        stub.getSizesUseCaseMock,
        executeWithThemeAndSizeCalled: !getSizesUseCase
    )

    TabGetDimUseCaseableMockTest.XCTCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherLinesColors: TabLinesColors? = nil,
    otherAccessibilityColors: TabAccessibilityColors? = nil,
    otherSizes: TabSizes? = nil,
    otherLayout: TabLayout? = nil,
    otherDim: CGFloat? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.linesColors,
        otherLinesColors ?? stub.expectedLinesColors,
        "Wrong linesColors value"
    )
    XCTAssertEqual(
        viewModel.accessibilityColors,
        otherAccessibilityColors ?? stub.expectedAccessibilityColors,
        "Wrong accessibilityColors value"
    )
    XCTAssertEqual(
        viewModel.sizes,
        otherSizes ?? stub.expectedSizes,
        "Wrong sizes value"
    )
    XCTAssertEqual(
        viewModel.layout,
        otherLayout ?? stub.expectedLayout,
        "Wrong layout value"
    )
    XCTAssertEqual(
        viewModel.dim,
        otherDim ?? stub.expectedDim,
        "Wrong dim value"
    )
}
