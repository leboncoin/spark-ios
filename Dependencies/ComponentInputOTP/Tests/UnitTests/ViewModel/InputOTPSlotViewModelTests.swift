//
//  InputOTPSlotViewModelTests.swift
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

@Suite("InputOTPSlot ViewModel Tests")
struct InputOTPSlotViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.value == nil)
        #expect(viewModel.onError == nil)
        #expect(viewModel.isFocus == nil)

        expectEqualToExpected(
            on: stub,
            otherColors: InputOTPSlotColors(),
            otherBorder: InputOTPSlotBorder(),
            otherContent: ""
        )

        expectNotCalled(
            on: stub,
            getSlotColorsUseCase: true,
            getSlotBorderUseCase: true,
            getSlotContentUseCase: true
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

        InputOTPGetSlotColorsUseCaseableMockTest.expect(
            stub.getSlotColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenValue: stub.givenValue,
            givenOnError: stub.givenOnError,
            givenIsFocus: stub.givenIsFocus,
            expectedReturnValue: stub.expectedColors
        )

        InputOTPGetSlotBorderUseCaseableMockTest.expect(
            stub.getSlotBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenOnError: stub.givenOnError,
            givenIsFocus: stub.givenIsFocus,
            expectedReturnValue: stub.expectedBorder
        )

        InputOTPGetSlotContentUseCaseableMockTest.expect(
            stub.getSlotContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: stub.givenValue,
            givenIsFocus: stub.givenIsFocus,
            expectedReturnValue: stub.expectedContent
        )
    }

    // MARK: - Property Changes

    @Test("Theme when changed should update colors and border")
    func themeWhenChangedShouldUpdateColorsAndBorder() {
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

        InputOTPGetSlotColorsUseCaseableMockTest.expect(
            stub.getSlotColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenValue: stub.givenValue,
            givenOnError: stub.givenOnError,
            givenIsFocus: stub.givenIsFocus,
            expectedReturnValue: stub.expectedColors
        )

        InputOTPGetSlotBorderUseCaseableMockTest.expect(
            stub.getSlotBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenOnError: stub.givenOnError,
            givenIsFocus: stub.givenIsFocus,
            expectedReturnValue: stub.expectedBorder
        )

        expectNotCalled(
            on: stub,
            getSlotContentUseCase: true
        )
    }

    @Test("Value when changed should update colors and content")
    func valueWhenChangedShouldUpdateColorsAndContent() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newValue = "9"

        // WHEN
        viewModel.value = newValue

        // THEN
        expectEqualToExpected(on: stub)

        InputOTPGetSlotColorsUseCaseableMockTest.expect(
            stub.getSlotColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenValue: newValue,
            givenOnError: stub.givenOnError,
            givenIsFocus: stub.givenIsFocus,
            expectedReturnValue: stub.expectedColors
        )

        InputOTPGetSlotContentUseCaseableMockTest.expect(
            stub.getSlotContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: newValue,
            givenIsFocus: stub.givenIsFocus,
            expectedReturnValue: stub.expectedContent
        )

        expectNotCalled(
            on: stub,
            getSlotBorderUseCase: true
        )
    }

    @Test("OnError when changed should update colors and border")
    func onErrorWhenChangedShouldUpdateColorsAndBorder() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newOnError = true

        // WHEN
        viewModel.onError = newOnError

        // THEN
        expectEqualToExpected(on: stub)

        InputOTPGetSlotColorsUseCaseableMockTest.expect(
            stub.getSlotColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenValue: stub.givenValue,
            givenOnError: newOnError,
            givenIsFocus: stub.givenIsFocus,
            expectedReturnValue: stub.expectedColors
        )

        InputOTPGetSlotBorderUseCaseableMockTest.expect(
            stub.getSlotBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenOnError: newOnError,
            givenIsFocus: stub.givenIsFocus,
            expectedReturnValue: stub.expectedBorder
        )

        expectNotCalled(
            on: stub,
            getSlotContentUseCase: true
        )
    }

    @Test("IsFocus when changed should update all properties")
    func isFocusWhenChangedShouldUpdateAllProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newIsFocus = true

        // WHEN
        viewModel.isFocus = newIsFocus

        // THEN
        expectEqualToExpected(on: stub)

        InputOTPGetSlotColorsUseCaseableMockTest.expect(
            stub.getSlotColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenValue: stub.givenValue,
            givenOnError: stub.givenOnError,
            givenIsFocus: newIsFocus,
            expectedReturnValue: stub.expectedColors
        )

        InputOTPGetSlotBorderUseCaseableMockTest.expect(
            stub.getSlotBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenOnError: stub.givenOnError,
            givenIsFocus: newIsFocus,
            expectedReturnValue: stub.expectedBorder
        )

        InputOTPGetSlotContentUseCaseableMockTest.expect(
            stub.getSlotContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: stub.givenValue,
            givenIsFocus: newIsFocus,
            expectedReturnValue: stub.expectedContent
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
        viewModel.value = "5"
        viewModel.onError = true
        viewModel.isFocus = true

        // THEN
        expectEqualToExpected(
            on: stub,
            otherColors: InputOTPSlotColors(),
            otherBorder: InputOTPSlotBorder(),
            otherContent: ""
        )

        expectNotCalled(
            on: stub,
            getSlotColorsUseCase: true,
            getSlotBorderUseCase: true,
            getSlotContentUseCase: true
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
        viewModel.value = stub.givenValue
        viewModel.onError = stub.givenOnError
        viewModel.isFocus = stub.givenIsFocus

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getSlotColorsUseCase: true,
            getSlotBorderUseCase: true,
            getSlotContentUseCase: true
        )
    }

    @Test("Properties changed with nil values should not call use cases")
    func propertiesChangedWithNilValuesShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        viewModel.value = nil
        stub.resetMockedData()

        // WHEN
        viewModel.theme = nil
        viewModel.value = nil
        viewModel.onError = nil
        viewModel.isFocus = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getSlotColorsUseCase: true,
            getSlotBorderUseCase: true,
            getSlotContentUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenValue: String? = "5"
    let givenOnError: Bool = false
    let givenIsFocus: Bool = false

    let expectedColors = InputOTPSlotColors(
        contentColorToken: ColorTokenGeneratedMock.random(),
        borderColorToken: ColorTokenGeneratedMock.random(),
        backgroundColorToken: ColorTokenGeneratedMock.random()
    )
    let expectedBorder = InputOTPSlotBorder(
        width: 2.0,
        radius: 8.0
    )
    let expectedContent = "5"

    // MARK: - Use Case Mocks

    let getSlotBorderUseCaseMock: InputOTPGetSlotBorderUseCaseableGeneratedMock
    let getSlotColorsUseCaseMock: InputOTPGetSlotColorsUseCaseableGeneratedMock
    let getSlotContentUseCaseMock: InputOTPGetSlotContentUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: InputOTPSlotViewModel

    // MARK: - Initialization

    init() {
        let getSlotBorderUseCaseMock = InputOTPGetSlotBorderUseCaseableGeneratedMock()
        getSlotBorderUseCaseMock.executeWithThemeAndOnErrorAndIsFocusReturnValue = self.expectedBorder

        let getSlotColorsUseCaseMock = InputOTPGetSlotColorsUseCaseableGeneratedMock()
        getSlotColorsUseCaseMock.executeWithThemeAndValueAndOnErrorAndIsFocusReturnValue = self.expectedColors

        let getSlotContentUseCaseMock = InputOTPGetSlotContentUseCaseableGeneratedMock()
        getSlotContentUseCaseMock.executeWithValueAndIsFocusReturnValue = self.expectedContent

        self.viewModel = InputOTPSlotViewModel(
            getSlotBorderUseCase: getSlotBorderUseCaseMock,
            getSlotColorsUseCase: getSlotColorsUseCaseMock,
            getSlotContentUseCase: getSlotContentUseCaseMock
        )

        self.getSlotBorderUseCaseMock = getSlotBorderUseCaseMock
        self.getSlotColorsUseCaseMock = getSlotColorsUseCaseMock
        self.getSlotContentUseCaseMock = getSlotContentUseCaseMock
    }

    // MARK: - Methods

    func resetMockedData() {
        self.getSlotBorderUseCaseMock.reset()
        self.getSlotColorsUseCaseMock.reset()
        self.getSlotContentUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension InputOTPSlotViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            value: stub.givenValue,
            onError: stub.givenOnError,
            isFocus: stub.givenIsFocus
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getSlotColorsUseCase: Bool = false,
    getSlotBorderUseCase: Bool = false,
    getSlotContentUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    InputOTPGetSlotColorsUseCaseableMockTest.expectCalled(
        stub.getSlotColorsUseCaseMock,
        executeWithThemeAndValueAndOnErrorAndIsFocusCalled: !getSlotColorsUseCase,
        sourceLocation: sourceLocation
    )

    InputOTPGetSlotBorderUseCaseableMockTest.expectCalled(
        stub.getSlotBorderUseCaseMock,
        executeWithThemeAndOnErrorAndIsFocusCalled: !getSlotBorderUseCase,
        sourceLocation: sourceLocation
    )

    InputOTPGetSlotContentUseCaseableMockTest.expectCalled(
        stub.getSlotContentUseCaseMock,
        executeWithValueAndIsFocusCalled: !getSlotContentUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherColors: InputOTPSlotColors? = nil,
    otherBorder: InputOTPSlotBorder? = nil,
    otherContent: String? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    let expectedColors = otherColors ?? stub.expectedColors
    let expectedBorder = otherBorder ?? stub.expectedBorder
    let expectedContent = otherContent ?? stub.expectedContent

    #expect(
        viewModel.colors == expectedColors,
        "Wrong colors value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.border == expectedBorder,
        "Wrong border value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.content == expectedContent,
        "Wrong content value",
        sourceLocation: sourceLocation
    )
}
