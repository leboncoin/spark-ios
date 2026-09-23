//
//  TagViewModelTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 07/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

import Testing
@testable import SparkComponentTag
@_spi(SI_SPI) @testable import SparkComponentTagTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

@Suite("Tag ViewModel Tests")
struct TagViewModelTests {

    // MARK: - Initialization Test

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.intent == nil)
        #expect(viewModel.size == nil)
        #expect(viewModel.variant == nil)

        expectEqualToExpected(
            on: stub,
            otherBorder: .init(),
            otherColors: .init(),
            otherSpacings: .init(),
            otherHeight: .zero,
            otherTextFontToken: TypographyFontTokenClear()
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorder: true,
            getColors: true,
            getHeight: true,
            getSpacings: true,
            getTextFont: true
        )
    }

    // MARK: - Setup Tests

    @Test("Setup should call all use cases")
    func setupShouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        TagGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedBorder
        )

        TagGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            expectedReturnValue: stub.expectedColors
        )

        TagGetHeightUseCaseableMockTest.expect(
            stub.getHeightUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedHeight
        )

        TagGetSpacingsUseCaseableMockTest.expect(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacings
        )

        TagGetTextFontUseCaseableMockTest.expect(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTextFontToken
        )
        // **
    }

    // MARK: - Setter

    @Test("Theme when changed should update all properties except height")
    func themeChangedShouldUpdateAllPropertiesExceptHeight() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
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
            getHeight: true
        )

        TagGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedBorder
        )

        TagGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            expectedReturnValue: stub.expectedColors
        )

        TagGetSpacingsUseCaseableMockTest.expect(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedSpacings
        )

        TagGetTextFontUseCaseableMockTest.expect(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedTextFontToken
        )
        // **
    }

    @Test("Intent should update colors")
    func intentShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIntent = TagIntent.success

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorder: true,
            getHeight: true,
            getSpacings: true,
            getTextFont: true
        )

        TagGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenVariant: stub.givenVariant,
            expectedReturnValue: stub.expectedColors
        )
        // **
    }

    @Test("Size should update border and height")
    func sizeShouldUpdateBorderAndHeight() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenSize = TagSize.medium

        // WHEN
        viewModel.size = givenSize

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getColors: true,
            getSpacings: true,
            getTextFont: true
        )

        TagGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: givenSize,
            expectedReturnValue: stub.expectedBorder
        )

        TagGetHeightUseCaseableMockTest.expect(
            stub.getHeightUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: givenSize,
            expectedReturnValue: stub.expectedHeight
        )
        // **
    }

    @Test("Variant should update border and colors")
    func variantShouldUpdateBorderAndColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenVariant = TagVariant.outlined

        // WHEN
        viewModel.variant = givenVariant

        // THEN
        expectEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorder: true,
            getHeight: true,
            getSpacings: true,
            getTextFont: true
        )

        TagGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: givenVariant,
            expectedReturnValue: stub.expectedColors
        )
        // **
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = stub.givenIntent
        viewModel.size = stub.givenSize
        viewModel.variant = stub.givenVariant

        // THEN
        expectEqualToExpected(
            on: stub,
            otherBorder: .init(),
            otherColors: .init(),
            otherSpacings: .init(),
            otherHeight: .zero,
            otherTextFontToken: TypographyFontTokenClear()
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorder: true,
            getColors: true,
            getHeight: true,
            getSpacings: true,
            getTextFont: true
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
        viewModel.variant = stub.givenVariant

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorder: true,
            getColors: true,
            getHeight: true,
            getSpacings: true,
            getTextFont: true
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
        viewModel.variant = nil

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorder: true,
            getColors: true,
            getHeight: true,
            getSpacings: true,
            getTextFont: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent = TagIntent.danger
    let givenSize = TagSize.large
    let givenVariant = TagVariant.tinted

    // MARK: - Expected Properties

    let expectedBorder = TagBorder()
    let expectedColors = TagColors()
    let expectedSpacings = TagSpacings()
    let expectedHeight: CGFloat = 10
    let expectedTextFontToken = TypographyFontTokenGeneratedMock()

    // MARK: - Use Case Mocks

    let getBorderUseCaseMock: TagGetBorderUseCaseableGeneratedMock
    let getColorsUseCaseMock: TagGetColorsUseCaseableGeneratedMock
    let getHeightUseCaseMock: TagGetHeightUseCaseableGeneratedMock
    let getSpacingsUseCaseMock: TagGetSpacingsUseCaseableGeneratedMock
    let getTextFontUseCaseMock: TagGetTextFontUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: TagViewModel

    // MARK: - Initialization

    init() {
        let getBorderUseCaseMock = TagGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeAndSizeReturnValue = self.expectedBorder

        let getColorsUseCaseMock = TagGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentAndVariantReturnValue = self.expectedColors

        let getHeightUseCaseMock = TagGetHeightUseCaseableGeneratedMock()
        getHeightUseCaseMock.executeWithSizeReturnValue = self.expectedHeight

        let getSpacingsUseCaseMock = TagGetSpacingsUseCaseableGeneratedMock()
        getSpacingsUseCaseMock.executeWithThemeReturnValue = self.expectedSpacings

        let getTextFontUseCaseMock = TagGetTextFontUseCaseableGeneratedMock()
        getTextFontUseCaseMock.executeWithThemeReturnValue = self.expectedTextFontToken

        let viewModel = TagViewModel(
            getBorderUseCase: getBorderUseCaseMock,
            getColorsUseCase: getColorsUseCaseMock,
            getHeightUseCase: getHeightUseCaseMock,
            getSpacingsUseCase: getSpacingsUseCaseMock,
            getTextFontUseCase: getTextFontUseCaseMock
        )

        self.viewModel = viewModel
        self.getBorderUseCaseMock = getBorderUseCaseMock
        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getHeightUseCaseMock = getHeightUseCaseMock
        self.getSpacingsUseCaseMock = getSpacingsUseCaseMock
        self.getTextFontUseCaseMock = getTextFontUseCaseMock
    }

    // MARK: - Methods

    func resetMockedData() {
        self.getBorderUseCaseMock.reset()
        self.getColorsUseCaseMock.reset()
        self.getHeightUseCaseMock.reset()
        self.getSpacingsUseCaseMock.reset()
        self.getTextFontUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension TagViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            size: stub.givenSize,
            variant: stub.givenVariant
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getBorder getBorderNotCalled: Bool = false,
    getColors getColorsNotCalled: Bool = false,
    getHeight getHeightNotCalled: Bool = false,
    getSpacings getSpacingsNotCalled: Bool = false,
    getTextFont getTextFontNotCalled: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    TagGetBorderUseCaseableMockTest.expectCalled(
        stub.getBorderUseCaseMock,
        executeWithThemeAndSizeCalled: !getBorderNotCalled,
        sourceLocation: sourceLocation
    )

    TagGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentAndVariantCalled: !getColorsNotCalled,
        sourceLocation: sourceLocation
    )

    TagGetHeightUseCaseableMockTest.expectCalled(
        stub.getHeightUseCaseMock,
        executeWithSizeCalled: !getHeightNotCalled,
        sourceLocation: sourceLocation
    )

    TagGetSpacingsUseCaseableMockTest.expectCalled(
        stub.getSpacingsUseCaseMock,
        executeWithThemeCalled: !getSpacingsNotCalled,
        sourceLocation: sourceLocation
    )

    TagGetTextFontUseCaseableMockTest.expectCalled(
        stub.getTextFontUseCaseMock,
        executeWithThemeCalled: !getTextFontNotCalled,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherBorder: TagBorder? = nil,
    otherColors: TagColors? = nil,
    otherSpacings: TagSpacings? = nil,
    otherHeight: CGFloat? = nil,
    otherTextFontToken: (any TypographyFontToken)? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    let expectedBorder = otherBorder ?? stub.expectedBorder
    let expectedColors = otherColors ?? stub.expectedColors
    let expectedSpacings = otherSpacings ?? stub.expectedSpacings
    let expectedHeight = otherHeight ?? stub.expectedHeight
    let expectedTextFontToken = otherTextFontToken ?? stub.expectedTextFontToken

    #expect(
        viewModel.border == expectedBorder,
        "Wrong border value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.colors == expectedColors,
        "Wrong colors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.spacings == expectedSpacings,
        "Wrong spacings value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.height == expectedHeight,
        "Wrong height value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.textFont.equals(expectedTextFontToken),
        "Wrong textFont value",
        sourceLocation: sourceLocation
    )
}
