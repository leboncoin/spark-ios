//
//  BadgeViewModelTests.swift
//  SparkComponentBadgeTests
//
//  Created by robin.lemaire on 05/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentBadge
@_spi(SI_SPI) @testable import SparkComponentBadgeTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

final class BadgeViewModelTests: XCTestCase {

    // MARK: - Initialization Test

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherColors: BadgeColors(),
            otherSizes: BadgeSizes(),
            otherCornerRadius: 0,
            otherTextFont: TypographyFontTokenClear(),
            otherIsNoText: true
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getSizesUseCase: true,
            getTextFontUseCase: true,
            getTextUseCase: true
        )
    }

    // MARK: - Setup Tests

    func test_setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        BadgeGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        BadgeGetCornerRadiusUseCaseableMockTest.XCTAssert(
            stub.getCornerRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedCornerRadius
        )

        BadgeGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            givenIsBorder: stub.givenIsBorder,
            givenValue: stub.givenValue,
            expectedReturnValue: stub.expectedSizes
        )

        BadgeGetTextFontUseCaseableMockTest.XCTAssert(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedTextFont
        )

        BadgeGetTextUseCaseableMockTest.XCTAssert(
            stub.getTextUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: stub.givenValue,
            givenUnit: stub.givenUnit,
            expectedReturnValue: stub.expectedText
        )
    }

    // MARK: - Property Change Tests

    func test_themeChanged_shouldUpdateManyProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        BadgeGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        BadgeGetCornerRadiusUseCaseableMockTest.XCTAssert(
            stub.getCornerRadiusUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedCornerRadius
        )

        BadgeGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenSize: stub.givenSize,
            givenIsBorder: stub.givenIsBorder,
            givenValue: stub.givenValue,
            expectedReturnValue: stub.expectedSizes
        )

        BadgeGetTextFontUseCaseableMockTest.XCTAssert(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedTextFont
        )

        XCTAssertNotCalled(
            on: stub,
            getTextUseCase: true
        )
    }

    func test_intentChanged_shouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIntent = BadgeIntent.danger

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        BadgeGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getCornerRadiusUseCase: true,
            getSizesUseCase: true,
            getTextFontUseCase: true,
            getTextUseCase: true
        )
    }

    func test_isBorderChanged_shouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsBorder = !stub.givenIsBorder

        // WHEN
        viewModel.isBorder = givenIsBorder

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        BadgeGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            givenIsBorder: givenIsBorder,
            givenValue: stub.givenValue,
            expectedReturnValue: stub.expectedSizes
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getTextFontUseCase: true,
            getTextUseCase: true
        )
    }

    func test_sizeChanged_shouldUpdateSizesAndTextFont() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenSize = BadgeSize.medium

        // WHEN
        viewModel.size = givenSize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        BadgeGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: givenSize,
            givenIsBorder: stub.givenIsBorder,
            givenValue: stub.givenValue,
            expectedReturnValue: stub.expectedSizes
        )

        BadgeGetTextFontUseCaseableMockTest.XCTAssert(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: givenSize,
            expectedReturnValue: stub.expectedTextFont
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getTextUseCase: true
        )
    }

    func test_unitChanged_shouldUpdateText() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenUnit = "%"

        // WHEN
        viewModel.unit = givenUnit

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        BadgeGetTextUseCaseableMockTest.XCTAssert(
            stub.getTextUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: stub.givenValue,
            givenUnit: givenUnit,
            expectedReturnValue: stub.expectedText
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getSizesUseCase: true,
            getTextFontUseCase: true
        )
    }

    func test_valueChanged_shouldUpdateText() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenValue = 999

        // WHEN
        viewModel.value = givenValue

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        BadgeGetSizesUseCaseableMockTest.XCTAssert(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            givenIsBorder: stub.givenIsBorder,
            givenValue: givenValue,
            expectedReturnValue: stub.expectedSizes
        )

        BadgeGetTextUseCaseableMockTest.XCTAssert(
            stub.getTextUseCaseMock,
            expectedNumberOfCalls: 1,
            givenValue: givenValue,
            givenUnit: stub.givenUnit,
            expectedReturnValue: stub.expectedText
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getTextFontUseCase: true
        )
    }

    func test_propertiesChanged_withoutSetupBefore_shouldNotCallUseCases() {
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
        XCTAssertEqualToExpected(
            on: stub,
            otherColors: BadgeColors(),
            otherSizes: BadgeSizes(),
            otherCornerRadius: 0,
            otherTextFont: TypographyFontTokenClear(),
            otherIsNoText: true
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getCornerRadiusUseCase: true,
            getSizesUseCase: true,
            getTextFontUseCase: true,
            getTextUseCase: true
        )
    }

    func test_propertiesChanged_withoutChange_shouldNotCallUseCases() {
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
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
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

// MARK: - XCT Helpers

private func XCTAssertNotCalled(
    on stub: Stub,
    getColorsUseCase getColorsUseCaseNotCalled: Bool = false,
    getCornerRadiusUseCase getCornerRadiusUseCaseNotCalled: Bool = false,
    getLayoutUseCase getLayoutUseCaseNotCalled: Bool = false,
    getSizesUseCase getSizesUseCaseNotCalled: Bool = false,
    getTextFontUseCase getTextFontUseCaseNotCalled: Bool = false,
    getTextUseCase getTextUseCaseNotCalled: Bool = false
) {
    BadgeGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorsUseCaseNotCalled
    )

    BadgeGetCornerRadiusUseCaseableMockTest.XCTCalled(
        stub.getCornerRadiusUseCaseMock,
        executeWithThemeCalled: !getCornerRadiusUseCaseNotCalled
    )

    BadgeGetSizesUseCaseableMockTest.XCTCalled(
        stub.getSizesUseCaseMock,
        executeWithThemeAndSizeAndIsBorderAndValueCalled: !getSizesUseCaseNotCalled
    )

    BadgeGetTextFontUseCaseableMockTest.XCTCalled(
        stub.getTextFontUseCaseMock,
        executeWithThemeAndSizeCalled: !getTextFontUseCaseNotCalled
    )

    BadgeGetTextUseCaseableMockTest.XCTCalled(
        stub.getTextUseCaseMock,
        executeWithValueAndUnitCalled: !getTextUseCaseNotCalled
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherColors: BadgeColors? = nil,
    otherSizes: BadgeSizes? = nil,
    otherCornerRadius: CGFloat? = nil,
    otherTextFont: (any TypographyFontToken)? = nil,
    otherIsNoText: Bool? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.colors,
        otherColors ?? stub.expectedColors,
        "Wrong colors value"
    )
    XCTAssertEqual(
        viewModel.sizes,
        otherSizes ?? stub.expectedSizes,
        "Wrong sizes value"
    )
    XCTAssertEqual(
        viewModel.cornerRadius,
        otherCornerRadius ?? stub.expectedCornerRadius,
        "Wrong cornerRadius value"
    )
    XCTAssertTrue(
        viewModel.textFont.equals(otherTextFont ?? stub.expectedTextFont),
        "Wrong textFont value"
    )
    XCTAssertEqual(
        viewModel.text,
        otherIsNoText == true ? nil : stub.expectedText,
        "Wrong text value"
    )
}

