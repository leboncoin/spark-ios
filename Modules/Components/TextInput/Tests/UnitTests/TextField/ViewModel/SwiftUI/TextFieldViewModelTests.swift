//
//  TextFieldViewModelTests.swift
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

final class TextFieldViewModelTests: XCTestCase {

    // MARK: - Tests

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN
        let stub = Stub()

        // WHEN
        let viewModel = stub.viewModel

        // THEN
        XCTAssertEqual(
            viewModel.leftAddonPadding,
            .init(),
            "Wrong leftAddonPadding value"
        )
        XCTAssertEqual(
            viewModel.rightAddonPadding,
            .init(),
            "Wrong rightAddonPadding value"
        )
        XCTAssertEqual(
            viewModel.contentPadding,
            .init(),
            "Wrong contentPadding value"
        )
        XCTAssertFalse(
            viewModel.isClearButton,
            "Wrong isClearButton value"
        )

        // **
        // UseCase Calls Count
        TextFieldGetAddonPaddingUseCaseableMockTest.XCTCallsCount(
            stub.getAddonPaddingUseCaseMock,
            executeLeftWithSpacingsAndLeftConfigurationNumberOfCalls: 0
        )

        TextFieldGetAddonPaddingUseCaseableMockTest.XCTCallsCount(
            stub.getAddonPaddingUseCaseMock,
            executeRightWithSpacingsAndRightConfigurationNumberOfCalls: 0
        )

        TextFieldGetContentPaddingUseCaseableMockTest.XCTCallsCount(
            stub.getContentPaddingUseCaseMock,
            executeWithSpacingsAndIsClearButtonNumberOfCalls: 0
        )

        TextFieldGetIsClearButtonUseCaseableMockTest.XCTCallsCount(
            stub.getIsClearButtonUseCaseMock,
            executeWithClearModeAndIsFocusedNumberOfCalls: 0
        )
        // **
    }

    func test_updateAll_shouldSetAllProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.updateAll(stub: stub)

        // THEN
        XCTAssertEqual(
            viewModel.leftAddonPadding,
            stub.expectedAddonLeftPadding,
            "Wrong leftAddonPadding value"
        )
        XCTAssertEqual(
            viewModel.rightAddonPadding,
            stub.expectedAddonRightPadding,
            "Wrong rightAddonPadding value"
        )
        XCTAssertEqual(
            viewModel.contentPadding,
            stub.expectedContentPadding,
            "Wrong contentPadding value"
        )
        XCTAssertEqual(
            viewModel.isClearButton,
            stub.expectedIsClearButton,
            "Wrong isClearButton value"
        )

        // **
        // UseCase Calls Count
        TextFieldGetAddonPaddingUseCaseableMockTest.XCTAssert(
            stub.getAddonPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSpacings: viewModel.spacings,
            givenLeftConfiguration: stub.givenLeftAddonConfiguration,
            expectedReturnValue: stub.expectedAddonLeftPadding
        )

        TextFieldGetAddonPaddingUseCaseableMockTest.XCTAssert(
            stub.getAddonPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSpacings: viewModel.spacings,
            givenRightConfiguration: stub.givenRightAddonConfiguration,
            expectedReturnValue: stub.expectedAddonRightPadding
        )

        TextFieldGetContentPaddingUseCaseableMockTest.XCTAssert(
            stub.getContentPaddingUseCaseMock,
            expectedNumberOfCalls: 2,
            givenSpacings: viewModel.spacings,
            givenIsClearButton: viewModel.isClearButton,
            expectedReturnValue: stub.expectedContentPadding
        )

        TextFieldGetIsClearButtonUseCaseableMockTest.XCTAssert(
            stub.getIsClearButtonUseCaseMock,
            expectedNumberOfCalls: 1,
            givenClearMode: stub.givenClearMode,
            givenIsFocused: stub.givenIsFocused,
            expectedReturnValue: stub.expectedIsClearButton
        )
        // **
    }

    func test_setIsClearButton_whenClearModeChanges() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenClearMode = TextFieldClearMode.whileEditing

        // WHEN
        viewModel.clearMode = givenClearMode

        // THEN
        XCTAssertEqual(
            viewModel.isClearButton,
            stub.expectedIsClearButton,
            "Wrong isClearButton value"
        )

        // **
        // UseCase Calls Count
        TextFieldGetAddonPaddingUseCaseableMockTest.XCTCallsCount(
            stub.getAddonPaddingUseCaseMock,
            executeLeftWithSpacingsAndLeftConfigurationNumberOfCalls: 0
        )

        TextFieldGetAddonPaddingUseCaseableMockTest.XCTCallsCount(
            stub.getAddonPaddingUseCaseMock,
            executeRightWithSpacingsAndRightConfigurationNumberOfCalls: 0
        )

        TextFieldGetContentPaddingUseCaseableMockTest.XCTAssert(
            stub.getContentPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSpacings: viewModel.spacings,
            givenIsClearButton: stub.expectedIsClearButton,
            expectedReturnValue: stub.expectedContentPadding
        )

        TextFieldGetIsClearButtonUseCaseableMockTest.XCTAssert(
            stub.getIsClearButtonUseCaseMock,
            expectedNumberOfCalls: 1,
            givenClearMode: givenClearMode,
            givenIsFocused: stub.givenIsFocused,
            expectedReturnValue: stub.expectedIsClearButton
        )
        // **
    }

    func test_setIsClearButton_whenFocusChanges() {
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
            viewModel.isClearButton,
            stub.expectedIsClearButton,
            "Wrong isClearButton value"
        )

        // **
        // UseCase Calls Count
        TextFieldGetAddonPaddingUseCaseableMockTest.XCTCallsCount(
            stub.getAddonPaddingUseCaseMock,
            executeLeftWithSpacingsAndLeftConfigurationNumberOfCalls: 0
        )

        TextFieldGetAddonPaddingUseCaseableMockTest.XCTCallsCount(
            stub.getAddonPaddingUseCaseMock,
            executeRightWithSpacingsAndRightConfigurationNumberOfCalls: 0
        )

        TextFieldGetContentPaddingUseCaseableMockTest.XCTAssert(
            stub.getContentPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSpacings: viewModel.spacings,
            givenIsClearButton: stub.expectedIsClearButton,
            expectedReturnValue: stub.expectedContentPadding
        )

        TextFieldGetIsClearButtonUseCaseableMockTest.XCTAssert(
            stub.getIsClearButtonUseCaseMock,
            expectedNumberOfCalls: 1,
            givenClearMode: stub.givenClearMode,
            givenIsFocused: givenIsFocused,
            expectedReturnValue: stub.expectedIsClearButton
        )
        // **
    }

    func test_setAddonPadding_whenLeftAddonConfigurationChanges() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenLeftAddonConfiguration = TextFieldAddonConfiguration(
            hasPadding: false,
            hasSeparator: true
        )

        // WHEN
        viewModel.leftAddonConfiguration = givenLeftAddonConfiguration

        // THEN
        XCTAssertEqual(
            viewModel.leftAddonPadding,
            stub.expectedAddonLeftPadding,
            "Wrong leftAddonPadding value"
        )

        // **
        // UseCase Calls Count
        TextFieldGetAddonPaddingUseCaseableMockTest.XCTAssert(
            stub.getAddonPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSpacings: viewModel.spacings,
            givenLeftConfiguration: givenLeftAddonConfiguration,
            expectedReturnValue: stub.expectedAddonLeftPadding
        )

        TextFieldGetAddonPaddingUseCaseableMockTest.XCTCallsCount(
            stub.getAddonPaddingUseCaseMock,
            executeRightWithSpacingsAndRightConfigurationNumberOfCalls: 0
        )

        TextFieldGetContentPaddingUseCaseableMockTest.XCTCallsCount(
            stub.getContentPaddingUseCaseMock,
            executeWithSpacingsAndIsClearButtonNumberOfCalls: 0
        )

        TextFieldGetIsClearButtonUseCaseableMockTest.XCTCallsCount(
            stub.getIsClearButtonUseCaseMock,
            executeWithClearModeAndIsFocusedNumberOfCalls: 0
        )
        // **
    }

    func test_setAddonPadding_whenRightAddonConfigurationChanges() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        let givenRightAddonConfiguration = TextFieldAddonConfiguration(
            hasPadding: true,
            hasSeparator: false
        )

        // WHEN
        viewModel.rightAddonConfiguration = givenRightAddonConfiguration

        // THEN
        XCTAssertEqual(
            viewModel.rightAddonPadding,
            stub.expectedAddonRightPadding,
            "Wrong rightAddonPadding value"
        )

        // **
        // UseCase Calls Count
        TextFieldGetAddonPaddingUseCaseableMockTest.XCTCallsCount(
            stub.getAddonPaddingUseCaseMock,
            executeLeftWithSpacingsAndLeftConfigurationNumberOfCalls: 0
        )

        TextFieldGetAddonPaddingUseCaseableMockTest.XCTAssert(
            stub.getAddonPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSpacings: viewModel.spacings,
            givenRightConfiguration: givenRightAddonConfiguration,
            expectedReturnValue: stub.expectedAddonRightPadding
        )

        TextFieldGetContentPaddingUseCaseableMockTest.XCTCallsCount(
            stub.getContentPaddingUseCaseMock,
            executeWithSpacingsAndIsClearButtonNumberOfCalls: 0
        )

        TextFieldGetIsClearButtonUseCaseableMockTest.XCTCallsCount(
            stub.getIsClearButtonUseCaseMock,
            executeWithClearModeAndIsFocusedNumberOfCalls: 0
        )
        // **
    }

    func test_spacingDidUpdate_shouldUpdatePaddings() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.updateAll(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.spacingDidUpdate()

        // THEN
        XCTAssertEqual(
            viewModel.leftAddonPadding,
            stub.expectedAddonLeftPadding,
            "Wrong leftAddonPadding value"
        )
        XCTAssertEqual(
            viewModel.rightAddonPadding,
            stub.expectedAddonRightPadding,
            "Wrong rightAddonPadding value"
        )
        XCTAssertEqual(
            viewModel.contentPadding,
            stub.expectedContentPadding,
            "Wrong contentPadding value"
        )

        // **
        // UseCase Calls Count
        TextFieldGetAddonPaddingUseCaseableMockTest.XCTAssert(
            stub.getAddonPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSpacings: viewModel.spacings,
            givenLeftConfiguration: stub.givenLeftAddonConfiguration,
            expectedReturnValue: stub.expectedAddonLeftPadding
        )

        TextFieldGetAddonPaddingUseCaseableMockTest.XCTAssert(
            stub.getAddonPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSpacings: viewModel.spacings,
            givenRightConfiguration: stub.givenRightAddonConfiguration,
            expectedReturnValue: stub.expectedAddonRightPadding
        )

        TextFieldGetContentPaddingUseCaseableMockTest.XCTAssert(
            stub.getContentPaddingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSpacings: viewModel.spacings,
            givenIsClearButton: viewModel.isClearButton,
            expectedReturnValue: stub.expectedContentPadding
        )

        TextFieldGetIsClearButtonUseCaseableMockTest.XCTCallsCount(
            stub.getIsClearButtonUseCaseMock,
            executeWithClearModeAndIsFocusedNumberOfCalls: 0
        )
        // **
    }
}

// MARK: - Stub

private final class Stub: TextFieldViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent = TextInputIntent.neutral
    let givenIsReadOnly: Bool = false
    let givenClearMode = TextFieldClearMode.always
    let givenLeftAddonConfiguration = TextFieldAddonConfiguration(hasPadding: true, hasSeparator: true)
    let givenRightAddonConfiguration = TextFieldAddonConfiguration(hasPadding: false, hasSeparator: false)
    let givenIsFocused: Bool = false
    let givenIsEnabled: Bool = false

    // MARK: - Expected Properties

    let expectedAddonLeftPadding = EdgeInsets(all: 10)
    let expectedAddonRightPadding = EdgeInsets(all: 10)
    let expectedIsClearButton = false
    let expectedContentPadding = TextFieldContentPadding(top: 1, leading: 2, bottom: 3, trailing: 4, inputTrailing: 5)

    // MARK: - Initialization

    init() {
        let getAddonPaddingUseCaseMock = TextFieldGetAddonPaddingUseCaseableGeneratedMock()
        getAddonPaddingUseCaseMock.executeLeftWithSpacingsAndLeftConfigurationReturnValue = self.expectedAddonLeftPadding
        getAddonPaddingUseCaseMock.executeRightWithSpacingsAndRightConfigurationReturnValue = self.expectedAddonRightPadding

        let getIsClearButtonUseCaseMock = TextFieldGetIsClearButtonUseCaseableGeneratedMock()
        getIsClearButtonUseCaseMock.executeWithClearModeAndIsFocusedReturnValue = self.expectedIsClearButton

        let getContentPaddingUseCaseMock = TextFieldGetContentPaddingUseCaseableGeneratedMock()
        getContentPaddingUseCaseMock.executeWithSpacingsAndIsClearButtonReturnValue = self.expectedContentPadding

        let viewModel = TextFieldViewModel(
            getAddonPaddingUseCase: getAddonPaddingUseCaseMock,
            getIsClearButtonUseCase: getIsClearButtonUseCaseMock,
            getContentPaddingUseCase: getContentPaddingUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getAddonPaddingUseCaseMock: getAddonPaddingUseCaseMock,
            getIsClearButtonUseCaseMock: getIsClearButtonUseCaseMock,
            getContentPaddingUseCaseMock: getContentPaddingUseCaseMock
        )
    }
}

// MARK: - Extension

private extension TextFieldViewModel {

    func updateAll(stub: Stub) {
        self.updateAll(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            isReadOnly: stub.givenIsReadOnly,
            clearMode: stub.givenClearMode,
            leftAddonConfiguration: stub.givenLeftAddonConfiguration,
            rightAddonConfiguration: stub.givenRightAddonConfiguration,
            isFocused: stub.givenIsFocused,
            isEnabled: stub.givenIsEnabled
        )
    }
}
