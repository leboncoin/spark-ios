//
//  BadgeViewModelTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 05/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentBadge
@_spi(SI_SPI) @testable import SparkComponentBadgeTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

@MainActor
@Suite("Badge ViewModel Tests")
struct BadgeViewModelTests {

    // MARK: - Initialization Test

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherColors: BadgeColors(),
            otherSizes: BadgeSizes(),
            otherCornerRadius: 0,
            otherTextFont: TypographyFontTokenClear(),
            otherIsNoText: true
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getSizesUseCase: true,
            getTextFontUseCase: true,
            getTextUseCase: true
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

        // UseCase Calls Count
        BadgeGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        BadgeGetCornerRadiusUseCaseableMockTest.expect(
            stub.getCornerRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedCornerRadius
        )

        BadgeGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            givenIsBorder: stub.givenIsBorder,
            givenValue: stub.givenValue,
            expectedReturnValue: stub.expectedSizes
        )

        BadgeGetTextFontUseCaseableMockTest.expect(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedTextFont
        )

        BadgeGetTextUseCaseableMockTest.expect(
            stub.getTextUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: stub.givenValue,
            givenUnit: stub.givenUnit,
            expectedReturnValue: stub.expectedText
        )
    }

    // MARK: - Property Change Tests

    @Test("Theme changed should update many properties")
    func themeChangedShouldUpdateManyProperties() {
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

        // UseCase Calls Count
        BadgeGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        BadgeGetCornerRadiusUseCaseableMockTest.expect(
            stub.getCornerRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedCornerRadius
        )

        BadgeGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenSize: stub.givenSize,
            givenIsBorder: stub.givenIsBorder,
            givenValue: stub.givenValue,
            expectedReturnValue: stub.expectedSizes
        )

        BadgeGetTextFontUseCaseableMockTest.expect(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedTextFont
        )

        expectNotCalled(
            on: stub,
            getTextUseCase: true
        )
    }

    @Test("Intent changed should update colors")
    func intentChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIntent = BadgeIntent.danger

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        expectEqualToExpected(on: stub)

        BadgeGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getCornerRadiusUseCase: true,
            getSizesUseCase: true,
            getTextFontUseCase: true,
            getTextUseCase: true
        )
    }

    @Test("Is border changed should update colors")
    func isBorderChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsBorder = !stub.givenIsBorder

        // WHEN
        viewModel.isBorder = givenIsBorder

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        BadgeGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            givenIsBorder: givenIsBorder,
            givenValue: stub.givenValue,
            expectedReturnValue: stub.expectedSizes
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getTextFontUseCase: true,
            getTextUseCase: true
        )
    }

    @Test("Size changed should update sizes and text font")
    func sizeChangedShouldUpdateSizesAndTextFont() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenSize = BadgeSize.medium

        // WHEN
        viewModel.size = givenSize

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        BadgeGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: givenSize,
            givenIsBorder: stub.givenIsBorder,
            givenValue: stub.givenValue,
            expectedReturnValue: stub.expectedSizes
        )

        BadgeGetTextFontUseCaseableMockTest.expect(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: givenSize,
            expectedReturnValue: stub.expectedTextFont
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getTextUseCase: true
        )
    }

    @Test("Unit changed should update text")
    func unitChangedShouldUpdateText() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenUnit = "%"

        // WHEN
        viewModel.unit = givenUnit

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        BadgeGetTextUseCaseableMockTest.expect(
            stub.getTextUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: stub.givenValue,
            givenUnit: givenUnit,
            expectedReturnValue: stub.expectedText
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getSizesUseCase: true,
            getTextFontUseCase: true
        )
    }

    @Test("Value changed should update text")
    func valueChangedShouldUpdateText() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenValue = 999

        // WHEN
        viewModel.value = givenValue

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        BadgeGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            givenIsBorder: stub.givenIsBorder,
            givenValue: givenValue,
            expectedReturnValue: stub.expectedSizes
        )

        BadgeGetTextUseCaseableMockTest.expect(
            stub.getTextUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: givenValue,
            givenUnit: stub.givenUnit,
            expectedReturnValue: stub.expectedText
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getTextFontUseCase: true
        )
    }

    @Test("Properties changed without setup before should not call use cases")
    func propertiesChangedWithoutSetupBeforeShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .danger
        viewModel.size = .medium
        viewModel.unit = "%"
        viewModel.value = 10

        // THEN
        expectEqualToExpected(
            on: stub,
            otherColors: BadgeColors(),
            otherSizes: BadgeSizes(),
            otherCornerRadius: 0,
            otherTextFont: TypographyFontTokenClear(),
            otherIsNoText: true
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getSizesUseCase: true,
            getTextFontUseCase: true,
            getTextUseCase: true
        )
    }

    @Test("Properties changed without change should not call use cases")
    func propertiesChangedWithoutChangeShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.intent = stub.givenIntent
        viewModel.size = stub.givenSize
        viewModel.unit = stub.givenUnit
        viewModel.value = stub.givenValue

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getSizesUseCase: true,
            getTextFontUseCase: true,
            getTextUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent = BadgeIntent.success
    let givenIsBorder = false
    let givenSize = BadgeSize.small
    var givenValue: Int? = 24
    var givenUnit: String? = "k"

    // MARK: - Expected Properties

    let expectedColors = BadgeColors(
        background: ColorTokenGeneratedMock.blue(),
        border: ColorTokenGeneratedMock.green(),
        foreground: ColorTokenGeneratedMock.orange()
    )
    let expectedSizes = BadgeSizes(content: 4, border: 5, horizontalSpacing: 6)
    let expectedCornerRadius: CGFloat = 10.0
    let expectedTextFont = TypographyFontTokenGeneratedMock.mocked(.title2)
    let expectedText = "24k"

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: BadgeGetColorsUseCaseableGeneratedMock
    let getCornerRadiusUseCaseMock: BadgeGetCornerRadiusUseCaseableGeneratedMock
    let getSizesUseCaseMock: BadgeGetSizesUseCaseableGeneratedMock
    let getTextFontUseCaseMock: BadgeGetTextFontUseCaseableGeneratedMock
    let getTextUseCaseMock: BadgeGetTextUseCaseableGeneratedMock

    // MARK: - View Model

    let viewModel: BadgeViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = BadgeGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedColors

        let getCornerRadiusUseCaseMock = BadgeGetCornerRadiusUseCaseableGeneratedMock()
        getCornerRadiusUseCaseMock.executeWithThemeReturnValue = self.expectedCornerRadius

        let getSizesUseCaseMock = BadgeGetSizesUseCaseableGeneratedMock()
        getSizesUseCaseMock.executeWithThemeAndSizeAndIsBorderAndValueReturnValue = self.expectedSizes

        let getTextFontUseCaseMock = BadgeGetTextFontUseCaseableGeneratedMock()
        getTextFontUseCaseMock.executeWithThemeAndSizeReturnValue = self.expectedTextFont

        let getTextUseCaseMock = BadgeGetTextUseCaseableGeneratedMock()
        getTextUseCaseMock.executeWithValueAndUnitReturnValue = self.expectedText

        self.viewModel = BadgeViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getCornerRadiusUseCase: getCornerRadiusUseCaseMock,
            getSizesUseCase: getSizesUseCaseMock,
            getTextFontUseCase: getTextFontUseCaseMock,
            getTextUseCase: getTextUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getCornerRadiusUseCaseMock = getCornerRadiusUseCaseMock
        self.getSizesUseCaseMock = getSizesUseCaseMock
        self.getTextFontUseCaseMock = getTextFontUseCaseMock
        self.getTextUseCaseMock = getTextUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getCornerRadiusUseCaseMock.reset()
        self.getSizesUseCaseMock.reset()
        self.getTextFontUseCaseMock.reset()
        self.getTextUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension BadgeViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            isBorder: stub.givenIsBorder,
            size: stub.givenSize,
            value: stub.givenValue,
            unit: stub.givenUnit
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getColorsUseCase getColorsUseCaseNotCalled: Bool = false,
    getCornerRadiusUseCase getCornerRadiusUseCaseNotCalled: Bool = false,
    getLayoutUseCase getLayoutUseCaseNotCalled: Bool = false,
    getSizesUseCase getSizesUseCaseNotCalled: Bool = false,
    getTextFontUseCase getTextFontUseCaseNotCalled: Bool = false,
    getTextUseCase getTextUseCaseNotCalled: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    BadgeGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorsUseCaseNotCalled,
        sourceLocation: sourceLocation
    )

    BadgeGetCornerRadiusUseCaseableMockTest.expectCalled(
        stub.getCornerRadiusUseCaseMock,
        executeWithThemeCalled: !getCornerRadiusUseCaseNotCalled,
        sourceLocation: sourceLocation
    )

    BadgeGetSizesUseCaseableMockTest.expectCalled(
        stub.getSizesUseCaseMock,
        executeWithThemeAndSizeAndIsBorderAndValueCalled: !getSizesUseCaseNotCalled,
        sourceLocation: sourceLocation
    )

    BadgeGetTextFontUseCaseableMockTest.expectCalled(
        stub.getTextFontUseCaseMock,
        executeWithThemeAndSizeCalled: !getTextFontUseCaseNotCalled,
        sourceLocation: sourceLocation
    )

    BadgeGetTextUseCaseableMockTest.expectCalled(
        stub.getTextUseCaseMock,
        executeWithValueAndUnitCalled: !getTextUseCaseNotCalled,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherColors: BadgeColors? = nil,
    otherSizes: BadgeSizes? = nil,
    otherCornerRadius: CGFloat? = nil,
    otherTextFont: (any TypographyFontToken)? = nil,
    otherIsNoText: Bool? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.colors == (otherColors ?? stub.expectedColors),
        "Wrong colors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.sizes == (otherSizes ?? stub.expectedSizes),
        "Wrong sizes value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.cornerRadius == (otherCornerRadius ?? stub.expectedCornerRadius),
        "Wrong cornerRadius value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.textFont.equals(otherTextFont ?? stub.expectedTextFont),
        "Wrong textFont value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.text == (otherIsNoText == true ? nil : stub.expectedText),
        "Wrong text value",
        sourceLocation: sourceLocation
    )
}

