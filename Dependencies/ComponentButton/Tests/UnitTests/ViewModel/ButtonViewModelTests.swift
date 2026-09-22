//
//  ButtonViewModelTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 12/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import UIKit

@testable import SparkComponentButton
@_spi(SI_SPI) @testable import SparkComponentButtonTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting

final class ButtonViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        XCTAssertNil(viewModel.theme)
        XCTAssertNil(viewModel.intent)
        XCTAssertNil(viewModel.variant)
        XCTAssertNil(viewModel.shape)
        XCTAssertNil(viewModel.size)
        XCTAssertNil(viewModel.contentVisibility)
        XCTAssertNil(viewModel.type)
        XCTAssertFalse(viewModel.isPressed)
        XCTAssertNil(viewModel.isEnabled)
        XCTAssertNil(viewModel.removeStyles)

        XCTAssertEqualToExpected(
            on: stub,
            otherBorder: ButtonBorder(),
            otherColors: ButtonColors(),
            otherLayout: ButtonLayout(),
            otherSizes: ButtonSizes(),
            otherDim: 0,
            otherTitleFontToken: TypographyFontTokenClear(),
            otherShowContent: true
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
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

        ButtonGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenShape: stub.givenShape,
            givenVariant: stub.givenVariant,
            givenRemoveStyles: stub.givenRemoveStyles,
            expectedReturnValue: stub.expectedBorder
        )

        ButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        ButtonGetTitleFontTokenUseCaseableMockTest.XCTAssert(
            stub.getTitleFontTokenUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTitleFontToken
        )

        ButtonGetSpacingsUseCaseableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            expectedReturnValue: stub.expectedLayout
        )

        ButtonGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenRemoveStyles: stub.givenRemoveStyles,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        ButttonGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        ButtonGetShowContentUseCaseableMockTest.XCTAssert(
            stub.getShowContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedShowContent
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

        XCTAssertNotCalled(
            on: stub,
            getSizesUseCase: true,
            getShowContentUseCase: true
        )

        ButtonGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenShape: stub.givenShape,
            givenVariant: stub.givenVariant,
            givenRemoveStyles: stub.givenRemoveStyles,
            expectedReturnValue: stub.expectedBorder
        )

        ButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        ButtonGetTitleFontTokenUseCaseableMockTest.XCTAssert(
            stub.getTitleFontTokenUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedTitleFontToken
        )

        ButtonGetSpacingsUseCaseableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            expectedReturnValue: stub.expectedLayout
        )

        ButttonGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
    }

    func test_appearanceChanged_shouldUpdateBorderAndColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newAppearance = ButtonAppearance.ai

        // WHEN
        viewModel.appearance = newAppearance

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ButtonGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: newAppearance,
            givenIntent: stub.givenIntent,
            givenShape: stub.givenShape,
            givenVariant: stub.givenVariant,
            givenRemoveStyles: stub.givenRemoveStyles,
            expectedReturnValue: stub.expectedBorder
        )

        ButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: newAppearance,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    func test_intentChanged_shouldUpdateBorderAndColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = ButtonIntent.support

        // WHEN
        viewModel.intent = newIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ButtonGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: newIntent,
            givenShape: stub.givenShape,
            givenVariant: stub.givenVariant,
            givenRemoveStyles: stub.givenRemoveStyles,
            expectedReturnValue: stub.expectedBorder
        )

        ButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: newIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    func test_variantChanged_shouldUpdateBorderAndColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newVariant = ButtonVariant.ghost

        // WHEN
        viewModel.variant = newVariant

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ButtonGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenShape: stub.givenShape,
            givenVariant: newVariant,
            givenRemoveStyles: stub.givenRemoveStyles,
            expectedReturnValue: stub.expectedBorder
        )

        ButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenVariant: newVariant,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    func test_shapeChanged_shouldUpdateBorderOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newShape = ButtonShape.rounded

        // WHEN
        viewModel.shape = newShape

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ButtonGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenShape: newShape,
            givenVariant: stub.givenVariant,
            givenRemoveStyles: stub.givenRemoveStyles,
            expectedReturnValue: stub.expectedBorder
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    func test_sizeChanged_shouldUpdateSizesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize = ButtonSize.large

        // WHEN
        viewModel.size = newSize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ButtonGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenRemoveStyles: stub.givenRemoveStyles,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    func test_typeChanged_shouldUpdateLayoutAndSizesAndShowContentOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newType = ButtonType.iconButton

        // WHEN
        viewModel.type = newType

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ButtonGetSpacingsUseCaseableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: newType,
            givenContentVisibility: stub.givenContentVisibility,
            expectedReturnValue: stub.expectedLayout
        )

        ButtonGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenType: newType,
            givenContentVisibility: stub.givenContentVisibility,
            givenRemoveStyles: stub.givenRemoveStyles,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        ButtonGetShowContentUseCaseableMockTest.XCTAssert(
            stub.getShowContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: newType,
            givenContentVisibility: stub.givenContentVisibility,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedShowContent
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true
        )
    }

    func test_isPressedChanged_shouldUpdateColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsPressed = !stub.givenIsPressed

        // WHEN
        viewModel.isPressed = newIsPressed

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ButtonGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: newIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    func test_isEnabledChanged_shouldUpdateDimOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsEnabled = !stub.givenIsEnabled

        // WHEN
        viewModel.isEnabled = newIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ButttonGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: newIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    func test_contentVisibilityChanged_shouldUpdateLayoutSizesAndShowContentOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newContentVisibility = ButtonContentVisibility.hideLabel

        // WHEN
        viewModel.contentVisibility = newContentVisibility

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ButtonGetSpacingsUseCaseableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: stub.givenType,
            givenContentVisibility: newContentVisibility,
            expectedReturnValue: stub.expectedLayout
        )

        ButtonGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenType: stub.givenType,
            givenContentVisibility: newContentVisibility,
            givenRemoveStyles: stub.givenRemoveStyles,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        ButtonGetShowContentUseCaseableMockTest.XCTAssert(
            stub.getShowContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.givenType,
            givenContentVisibility: newContentVisibility,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedShowContent
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true
        )
    }

    func test_isLoadingChanged_shouldUpdateShowContentAndSizesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsLoading = !stub.givenIsLoading

        // WHEN
        viewModel.isLoading = newIsLoading

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ButtonGetShowContentUseCaseableMockTest.XCTAssert(
            stub.getShowContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenIsLoading: newIsLoading,
            expectedReturnValue: stub.expectedShowContent
        )

        ButtonGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenRemoveStyles: stub.givenRemoveStyles,
            givenIsLoading: newIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true
        )
    }

    func test_removeStylesChanged_shouldUpdateBorderAndSizesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newRemoveStyles = !stub.givenRemoveStyles

        // WHEN
        viewModel.removeStyles = newRemoveStyles

        // THEN
        XCTAssertEqualToExpected(on: stub)

        ButtonGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenShape: stub.givenShape,
            givenVariant: stub.givenVariant,
            givenRemoveStyles: newRemoveStyles,
            expectedReturnValue: stub.expectedBorder
        )

        ButtonGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenRemoveStyles: newRemoveStyles,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.appearance = stub.givenAppearance.otherRandom
        viewModel.intent = stub.givenIntent.otherRandom
        viewModel.variant = stub.givenVariant.otherRandom
        viewModel.shape = stub.givenShape.otherRandom
        viewModel.size = stub.givenSize.otherRandom
        viewModel.contentVisibility = stub.givenContentVisibility.otherRandom
        viewModel.type = stub.givenType.otherRandom
        viewModel.removeStyles = true
        viewModel.isPressed = false
        viewModel.isEnabled = false
        viewModel.isLoading = false

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherBorder: ButtonBorder(),
            otherColors: ButtonColors(),
            otherLayout: ButtonLayout(),
            otherSizes: ButtonSizes(),
            otherDim: 0,
            otherTitleFontToken: TypographyFontTokenClear(),
            otherShowContent: true
        )

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
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
        viewModel.appearance = stub.givenAppearance
        viewModel.intent = stub.givenIntent
        viewModel.variant = stub.givenVariant
        viewModel.shape = stub.givenShape
        viewModel.size = stub.givenSize
        viewModel.contentVisibility = stub.givenContentVisibility
        viewModel.type = stub.givenType
        viewModel.removeStyles = stub.givenRemoveStyles
        viewModel.isPressed = stub.givenIsPressed
        viewModel.isEnabled = stub.givenIsEnabled
        viewModel.isLoading = stub.givenIsLoading

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
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
        viewModel.appearance = nil
        viewModel.intent = nil
        viewModel.variant = nil
        viewModel.shape = nil
        viewModel.size = nil
        viewModel.contentVisibility = nil
        viewModel.type = nil
        viewModel.removeStyles = nil
        viewModel.isEnabled = nil
        viewModel.isLoading = nil

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenAppearance: ButtonAppearance = .danger
    let givenIntent: ButtonIntent = .main
    let givenVariant: ButtonVariant = .filled
    let givenShape: ButtonShape = .pill
    let givenSize: ButtonSize = .medium
    let givenContentVisibility: ButtonContentVisibility = .showAll
    let givenType: ButtonType = .button
    let givenRemoveStyles: Bool = false
    let givenIsPressed: Bool = false
    let givenIsEnabled: Bool = true
    let givenIsLoading: Bool = false

    // MARK: - Expected

    let expectedBorder = ButtonBorder(
        width: 2.0,
        radius: 16.0
    )
    let expectedColors = ButtonColors(
        tintColor: ColorTokenGeneratedMock.blue(),
        backgroundColor: ColorTokenGeneratedMock.red(),
        borderColor: ColorTokenGeneratedMock.green()
    )
    let expectedLayout = ButtonLayout(
        horizontalSpacing: 8.0,
        horizontalPadding: 16.0
    )
    let expectedSizes = ButtonSizes(
        height: 44.0,
        imageSize: 16.0
    )
    let expectedDim: CGFloat = 0.0
    let expectedTitleFontToken = TypographyFontTokenGeneratedMock.callout()
    let expectedShowContent: Bool = true

    // MARK: - Use Case Mocks

    let getBorderUseCaseMock: ButtonGetBorderUseCaseableGeneratedMock
    let getColorsUseCaseMock: ButtonGetColorsUseCaseableGeneratedMock
    let getTitleFontTokenUseCaseMock: ButtonGetTitleFontTokenUseCaseableGeneratedMock
    let getSpacingsUseCaseMock: ButtonGetSpacingsUseCaseableGeneratedMock
    let getSizesUseCaseMock: ButtonGetSizesUseCaseableGeneratedMock
    let getDimUseCaseMock: ButttonGetDimUseCaseableGeneratedMock
    let getShowContentUseCaseMock: ButtonGetShowContentUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: ButtonViewModel

    // MARK: - Initialization

    init() {
        let getBorderUseCaseMock = ButtonGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeAndAppearanceAndIntentAndShapeAndVariantAndRemoveStylesReturnValue = self.expectedBorder

        let getColorsUseCaseMock = ButtonGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndAppearanceAndIntentAndVariantAndIsPressedReturnValue = self.expectedColors

        let getTitleFontTokenUseCaseMock = ButtonGetTitleFontTokenUseCaseableGeneratedMock()
        getTitleFontTokenUseCaseMock.executeWithThemeReturnValue = self.expectedTitleFontToken

        let getSpacingsUseCaseMock = ButtonGetSpacingsUseCaseableGeneratedMock()
        getSpacingsUseCaseMock.executeWithThemeAndTypeAndContentVisibilityReturnValue = self.expectedLayout

        let getSizesUseCaseMock = ButtonGetSizesUseCaseableGeneratedMock()
        getSizesUseCaseMock.executeWithSizeAndTypeAndContentVisibilityAndRemoveStylesAndIsLoadingReturnValue = self.expectedSizes

        let getDimUseCaseMock = ButttonGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getShowContentUseCaseMock = ButtonGetShowContentUseCaseableGeneratedMock()
        getShowContentUseCaseMock.executeWithTypeAndContentVisibilityAndIsLoadingReturnValue = self.expectedShowContent

        self.viewModel = ButtonViewModel(
            getBorderUseCase: getBorderUseCaseMock,
            getColorsUseCase: getColorsUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getSpacingsUseCase: getSpacingsUseCaseMock,
            getSizesUseCase: getSizesUseCaseMock,
            getTitleFontTokenUseCase: getTitleFontTokenUseCaseMock,
            getShowContentUseCase: getShowContentUseCaseMock
        )

        self.getBorderUseCaseMock = getBorderUseCaseMock
        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getTitleFontTokenUseCaseMock = getTitleFontTokenUseCaseMock
        self.getSpacingsUseCaseMock = getSpacingsUseCaseMock
        self.getSizesUseCaseMock = getSizesUseCaseMock
        self.getDimUseCaseMock = getDimUseCaseMock
        self.getShowContentUseCaseMock = getShowContentUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getBorderUseCaseMock.reset()
        self.getColorsUseCaseMock.reset()
        self.getTitleFontTokenUseCaseMock.reset()
        self.getSpacingsUseCaseMock.reset()
        self.getSizesUseCaseMock.reset()
        self.getDimUseCaseMock.reset()
        self.getShowContentUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension ButtonViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            appearance: stub.givenAppearance,
            intent: stub.givenIntent,
            variant: stub.givenVariant,
            shape: stub.givenShape,
            size: stub.givenSize,
            type: stub.givenType,
            contentVisibility: stub.givenContentVisibility,
            removeStyles: stub.givenRemoveStyles,
            isEnabled: stub.givenIsEnabled,
            isLoading: stub.givenIsLoading
        )
    }
}

private func XCTAssertNotCalled(
    on stub: Stub,
    getBorderUseCase: Bool = false,
    getColorsUseCase: Bool = false,
    getSpacingsUseCase: Bool = false,
    getSizesUseCase: Bool = false,
    getDimUseCase: Bool = false,
    getTitleFontTokenUseCase: Bool = false,
    getShowContentUseCase: Bool = false
) {
    ButtonGetBorderUseCaseableMockTest.XCTCalled(
        stub.getBorderUseCaseMock,
        executeWithThemeAndAppearanceAndIntentAndShapeAndVariantAndRemoveStylesCalled: !getBorderUseCase
    )

    ButtonGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndAppearanceAndIntentAndVariantAndIsPressedCalled: !getColorsUseCase
    )

    ButtonGetTitleFontTokenUseCaseableMockTest.XCTCalled(
        stub.getTitleFontTokenUseCaseMock,
        executeWithThemeCalled: !getTitleFontTokenUseCase
    )

    ButtonGetSpacingsUseCaseableMockTest.XCTCalled(
        stub.getSpacingsUseCaseMock,
        executeWithThemeAndTypeAndContentVisibilityCalled: !getSpacingsUseCase
    )

    ButtonGetSizesUseCaseableMockTest.XCTCalled(
        stub.getSizesUseCaseMock,
        executeWithSizeAndTypeAndContentVisibilityAndRemoveStylesAndIsLoadingCalled: !getSizesUseCase
    )

    ButttonGetDimUseCaseableMockTest.XCTCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase
    )

    ButtonGetShowContentUseCaseableMockTest.XCTCalled(
        stub.getShowContentUseCaseMock,
        executeWithTypeAndContentVisibilityAndIsLoadingCalled: !getShowContentUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherBorder: ButtonBorder? = nil,
    otherColors: ButtonColors? = nil,
    otherLayout: ButtonLayout? = nil,
    otherSizes: ButtonSizes? = nil,
    otherDim: CGFloat? = nil,
    otherTitleFontToken: (any TypographyFontToken)? = nil,
    otherShowContent: Bool? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.border,
        otherBorder ?? stub.expectedBorder,
        "Wrong border value"
    )
    XCTAssertEqual(
        viewModel.colors,
        otherColors ?? stub.expectedColors,
        "Wrong colors value"
    )
    XCTAssertEqual(
        viewModel.layout,
        otherLayout ?? stub.expectedLayout,
        "Wrong layout value"
    )
    XCTAssertEqual(
        viewModel.sizes,
        otherSizes ?? stub.expectedSizes,
        "Wrong sizes value"
    )
    XCTAssertEqual(
        viewModel.dim,
        otherDim ?? stub.expectedDim,
        "Wrong dim value"
    )
    XCTAssertTrue(
        viewModel.titleFontToken.equals(otherTitleFontToken ?? stub.expectedTitleFontToken),
        "Wrong titleFontToken value"
    )
    XCTAssertEqual(
        viewModel.showContent,
        otherShowContent ?? stub.expectedShowContent,
        "Wrong showContent value"
    )
}
