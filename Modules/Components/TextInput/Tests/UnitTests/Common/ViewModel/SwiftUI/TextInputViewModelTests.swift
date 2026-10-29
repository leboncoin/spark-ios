//
//  TextInputViewModelTests.swift
//  SparkComponentTextInputTests
//
//  Created on 26/06/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentTextInput
@_spi(SI_SPI) @testable import SparkComponentTextInputTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

@MainActor
@Suite("TextInput ViewModel Tests")
struct TextInputViewModelTests {

    // MARK: - Tests

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN
        let stub = Stub()

        // WHEN
        let viewModel = stub.viewModel

        // THEN
        #expect(
            viewModel.borderLayout == .init(),
            "Wrong borderLayout value"
        )
        #expect(
            viewModel.colors == .init(),
            "Wrong colors value"
        )
        #expect(
            viewModel.dim == 1,
            "Wrong dim value"
        )
        #expect(
            viewModel.font == .body,
            "Wrong font value"
        )
        #expect(
            viewModel.spacings == .init(),
            "Wrong spacings value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.expectCallsCount(
            stub.getBorderLayoutUseCaseMock,
            executeWithThemeAndIsFocusedNumberOfCalls: 0
        )

        TextInputGetColorsUseCaseableMockTest.expectCallsCount(
            stub.getColorsUseCaseMock,
            executeWithThemeAndIntentAndIsFocusedAndIsEnabledAndIsReadOnlyNumberOfCalls: 0
        )

        TextInputGetDimUseCaseableMockTest.expectCallsCount(
            stub.getDimUseCaseMock,
            executeWithThemeAndIsEnabledNumberOfCalls: 0
        )

        TextInputGetFontUseCaseableMockTest.expectCallsCount(
            stub.getFontUseCaseMock,
            executeFontWithThemeNumberOfCalls: 0
        )

        TextInputGetSpacingsUseCaseableMockTest.expectCallsCount(
            stub.getSpacingsUseCaseMock,
            executeWithThemeNumberOfCalls: 0
        )
        // **
    }

    @Test("Update all should call all use cases")
    func updateAllShouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.updateAll(stub: stub)

        // THEN
        #expect(
            viewModel.borderLayout == stub.expectedBorderLayout,
            "Wrong borderLayout value"
        )
        #expect(
            viewModel.colors == stub.expectedColors,
            "Wrong colors value"
        )
        #expect(
            viewModel.dim == stub.expectedDim,
            "Wrong dim value"
        )
        #expect(
            viewModel.font == stub.expectedFont,
            "Wrong font value"
        )
        #expect(
            viewModel.spacings == stub.expectedSpacings,
            "Wrong spacings value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.expect(
            stub.getBorderLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsFocused: viewModel.isFocused,
            expectedReturnValue: stub.expectedBorderLayout
        )

        TextInputGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsFocused: viewModel.isFocused,
            givenIsEnabled: viewModel.isEnabled,
            givenIsReadOnly: viewModel.isReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        TextInputGetFontUseCaseableMockTest.expect(
            stub.getFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedFont
        )

        TextInputGetSpacingsUseCaseableMockTest.expect(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacings
        )
        // **
    }

    @Test("Theme changed should update all properties")
    func themeChangedShouldUpdateAllProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        #expect(
            viewModel.borderLayout == stub.expectedBorderLayout,
            "Wrong borderLayout value"
        )
        #expect(
            viewModel.colors == stub.expectedColors,
            "Wrong colors value"
        )
        #expect(
            viewModel.dim == stub.expectedDim,
            "Wrong dim value"
        )
        #expect(
            viewModel.font == stub.expectedFont,
            "Wrong font value"
        )
        #expect(
            viewModel.spacings == stub.expectedSpacings,
            "Wrong spacings value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.expect(
            stub.getBorderLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIsFocused: viewModel.isFocused,
            expectedReturnValue: stub.expectedBorderLayout
        )

        TextInputGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenIsFocused: viewModel.isFocused,
            givenIsEnabled: viewModel.isEnabled,
            givenIsReadOnly: viewModel.isReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        TextInputGetFontUseCaseableMockTest.expect(
            stub.getFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedFont
        )

        TextInputGetSpacingsUseCaseableMockTest.expect(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedSpacings
        )
        // **
    }

    @Test("Intent changed should update colors")
    func intentChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenIntent = TextInputIntent.success

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        #expect(
            viewModel.colors == stub.expectedColors,
            "Wrong colors value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.expectCallsCount(
            stub.getBorderLayoutUseCaseMock,
            executeWithThemeAndIsFocusedNumberOfCalls: 0
        )

        TextInputGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenIsFocused: viewModel.isFocused,
            givenIsEnabled: viewModel.isEnabled,
            givenIsReadOnly: viewModel.isReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.expectCallsCount(
            stub.getDimUseCaseMock,
            executeWithThemeAndIsEnabledNumberOfCalls: 0
        )

        TextInputGetFontUseCaseableMockTest.expectCallsCount(
            stub.getFontUseCaseMock,
            executeFontWithThemeNumberOfCalls: 0
        )

        TextInputGetSpacingsUseCaseableMockTest.expectCallsCount(
            stub.getSpacingsUseCaseMock,
            executeWithThemeNumberOfCalls: 0
        )
        // **
    }

    @Test("Is focused changed should update colors and border layout")
    func isFocusedChangedShouldUpdateColorsAndBorderLayout() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenIsFocused = true

        // WHEN
        viewModel.isFocused = givenIsFocused

        // THEN
        #expect(
            viewModel.borderLayout == .init(),
            "Wrong borderLayout value"
        )
        #expect(
            viewModel.colors == stub.expectedColors,
            "Wrong colors value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.expect(
            stub.getBorderLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsFocused: givenIsFocused,
            expectedReturnValue: stub.expectedBorderLayout
        )

        TextInputGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: viewModel.intent,
            givenIsFocused: givenIsFocused,
            givenIsEnabled: viewModel.isEnabled,
            givenIsReadOnly: viewModel.isReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.expectCallsCount(
            stub.getDimUseCaseMock,
            executeWithThemeAndIsEnabledNumberOfCalls: 0
        )

        TextInputGetFontUseCaseableMockTest.expectCallsCount(
            stub.getFontUseCaseMock,
            executeFontWithThemeNumberOfCalls: 0
        )

        TextInputGetSpacingsUseCaseableMockTest.expectCallsCount(
            stub.getSpacingsUseCaseMock,
            executeWithThemeNumberOfCalls: 0
        )
        // **
    }

    @Test("Is enabled changed should update colors and dim")
    func isEnabledChangedShouldUpdateColorsAndDim() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenIsEnabled = true

        // WHEN
        viewModel.isEnabled = givenIsEnabled

        // THEN
        #expect(
            viewModel.colors == stub.expectedColors,
            "Wrong colors value"
        )
        #expect(
            viewModel.dim == stub.expectedDim,
            "Wrong dim value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.expectCallsCount(
            stub.getBorderLayoutUseCaseMock,
            executeWithThemeAndIsFocusedNumberOfCalls: 0
        )

        TextInputGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: viewModel.intent,
            givenIsFocused: viewModel.isFocused,
            givenIsEnabled: givenIsEnabled,
            givenIsReadOnly: viewModel.isReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        TextInputGetFontUseCaseableMockTest.expectCallsCount(
            stub.getFontUseCaseMock,
            executeFontWithThemeNumberOfCalls: 0
        )

        TextInputGetSpacingsUseCaseableMockTest.expectCallsCount(
            stub.getSpacingsUseCaseMock,
            executeWithThemeNumberOfCalls: 0
        )
        // **
    }

    @Test("Is read only changed should update colors")
    func isReadOnlyChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenIsReadOnly = true

        // WHEN
        viewModel.isReadOnly = givenIsReadOnly

        // THEN
        #expect(
            viewModel.colors == stub.expectedColors,
            "Wrong colors value"
        )

        // **
        // UseCase Calls Count
        TextInputGetBorderLayoutUseCaseableMockTest.expectCallsCount(
            stub.getBorderLayoutUseCaseMock,
            executeWithThemeAndIsFocusedNumberOfCalls: 0
        )

        TextInputGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: viewModel.intent,
            givenIsFocused: viewModel.isFocused,
            givenIsEnabled: viewModel.isEnabled,
            givenIsReadOnly: givenIsReadOnly,
            expectedReturnValue: stub.expectedColors
        )

        TextInputGetDimUseCaseableMockTest.expectCallsCount(
            stub.getDimUseCaseMock,
            executeWithThemeAndIsEnabledNumberOfCalls: 0
        )

        TextInputGetFontUseCaseableMockTest.expectCallsCount(
            stub.getFontUseCaseMock,
            executeFontWithThemeNumberOfCalls: 0
        )

        TextInputGetSpacingsUseCaseableMockTest.expectCallsCount(
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
