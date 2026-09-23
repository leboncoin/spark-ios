//
//  InputOTPViewModelTests.swift
//  SparkComponentInputOTPTests
//
//  Created by robin.lemaire on 04/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

@testable import SparkComponentInputOTP
@_spi(SI_SPI) @testable import SparkComponentInputOTPTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting
import Testing

@Suite("InputOTP ViewModel Tests")
struct InputOTPViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.digits == nil)
        #expect(viewModel.isEnabled == nil)

        expectEqualToExpected(
            on: stub,
            otherColors: InputOTPColors(),
            otherLayout: InputOTPLayout(),
            otherTypographies: InputOTPTypographies(),
            otherDim: .zero,
            otherIsSeparator: false
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getDimUseCase: true,
            getIsSeparatorUseCase: true
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

        InputOTPGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedColors
        )

        InputOTPGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLayout
        )

        InputOTPGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTypographies
        )

        InputOTPGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        InputOTPGetIsSeparatorUseCaseableMockTest.expect(
            stub.getIsSeparatorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenDigits: stub.givenDigits,
            expectedReturnValue: stub.expectedIsSeparator
        )
    }

    // MARK: - Property Changes

    @Test("Theme when changed should update colors and layout and typographies and dim")
    func themeWhenChangedShouldUpdateColorsAndLayoutAndTypographiesAndDim() {
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

        InputOTPGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedColors
        )

        InputOTPGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLayout
        )

        InputOTPGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedTypographies
        )

        InputOTPGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        expectNotCalled(
            on: stub,
            getIsSeparatorUseCase: true
        )
    }

    @Test("Digits when changed should update isSeparator only")
    func digitsWhenChangedShouldUpdateIsSeparatorOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newDigits = InputOTPDigits.eight

        // WHEN
        viewModel.digits = newDigits

        // THEN
        expectEqualToExpected(on: stub)

        InputOTPGetIsSeparatorUseCaseableMockTest.expect(
            stub.getIsSeparatorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenDigits: newDigits,
            expectedReturnValue: stub.expectedIsSeparator
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getDimUseCase: true
        )
    }

    @Test("IsEnabled when changed should update dim only")
    func isEnabledWhenChangedShouldUpdateDimOnly() {
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

        InputOTPGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: newIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getIsSeparatorUseCase: true
        )
    }

    // MARK: - Properties Changed Before Setup

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.digits = InputOTPDigits.eight
        viewModel.isEnabled = false

        // THEN
        expectEqualToExpected(
            on: stub,
            otherColors: InputOTPColors(),
            otherLayout: InputOTPLayout(),
            otherTypographies: InputOTPTypographies(),
            otherDim: .zero,
            otherIsSeparator: false
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getDimUseCase: true,
            getIsSeparatorUseCase: true
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
        viewModel.digits = stub.givenDigits
        viewModel.isEnabled = stub.givenIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getDimUseCase: true,
            getIsSeparatorUseCase: true
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
        viewModel.digits = nil
        viewModel.isEnabled = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getDimUseCase: true,
            getIsSeparatorUseCase: true
        )
    }

    // MARK: - Getter

    @Test("GetShowSeparator should call use case with correct parameters")
    func getShowSeparatorShouldCallUseCaseWithCorrectParameters() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let givenIndex = 3

        // WHEN
        let showSeparator = viewModel.getShowSeparator(at: givenIndex)

        // THEN
        #expect(showSeparator == stub.expectedShowSeparator)

        InputOTPGetShowSeparatorUseCaseableMockTest.expect(
            stub.getShowSeparatorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIsSeparator: stub.expectedIsSeparator,
            givenIndex: givenIndex,
            givenDigits: stub.givenDigits,
            expectedReturnValue: stub.expectedShowSeparator
        )
    }

    @Test("GetShowSeparator should return false when digits is nil")
    func getShowSeparatorShouldReturnFalseWhenDigitsIsNil() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let givenIndex = 3

        // WHEN
        let showSeparator = viewModel.getShowSeparator(at: givenIndex)

        // THEN
        #expect(showSeparator == false)

        InputOTPGetShowSeparatorUseCaseableMockTest.expectCalled(
            stub.getShowSeparatorUseCaseMock,
            executeWithIsSeparatorAndIndexAndDigitsCalled: false
        )
    }

    @Test("GetSlotValue should call use case with correct parameters")
    func getSlotValueShouldCallUseCaseWithCorrectParameters() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let givenValue = "123456"
        let givenIndex = 3

        // WHEN
        let slotValue = viewModel.getSlotValue(
            value: givenValue,
            at: givenIndex
        )

        // THEN
        #expect(slotValue == stub.expectedSlotValue)

        InputOTPGetSlotValueUseCaseableMockTest.expect(
            stub.getSlotValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: givenValue,
            givenIndex: givenIndex,
            expectedReturnValue: stub.expectedSlotValue
        )
    }

    @Test("GetValidatedValue should call use case with correct parameters")
    func getValidatedValueShouldCallUseCaseWithCorrectParameters() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let givenValue = "12A34B56"
        let givenCodeType: InputOTPCodeType = .number

        // WHEN
        let validatedValue = viewModel.getValidatedValue(
            value: givenValue,
            codeType: givenCodeType
        )

        // THEN
        #expect(validatedValue == stub.expectedValidatedValue)

        InputOTPGetValidatedValueUseCaseableMockTest.expect(
            stub.getValidatedValueUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: givenValue,
            givenCodeType: givenCodeType,
            givenDigits: stub.givenDigits,
            expectedReturnValue: stub.expectedValidatedValue
        )
    }

    @Test("GetValidatedValue should return value unchanged when digits is nil")
    func getValidatedValueShouldReturnValueUnchangedWhenDigitsIsNil() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let givenValue = "12A34B56"
        let givenCodeType: InputOTPCodeType = .number

        // WHEN
        let validatedValue = viewModel.getValidatedValue(
            value: givenValue,
            codeType: givenCodeType
        )

        // THEN
        #expect(validatedValue.value == givenValue)
        #expect(validatedValue.hadInvalidCharacters == false)

        InputOTPGetValidatedValueUseCaseableMockTest.expectCalled(
            stub.getValidatedValueUseCaseMock,
            executeWithValueAndCodeTypeAndDigitsCalled: false
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenDigits: InputOTPDigits = .six
    let givenIsEnabled: Bool = true

    let expectedColors = InputOTPColors(
        separatorColorToken: ColorTokenGeneratedMock.random()
    )
    let expectedLayout = InputOTPLayout(
        spacing: 8.0,
        padding: 16.0
    )
    let expectedTypographies = InputOTPTypographies(
        contentFontToken: TypographyFontTokenGeneratedMock.title()
    )
    let expectedDim: CGFloat = 1.0
    let expectedIsSeparator: Bool = true
    let expectedShowSeparator: Bool = true
    let expectedSlotValue: String? = "4"
    let expectedValidatedValue = InputOTPValidatedValue(
        value: "123456",
        hadInvalidCharacters: false
    )

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: InputOTPGetColorsUseCaseableGeneratedMock
    let getLayoutUseCaseMock: InputOTPGetLayoutUseCaseableGeneratedMock
    let getTypographiesUseCaseMock: InputOTPGetTypographiesUseCaseableGeneratedMock
    let getDimUseCaseMock: InputOTPGetDimUseCaseableGeneratedMock
    let getIsSeparatorUseCaseMock: InputOTPGetIsSeparatorUseCaseableGeneratedMock
    let getShowSeparatorUseCaseMock: InputOTPGetShowSeparatorUseCaseableGeneratedMock
    let getSlotValueUseCaseMock: InputOTPGetSlotValueUseCaseableGeneratedMock
    let getValidatedValueUseCaseMock: InputOTPGetValidatedValueUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: InputOTPViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = InputOTPGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeReturnValue = self.expectedColors

        let getLayoutUseCaseMock = InputOTPGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        let getTypographiesUseCaseMock = InputOTPGetTypographiesUseCaseableGeneratedMock()
        getTypographiesUseCaseMock.executeWithThemeReturnValue = self.expectedTypographies

        let getDimUseCaseMock = InputOTPGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getIsSeparatorUseCaseMock = InputOTPGetIsSeparatorUseCaseableGeneratedMock()
        getIsSeparatorUseCaseMock.executeWithDigitsReturnValue = self.expectedIsSeparator

        let getShowSeparatorUseCaseMock = InputOTPGetShowSeparatorUseCaseableGeneratedMock()
        getShowSeparatorUseCaseMock.executeWithIsSeparatorAndIndexAndDigitsReturnValue = self.expectedShowSeparator

        let getSlotValueUseCaseMock = InputOTPGetSlotValueUseCaseableGeneratedMock()
        getSlotValueUseCaseMock.executeWithValueAndIndexReturnValue = self.expectedSlotValue

        let getValidatedValueUseCaseMock = InputOTPGetValidatedValueUseCaseableGeneratedMock()
        getValidatedValueUseCaseMock.executeWithValueAndCodeTypeAndDigitsReturnValue = self.expectedValidatedValue

        self.viewModel = InputOTPViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock,
            getTypographiesUseCase: getTypographiesUseCaseMock,
            getIsSeparatorUseCase: getIsSeparatorUseCaseMock,
            getShowSeparatorUseCase: getShowSeparatorUseCaseMock,
            getSlotValueUseCase: getSlotValueUseCaseMock,
            getValidatedValueUseCase: getValidatedValueUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getLayoutUseCaseMock = getLayoutUseCaseMock
        self.getTypographiesUseCaseMock = getTypographiesUseCaseMock
        self.getDimUseCaseMock = getDimUseCaseMock
        self.getIsSeparatorUseCaseMock = getIsSeparatorUseCaseMock
        self.getShowSeparatorUseCaseMock = getShowSeparatorUseCaseMock
        self.getSlotValueUseCaseMock = getSlotValueUseCaseMock
        self.getValidatedValueUseCaseMock = getValidatedValueUseCaseMock
    }

    // MARK: - Methods

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getLayoutUseCaseMock.reset()
        self.getTypographiesUseCaseMock.reset()
        self.getDimUseCaseMock.reset()
        self.getIsSeparatorUseCaseMock.reset()
        self.getShowSeparatorUseCaseMock.reset()
        self.getSlotValueUseCaseMock.reset()
        self.getValidatedValueUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension InputOTPViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            digits: stub.givenDigits,
            isEnabled: stub.givenIsEnabled
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    getTypographiesUseCase: Bool = false,
    getDimUseCase: Bool = false,
    getIsSeparatorUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    InputOTPGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    InputOTPGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCase,
        sourceLocation: sourceLocation
    )

    InputOTPGetTypographiesUseCaseableMockTest.expectCalled(
        stub.getTypographiesUseCaseMock,
        executeWithThemeCalled: !getTypographiesUseCase,
        sourceLocation: sourceLocation
    )

    InputOTPGetDimUseCaseableMockTest.expectCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase,
        sourceLocation: sourceLocation
    )

    InputOTPGetIsSeparatorUseCaseableMockTest.expectCalled(
        stub.getIsSeparatorUseCaseMock,
        executeWithDigitsCalled: !getIsSeparatorUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherColors: InputOTPColors? = nil,
    otherLayout: InputOTPLayout? = nil,
    otherTypographies: InputOTPTypographies? = nil,
    otherDim: CGFloat? = nil,
    otherIsSeparator: Bool? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    let expectedColors = otherColors ?? stub.expectedColors
    let expectedLayout = otherLayout ?? stub.expectedLayout
    let expectedTypographies = otherTypographies ?? stub.expectedTypographies
    let expectedDim = otherDim ?? stub.expectedDim
    let expectedIsSeparator = otherIsSeparator ?? stub.expectedIsSeparator

    #expect(
        viewModel.colors == expectedColors,
        "Wrong colors value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.layout == expectedLayout,
        "Wrong layout value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.typographies == expectedTypographies,
        "Wrong typographies value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.dim == expectedDim,
        "Wrong dim value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.isSeparator == expectedIsSeparator,
        "Wrong isSeparator value",
        sourceLocation: sourceLocation
    )
}
