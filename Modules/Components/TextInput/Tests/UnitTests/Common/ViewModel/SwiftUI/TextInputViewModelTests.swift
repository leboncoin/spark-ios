//
//  TextInputViewModelTests.swift
//  SparkComponentTextInputTests
//
//  Created on 26/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTextInput
@_spi(SI_SPI) @testable import SparkComponentTextInputTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

final class TextInputViewModelTests: XCTestCase {

    // MARK: - Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN
        let stub = Stub()

        // WHEN
        let viewModel = stub.viewModel

        // THEN
        XCTAssertEqual(
            viewModel.borderLayout,
            .init(),
            "Wrong borderLayout value"
        )
        XCTAssertEqual(
            viewModel.colors,
            .init(),
            "Wrong colors value"
        )
        XCTAssertEqual(
            viewModel.dim,
            1,
            "Wrong dim value"
        )
        XCTAssertEqual(
            viewModel.font,
            .body,
            "Wrong font value"
        )
        XCTAssertEqual(
            viewModel.spacings,
            .init(),
            "Wrong spacings value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.XCTCallsCount(
            stub.getBorderLayoutUseCaseMock,
            executeWithThemeAndIsFocusedNumberOfCalls: 0
        )

        TextInputGetColorsUseCaseableMockTest.XCTCallsCount(
            stub.getColorsUseCaseMock,
            executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyNumberOfCalls: 0
        )

        TextInputGetDimUseCaseableMockTest.XCTCallsCount(
            stub.getDimUseCaseMock,
            executeWithThemeAndIsEnabledNumberOfCalls: 0
        )

        TextInputGetFontUseCaseableMockTest.XCTCallsCount(
            stub.getFontUseCaseMock,
            executeFontWithThemeNumberOfCalls: 0
        )

        TextInputGetSpacingsUseCaseableMockTest.XCTCallsCount(
            stub.getSpacingsUseCaseMock,
            executeWithThemeNumberOfCalls: 0
        )
        // **
    }

    func test_updateAll_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.updateAll(stub: stub)

        // THEN
        XCTAssertEqual(
            viewModel.borderLayout,
            stub.expectedBorderLayout,
            "Wrong borderLayout value"
        )
        XCTAssertEqual(
            viewModel.colors,
            stub.expectedColors,
            "Wrong colors value"
        )
        XCTAssertEqual(
            viewModel.dim,
            stub.expectedDim,
            "Wrong dim value"
        )
        XCTAssertEqual(
            viewModel.font,
            stub.expectedFont,
            "Wrong font value"
        )
        XCTAssertEqual(
            viewModel.spacings,
            stub.expectedSpacings,
            "Wrong spacings value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.XCTAssert(
            stub.getBorderLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsFocused: viewModel.isFocused,
            expectedReturnValue: stub.expectedBorderLayout
        )

        TextInputGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsFocused: viewModel.isFocused,
            givenIsEnabled: viewModel.isEnabled,
            givenIsReadOnly: viewModel.isReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        TextInputGetFontUseCaseableMockTest.XCTAssert(
            stub.getFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedFont
        )

        TextInputGetSpacingsUseCaseableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacings
        )
        // **
    }

    func test_themeChanged_shouldUpdateAllProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        XCTAssertEqual(
            viewModel.borderLayout,
            stub.expectedBorderLayout,
            "Wrong borderLayout value"
        )
        XCTAssertEqual(
            viewModel.colors,
            stub.expectedColors,
            "Wrong colors value"
        )
        XCTAssertEqual(
            viewModel.dim,
            stub.expectedDim,
            "Wrong dim value"
        )
        XCTAssertEqual(
            viewModel.font,
            stub.expectedFont,
            "Wrong font value"
        )
        XCTAssertEqual(
            viewModel.spacings,
            stub.expectedSpacings,
            "Wrong spacings value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.XCTAssert(
            stub.getBorderLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIsFocused: viewModel.isFocused,
            expectedReturnValue: stub.expectedBorderLayout
        )

        TextInputGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenIsFocused: viewModel.isFocused,
            givenIsEnabled: viewModel.isEnabled,
            givenIsReadOnly: viewModel.isReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        TextInputGetFontUseCaseableMockTest.XCTAssert(
            stub.getFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedFont
        )

        TextInputGetSpacingsUseCaseableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedSpacings
        )
        // **
    }

    func test_intentChanged_shouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenIntent = TextInputIntent.success

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        XCTAssertEqual(
            viewModel.colors,
            stub.expectedColors,
            "Wrong colors value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.XCTCallsCount(
            stub.getBorderLayoutUseCaseMock,
            executeWithThemeAndIsFocusedNumberOfCalls: 0
        )

        TextInputGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenIsFocused: viewModel.isFocused,
            givenIsEnabled: viewModel.isEnabled,
            givenIsReadOnly: viewModel.isReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.XCTCallsCount(
            stub.getDimUseCaseMock,
            executeWithThemeAndIsEnabledNumberOfCalls: 0
        )

        TextInputGetFontUseCaseableMockTest.XCTCallsCount(
            stub.getFontUseCaseMock,
            executeFontWithThemeNumberOfCalls: 0
        )

        TextInputGetSpacingsUseCaseableMockTest.XCTCallsCount(
            stub.getSpacingsUseCaseMock,
            executeWithThemeNumberOfCalls: 0
        )
        // **
    }

    func test_isFocusedChanged_shouldUpdateColorsAndBorderLayout() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenIsFocused = true

        // WHEN
        viewModel.isFocused = givenIsFocused

        // THEN
        XCTAssertEqual(
            viewModel.borderLayout,
            .init(),
            "Wrong borderLayout value"
        )
        XCTAssertEqual(
            viewModel.colors,
            stub.expectedColors,
            "Wrong colors value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.XCTAssert(
            stub.getBorderLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsFocused: givenIsFocused,
            expectedReturnValue: stub.expectedBorderLayout
        )

        TextInputGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: viewModel.intent,
            givenIsFocused: givenIsFocused,
            givenIsEnabled: viewModel.isEnabled,
            givenIsReadOnly: viewModel.isReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.XCTCallsCount(
            stub.getDimUseCaseMock,
            executeWithThemeAndIsEnabledNumberOfCalls: 0
        )

        TextInputGetFontUseCaseableMockTest.XCTCallsCount(
            stub.getFontUseCaseMock,
            executeFontWithThemeNumberOfCalls: 0
        )

        TextInputGetSpacingsUseCaseableMockTest.XCTCallsCount(
            stub.getSpacingsUseCaseMock,
            executeWithThemeNumberOfCalls: 0
        )
        // **
    }

    func test_isEnabledChanged_shouldUpdateColorsAndDim() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenIsEnabled = true

        // WHEN
        viewModel.isEnabled = givenIsEnabled

        // THEN
        XCTAssertEqual(
            viewModel.colors,
            stub.expectedColors,
            "Wrong colors value"
        )
        XCTAssertEqual(
            viewModel.dim,
            stub.expectedDim,
            "Wrong dim value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.XCTCallsCount(
            stub.getBorderLayoutUseCaseMock,
            executeWithThemeAndIsFocusedNumberOfCalls: 0
        )

        TextInputGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: viewModel.intent,
            givenIsFocused: viewModel.isFocused,
            givenIsEnabled: givenIsEnabled,
            givenIsReadOnly: viewModel.isReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        TextInputGetFontUseCaseableMockTest.XCTCallsCount(
            stub.getFontUseCaseMock,
            executeFontWithThemeNumberOfCalls: 0
        )

        TextInputGetSpacingsUseCaseableMockTest.XCTCallsCount(
            stub.getSpacingsUseCaseMock,
            executeWithThemeNumberOfCalls: 0
        )
        // **
    }

    func test_isReadOnlyChanged_shouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenIsReadOnly = true

        // WHEN
        viewModel.isReadOnly = givenIsReadOnly

        // THEN
        XCTAssertEqual(
            viewModel.colors,
            stub.expectedColors,
            "Wrong colors value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.XCTCallsCount(
            stub.getBorderLayoutUseCaseMock,
            executeWithThemeAndIsFocusedNumberOfCalls: 0
        )

        TextInputGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: viewModel.intent,
            givenIsFocused: viewModel.isFocused,
            givenIsEnabled: viewModel.isEnabled,
            givenIsReadOnly: givenIsReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.XCTCallsCount(
            stub.getDimUseCaseMock,
            executeWithThemeAndIsEnabledNumberOfCalls: 0
        )

        TextInputGetFontUseCaseableMockTest.XCTCallsCount(
            stub.getFontUseCaseMock,
            executeFontWithThemeNumberOfCalls: 0
        )

        TextInputGetSpacingsUseCaseableMockTest.XCTCallsCount(
            stub.getSpacingsUseCaseMock,
            executeWithThemeNumberOfCalls: 0
        )
        // **
    }
}

// MARK: - Stub

private final class Stub: TextInputViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent = TextInputIntent.neutral
    let givenIsFocused: Bool = false
    let givenIsEnabled: Bool = false
    let givenIsReadOnly: Bool = false

    // MARK: - Expected Properties

    let expectedBorderLayout = TextInputBorderLayout()
    let expectedColors = TextInputColors()
    let expectedDim: CGFloat = 0.5
    let expectedFont: Font = .largeTitle
    let expectedSpacings = TextInputSpacings()

    // MARK: - Initialization

    init() {
        let getBorderLayoutUseCaseMock = TextInputGetBorderLayoutUseCaseableGeneratedMock()
        getBorderLayoutUseCaseMock.executeWithThemeAndIsFocusedReturnValue = self.expectedBorderLayout

        let getColorsUseCaseMock = TextInputGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyReturnValue = self.expectedColors

        let getDimUseCaseMock = TextInputGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getFontUseCaseMock = TextInputGetFontUseCaseableGeneratedMock()
        getFontUseCaseMock.executeFontWithThemeReturnValue = self.expectedFont

        let getSpacingsUseCaseMock = TextInputGetSpacingsUseCaseableGeneratedMock()
        getSpacingsUseCaseMock.executeWithThemeReturnValue = self.expectedSpacings

        let viewModel = TextInputViewModel(
            getBorderLayoutUseCase: getBorderLayoutUseCaseMock,
            getColorsUseCase: getColorsUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getFontUseCase: getFontUseCaseMock,
            getSpacingsUseCase: getSpacingsUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getBorderLayoutUseCaseMock: getBorderLayoutUseCaseMock,
            getColorsUseCaseMock: getColorsUseCaseMock,
            getDimUseCaseMock: getDimUseCaseMock,
            getFontUseCaseMock: getFontUseCaseMock,
            getSpacingsUseCaseMock: getSpacingsUseCaseMock
        )
    }
}

// MARK: - Extension

private extension TextInputViewModel {

    func updateAll(stub: Stub) {
        self.updateAll(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            isReadOnly: stub.givenIsReadOnly,
            isFocused: stub.givenIsFocused,
            isEnabled: stub.givenIsEnabled
        )
    }
}
