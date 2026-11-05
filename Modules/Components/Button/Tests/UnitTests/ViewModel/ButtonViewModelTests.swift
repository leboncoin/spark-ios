//
//  ButtonViewModelTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 12/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import UIKit

@testable import SparkComponentButton
@_spi(SI_SPI) @testable import SparkComponentButtonTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting

@MainActor
@Suite("Button ViewModel Tests")
struct ButtonViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.intent == nil)
        #expect(viewModel.variant == nil)
        #expect(viewModel.shape == nil)
        #expect(viewModel.size == nil)
        #expect(viewModel.contentVisibility == nil)
        #expect(viewModel.type == nil)
        #expect(!viewModel.isPressed)
        #expect(viewModel.isEnabled == nil)
        #expect(viewModel.removeStyles == nil)

        expectEqualToExpected(
            on: stub,
            otherBorder: ButtonBorder(),
            otherColors: ButtonColors(),
            otherLayout: ButtonLayout(),
            otherSizes: ButtonSizes(),
            otherDim: 0,
            otherTitleFontToken: TypographyFontTokenClear(),
            otherShowContent: true
        )

        expectNotCalled(
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

    @Test("Setup should call all use cases")
    func setupShouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        ButtonGetBorderUseCaseableMockTest.expect(
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

        ButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        ButtonGetTitleFontTokenUseCaseableMockTest.expect(
            stub.getTitleFontTokenUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTitleFontToken
        )

        ButtonGetSpacingsUseCaseableMockTest.expect(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            expectedReturnValue: stub.expectedLayout
        )

        ButtonGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenRemoveStyles: stub.givenRemoveStyles,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        ButttonGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        ButtonGetShowContentUseCaseableMockTest.expect(
            stub.getShowContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedShowContent
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

        expectNotCalled(
            on: stub,
            getSizesUseCase: true,
            getShowContentUseCase: true
        )

        ButtonGetBorderUseCaseableMockTest.expect(
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

        ButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        ButtonGetTitleFontTokenUseCaseableMockTest.expect(
            stub.getTitleFontTokenUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedTitleFontToken
        )

        ButtonGetSpacingsUseCaseableMockTest.expect(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            expectedReturnValue: stub.expectedLayout
        )

        ButttonGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
    }

    @Test("Appearance changed should update border and colors only")
    func appearanceChangedShouldUpdateBorderAndColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newAppearance = ButtonAppearance.ai

        // WHEN
        viewModel.appearance = newAppearance

        // THEN
        expectEqualToExpected(on: stub)

        ButtonGetBorderUseCaseableMockTest.expect(
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

        ButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: newAppearance,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    @Test("Intent changed should update border and colors only")
    func intentChangedShouldUpdateBorderAndColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = ButtonIntent.support

        // WHEN
        viewModel.intent = newIntent

        // THEN
        expectEqualToExpected(on: stub)

        ButtonGetBorderUseCaseableMockTest.expect(
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

        ButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: newIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    @Test("Variant changed should update border and colors only")
    func variantChangedShouldUpdateBorderAndColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newVariant = ButtonVariant.ghost

        // WHEN
        viewModel.variant = newVariant

        // THEN
        expectEqualToExpected(on: stub)

        ButtonGetBorderUseCaseableMockTest.expect(
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

        ButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenVariant: newVariant,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    @Test("Shape changed should update border only")
    func shapeChangedShouldUpdateBorderOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newShape = ButtonShape.rounded

        // WHEN
        viewModel.shape = newShape

        // THEN
        expectEqualToExpected(on: stub)

        ButtonGetBorderUseCaseableMockTest.expect(
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

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    @Test("Size changed should update sizes only")
    func sizeChangedShouldUpdateSizesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize = ButtonSize.large

        // WHEN
        viewModel.size = newSize

        // THEN
        expectEqualToExpected(on: stub)

        ButtonGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenRemoveStyles: stub.givenRemoveStyles,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    @Test("Type changed should update layout and sizes and show content only")
    func typeChangedShouldUpdateLayoutAndSizesAndShowContentOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newType = ButtonType.iconButton

        // WHEN
        viewModel.type = newType

        // THEN
        expectEqualToExpected(on: stub)

        ButtonGetSpacingsUseCaseableMockTest.expect(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: newType,
            givenContentVisibility: stub.givenContentVisibility,
            expectedReturnValue: stub.expectedLayout
        )

        ButtonGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenType: newType,
            givenContentVisibility: stub.givenContentVisibility,
            givenRemoveStyles: stub.givenRemoveStyles,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        ButtonGetShowContentUseCaseableMockTest.expect(
            stub.getShowContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: newType,
            givenContentVisibility: stub.givenContentVisibility,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedShowContent
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true
        )
    }

    @Test("Is pressed changed should update colors only")
    func isPressedChangedShouldUpdateColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsPressed = !stub.givenIsPressed

        // WHEN
        viewModel.isPressed = newIsPressed

        // THEN
        expectEqualToExpected(on: stub)

        ButtonGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAppearance: stub.givenAppearance,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: newIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    @Test("Is enabled changed should update dim only")
    func isEnabledChangedShouldUpdateDimOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsEnabled = !stub.givenIsEnabled

        // WHEN
        viewModel.isEnabled = newIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        ButttonGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: newIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getSizesUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    @Test("Content visibility changed should update layout sizes and show content only")
    func contentVisibilityChangedShouldUpdateLayoutSizesAndShowContentOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newContentVisibility = ButtonContentVisibility.hideLabel

        // WHEN
        viewModel.contentVisibility = newContentVisibility

        // THEN
        expectEqualToExpected(on: stub)

        ButtonGetSpacingsUseCaseableMockTest.expect(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenType: stub.givenType,
            givenContentVisibility: newContentVisibility,
            expectedReturnValue: stub.expectedLayout
        )

        ButtonGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenType: stub.givenType,
            givenContentVisibility: newContentVisibility,
            givenRemoveStyles: stub.givenRemoveStyles,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        ButtonGetShowContentUseCaseableMockTest.expect(
            stub.getShowContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.givenType,
            givenContentVisibility: newContentVisibility,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedShowContent
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true
        )
    }

    @Test("Is loading changed should update show content and sizes only")
    func isLoadingChangedShouldUpdateShowContentAndSizesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsLoading = !stub.givenIsLoading

        // WHEN
        viewModel.isLoading = newIsLoading

        // THEN
        expectEqualToExpected(on: stub)

        ButtonGetShowContentUseCaseableMockTest.expect(
            stub.getShowContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenIsLoading: newIsLoading,
            expectedReturnValue: stub.expectedShowContent
        )

        ButtonGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenRemoveStyles: stub.givenRemoveStyles,
            givenIsLoading: newIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true
        )
    }

    @Test("Remove styles changed should update border and sizes only")
    func removeStylesChangedShouldUpdateBorderAndSizesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newRemoveStyles = !stub.givenRemoveStyles

        // WHEN
        viewModel.removeStyles = newRemoveStyles

        // THEN
        expectEqualToExpected(on: stub)

        ButtonGetBorderUseCaseableMockTest.expect(
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

        ButtonGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            givenType: stub.givenType,
            givenContentVisibility: stub.givenContentVisibility,
            givenRemoveStyles: newRemoveStyles,
            givenIsLoading: stub.givenIsLoading,
            expectedReturnValue: stub.expectedSizes
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSpacingsUseCase: true,
            getDimUseCase: true,
            getTitleFontTokenUseCase: true,
            getShowContentUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
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
        expectEqualToExpected(
            on: stub,
            otherBorder: ButtonBorder(),
            otherColors: ButtonColors(),
            otherLayout: ButtonLayout(),
            otherSizes: ButtonSizes(),
            otherDim: 0,
            otherTitleFontToken: TypographyFontTokenClear(),
            otherShowContent: true
        )

        expectNotCalled(
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

    @Test("Properties changed without value change should not call use cases")
    func propertiesChangedWithoutValueChangeShouldNotCallUseCases() {
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
        expectEqualToExpected(on: stub)

        expectNotCalled(
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

    @Test("Properties changed with nil values should not call use cases")
    func propertiesChangedWithNilValuesShouldNotCallUseCases() {
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
        expectEqualToExpected(on: stub)

        expectNotCalled(
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

private func expectNotCalled(
    on stub: Stub,
    getBorderUseCase: Bool = false,
    getColorsUseCase: Bool = false,
    getSpacingsUseCase: Bool = false,
    getSizesUseCase: Bool = false,
    getDimUseCase: Bool = false,
    getTitleFontTokenUseCase: Bool = false,
    getShowContentUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    ButtonGetBorderUseCaseableMockTest.expectCalled(
        stub.getBorderUseCaseMock,
        executeWithThemeAndAppearanceAndIntentAndShapeAndVariantAndRemoveStylesCalled: !getBorderUseCase,
        sourceLocation: sourceLocation
    )

    ButtonGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndAppearanceAndIntentAndVariantAndIsPressedCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    ButtonGetTitleFontTokenUseCaseableMockTest.expectCalled(
        stub.getTitleFontTokenUseCaseMock,
        executeWithThemeCalled: !getTitleFontTokenUseCase,
        sourceLocation: sourceLocation
    )

    ButtonGetSpacingsUseCaseableMockTest.expectCalled(
        stub.getSpacingsUseCaseMock,
        executeWithThemeAndTypeAndContentVisibilityCalled: !getSpacingsUseCase,
        sourceLocation: sourceLocation
    )

    ButtonGetSizesUseCaseableMockTest.expectCalled(
        stub.getSizesUseCaseMock,
        executeWithSizeAndTypeAndContentVisibilityAndRemoveStylesAndIsLoadingCalled: !getSizesUseCase,
        sourceLocation: sourceLocation
    )

    ButttonGetDimUseCaseableMockTest.expectCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase,
        sourceLocation: sourceLocation
    )

    ButtonGetShowContentUseCaseableMockTest.expectCalled(
        stub.getShowContentUseCaseMock,
        executeWithTypeAndContentVisibilityAndIsLoadingCalled: !getShowContentUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherBorder: ButtonBorder? = nil,
    otherColors: ButtonColors? = nil,
    otherLayout: ButtonLayout? = nil,
    otherSizes: ButtonSizes? = nil,
    otherDim: CGFloat? = nil,
    otherTitleFontToken: (any TypographyFontToken)? = nil,
    otherShowContent: Bool? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.border == (otherBorder ?? stub.expectedBorder),
        "Wrong border value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.colors == (otherColors ?? stub.expectedColors),
        "Wrong colors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.layout == (otherLayout ?? stub.expectedLayout),
        "Wrong layout value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.sizes == (otherSizes ?? stub.expectedSizes),
        "Wrong sizes value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.dim == (otherDim ?? stub.expectedDim),
        "Wrong dim value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.titleFontToken.equals(otherTitleFontToken ?? stub.expectedTitleFontToken),
        "Wrong titleFontToken value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.showContent == (otherShowContent ?? stub.expectedShowContent),
        "Wrong showContent value",
        sourceLocation: sourceLocation
    )
}
