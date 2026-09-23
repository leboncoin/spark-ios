//
//  DividerViewModelTests.swift
//  SparkComponentDividerUnitTests
//
//  Created by robin.lemaire on 14/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SparkTheming

@testable import SparkComponentDivider
@_spi(SI_SPI) @testable import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class DividerViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        XCTAssertEqual(viewModel.colors, DividerColors(), "Wrong colors value")
        XCTAssertEqual(viewModel.separatorWidthTypes, DividerSeparatorWidthTypes(), "Wrong separator widths value")
        XCTAssertEqual(viewModel.spacing, 0, "Wrong spacing value")
        XCTAssertTrue(viewModel.textFont is TypographyFontTokenClear, "Wrong textFont value")

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSeparatorWidthTypesUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
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

        DividerGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        DividerGetSeparatorWidthTypesUseCaseableMockTest.XCTAssert(
            stub.getSeparatorWidthTypesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAlignment: stub.givenAlignment,
            givenAxis: stub.givenAxis,
            expectedReturnValue: stub.expectedSeparatorWidthTypes
        )

        DividerGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        DividerGetTextFontUseCaseableMockTest.XCTAssert(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTextFont
        )
    }

    // MARK: - Property Changes

    func test_themeChanged_shouldUpdateDependentProperties() {
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

        DividerGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        DividerGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        DividerGetTextFontUseCaseableMockTest.XCTAssert(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedTextFont
        )

        XCTAssertNotCalled(
            on: stub,
            getSeparatorWidthTypesUseCase: true
        )
    }

    func test_alignmentChanged_shouldUpdateSeparatorWidthTypesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newAlignment: DividerAlignment = .leading

        // WHEN
        viewModel.alignment = newAlignment

        // THEN
        XCTAssertEqualToExpected(on: stub)

        DividerGetSeparatorWidthTypesUseCaseableMockTest.XCTAssert(
            stub.getSeparatorWidthTypesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAlignment: newAlignment,
            givenAxis: stub.givenAxis,
            expectedReturnValue: stub.expectedSeparatorWidthTypes
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
        )
    }

    func test_axisChanged_shouldUpdateSeparatorWidthTypesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newAxis: DividerAxis = .vertical

        // WHEN
        viewModel.axis = newAxis

        // THEN
        XCTAssertEqualToExpected(on: stub)

        DividerGetSeparatorWidthTypesUseCaseableMockTest.XCTAssert(
            stub.getSeparatorWidthTypesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAlignment: stub.givenAlignment,
            givenAxis: newAxis,
            expectedReturnValue: stub.expectedSeparatorWidthTypes
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
        )
    }

    func test_intentChanged_shouldUpdateColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent: DividerIntent = .outlineHigh

        // WHEN
        viewModel.intent = newIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        DividerGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getSeparatorWidthTypesUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.axis = .vertical
        viewModel.alignment = .leading
        viewModel.intent = .outlineHigh

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherColors: DividerColors(),
            otherSeparatorWidthTypes: DividerSeparatorWidthTypes(),
            otherSpacing: 0,
            otherTextFont: TypographyFontTokenClear()
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSeparatorWidthTypesUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
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
        viewModel.axis = stub.givenAxis
        viewModel.alignment = stub.givenAlignment
        viewModel.intent = stub.givenIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSeparatorWidthTypesUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
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
        viewModel.axis = nil
        viewModel.alignment = nil
        viewModel.intent = nil

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSeparatorWidthTypesUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenAxis: DividerAxis = .horizontal
    let givenAlignment: DividerAlignment = .center
    let givenIntent: DividerIntent = .outline

    // MARK: - Expected

    let expectedColors = DividerColors(
        text: ColorTokenGeneratedMock.blue(),
        separator: ColorTokenGeneratedMock.red()
    )
    let expectedSeparatorWidthTypes = DividerSeparatorWidthTypes(
        first: .fixed,
        last: .dynamic
    )
    let expectedSpacing: CGFloat = 8
    let expectedTextFont = TypographyFontTokenGeneratedMock.mocked(.title2)

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: DividerGetColorsUseCaseableGeneratedMock
    let getSeparatorWidthTypesUseCaseMock: DividerGetSeparatorWidthTypesUseCaseableGeneratedMock
    let getSpacingUseCaseMock: DividerGetSpacingUseCaseableGeneratedMock
    let getTextFontUseCaseMock: DividerGetTextFontUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: DividerViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = DividerGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedColors

        let getSeparatorWidthTypesUseCaseMock = DividerGetSeparatorWidthTypesUseCaseableGeneratedMock()
        getSeparatorWidthTypesUseCaseMock.executeWithAlignmentAndAxisReturnValue = self.expectedSeparatorWidthTypes

        let getSpacingUseCaseMock = DividerGetSpacingUseCaseableGeneratedMock()
        getSpacingUseCaseMock.executeWithThemeReturnValue = self.expectedSpacing

        let getTextFontUseCaseMock = DividerGetTextFontUseCaseableGeneratedMock()
        getTextFontUseCaseMock.executeWithThemeReturnValue = self.expectedTextFont

        self.viewModel = DividerViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getSeparatorWidthTypesUseCase: getSeparatorWidthTypesUseCaseMock,
            getSpacingUseCase: getSpacingUseCaseMock,
            getTextFontUseCase: getTextFontUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getSeparatorWidthTypesUseCaseMock = getSeparatorWidthTypesUseCaseMock
        self.getSpacingUseCaseMock = getSpacingUseCaseMock
        self.getTextFontUseCaseMock = getTextFontUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getSeparatorWidthTypesUseCaseMock.reset()
        self.getSpacingUseCaseMock.reset()
        self.getTextFontUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension DividerViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            alignment: stub.givenAlignment,
            axis: stub.givenAxis,
            intent: stub.givenIntent
        )
    }
}

private func XCTAssertNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getSeparatorWidthTypesUseCase: Bool = false,
    getSpacingUseCase: Bool = false,
    getTextFontUseCase: Bool = false
) {
    DividerGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorsUseCase
    )

    DividerGetSeparatorWidthTypesUseCaseableMockTest.XCTCalled(
        stub.getSeparatorWidthTypesUseCaseMock,
        executeWithAlignmentAndAxisCalled: !getSeparatorWidthTypesUseCase
    )

    DividerGetSpacingUseCaseableMockTest.XCTCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingUseCase
    )

    DividerGetTextFontUseCaseableMockTest.XCTCalled(
        stub.getTextFontUseCaseMock,
        executeWithThemeCalled: !getTextFontUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherColors: DividerColors? = nil,
    otherSeparatorWidthTypes: DividerSeparatorWidthTypes? = nil,
    otherSpacing: CGFloat? = nil,
    otherTextFont: (any TypographyFontToken)? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.colors,
        otherColors ?? stub.expectedColors,
        "Wrong colors value"
    )

    XCTAssertEqual(
        viewModel.separatorWidthTypes,
        otherSeparatorWidthTypes ?? stub.expectedSeparatorWidthTypes,
        "Wrong separatorWidthTypes value"
    )

    XCTAssertEqual(
        viewModel.spacing,
        otherSpacing ?? stub.expectedSpacing,
        "Wrong spacing value"
    )

    XCTAssertTrue(
        viewModel.textFont.equals(otherTextFont ?? stub.expectedTextFont),
        "Wrong textFont value"
    )
}
