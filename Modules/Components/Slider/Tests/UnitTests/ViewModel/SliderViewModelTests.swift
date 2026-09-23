//
//  SliderViewModelTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import UIKit

@testable import SparkComponentSlider
@_spi(SI_SPI) @testable import SparkComponentSliderTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting

final class SliderViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        XCTAssertNil(viewModel.theme)
        XCTAssertNil(viewModel.intent)
        XCTAssertNil(viewModel.isFloatingValueLabel)
        XCTAssertNil(viewModel.isEnabled)

        XCTAssertEqualToExpected(
            on: stub,
            otherColors: SliderColors(),
            otherDim: .zero,
            otherSpacing: .zero,
            otherTypographies: SliderTypographies()
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
            getSpacingUseCase: true,
            getTypographiesUseCase: true
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

        SliderGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        SliderGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        SliderGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        SliderGetTypographiesUseCaseableMockTest.XCTAssert(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsFloatingValueLabel: stub.givenIsFloatingValueLabel,
            expectedReturnValue: stub.expectedTypographies
        )
    }

    // MARK: - Property Changes

    func test_themeChanged_shouldUpdateColorsAndDimAndTypographiesAndSpacing() {
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

        SliderGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        SliderGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        SliderGetSpacingUseCaseableMockTest.XCTAssert(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        SliderGetTypographiesUseCaseableMockTest.XCTAssert(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsFloatingValueLabel: stub.givenIsFloatingValueLabel,
            expectedReturnValue: stub.expectedTypographies
        )
    }

    func test_intentChanged_shouldUpdateColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = SliderIntent.accent

        // WHEN
        viewModel.intent = newIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        SliderGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getDimUseCase: true,
            getSpacingUseCase: true,
            getTypographiesUseCase: true
        )
    }

    func test_isEnabledChanged_shouldUpdateDimOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsEnabled = false

        // WHEN
        viewModel.isEnabled = newIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        SliderGetDimUseCaseableMockTest.XCTAssert(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: newIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSpacingUseCase: true,
            getTypographiesUseCase: true
        )
    }

    func test_isFloatingValueLabelChanged_shouldUpdateTypographiesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsFloatingValueLabel = true

        // WHEN
        viewModel.isFloatingValueLabel = newIsFloatingValueLabel

        // THEN
        XCTAssertEqualToExpected(on: stub)

        SliderGetTypographiesUseCaseableMockTest.XCTAssert(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsFloatingValueLabel: newIsFloatingValueLabel,
            expectedReturnValue: stub.expectedTypographies
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
            getSpacingUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = SliderIntent.support
        viewModel.isFloatingValueLabel = true
        viewModel.isEnabled = false

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherColors: SliderColors(),
            otherDim: 0,
            otherSpacing: 0.0,
            otherTypographies: SliderTypographies()
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
            getSpacingUseCase: true,
            getTypographiesUseCase: true
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
        viewModel.intent = stub.givenIntent
        viewModel.isFloatingValueLabel = stub.givenIsFloatingValueLabel
        viewModel.isEnabled = stub.givenIsEnabled

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
            getSpacingUseCase: true,
            getTypographiesUseCase: true
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
        viewModel.intent = nil
        viewModel.isFloatingValueLabel = nil
        viewModel.isEnabled = nil

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
            getSpacingUseCase: true,
            getTypographiesUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: SliderIntent = .main
    let givenIsFloatingValueLabel: Bool = false
    let givenIsEnabled: Bool = true

    // MARK: - Expected

    let expectedColors = SliderColors(
        tintColorToken: ColorTokenGeneratedMock.random(),
        titleColorToken: ColorTokenGeneratedMock.random(),
        valueColorToken: ColorTokenGeneratedMock.random(),
        rangeValuesColorToken: ColorTokenGeneratedMock.random()
    )
    let expectedDim: CGFloat = 1.0
    let expectedSpacing: CGFloat = 8.0
    let expectedTypographies = SliderTypographies(
        titleFontToken: TypographyFontTokenGeneratedMock.body(),
        valueFontToken: TypographyFontTokenGeneratedMock.title(),
        rangeValuesFontToken: TypographyFontTokenGeneratedMock.footnote()
    )

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: SliderGetColorsUseCaseableGeneratedMock
    let getDimUseCaseMock: SliderGetDimUseCaseableGeneratedMock
    let getSpacingUseCaseMock: SliderGetSpacingUseCaseableGeneratedMock
    let getTypographiesUseCaseMock: SliderGetTypographiesUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: SliderViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = SliderGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedColors

        let getDimUseCaseMock = SliderGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getSpacingUseCaseMock = SliderGetSpacingUseCaseableGeneratedMock()
        getSpacingUseCaseMock.executeWithThemeReturnValue = self.expectedSpacing

        let getTypographiesUseCaseMock = SliderGetTypographiesUseCaseableGeneratedMock()
        getTypographiesUseCaseMock.executeWithThemeAndIsFloatingValueLabelReturnValue = self.expectedTypographies

        self.viewModel = SliderViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getSpacingUseCase: getSpacingUseCaseMock,
            getTypographiesUseCase: getTypographiesUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getDimUseCaseMock = getDimUseCaseMock
        self.getSpacingUseCaseMock = getSpacingUseCaseMock
        self.getTypographiesUseCaseMock = getTypographiesUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getDimUseCaseMock.reset()
        self.getSpacingUseCaseMock.reset()
        self.getTypographiesUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension SliderViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            isFloatingValueLabel: stub.givenIsFloatingValueLabel,
            isEnabled: stub.givenIsEnabled
        )
    }
}

private func XCTAssertNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getDimUseCase: Bool = false,
    getSpacingUseCase: Bool = false,
    getTypographiesUseCase: Bool = false
) {
    SliderGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorsUseCase
    )

    SliderGetDimUseCaseableMockTest.XCTCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase
    )

    SliderGetSpacingUseCaseableMockTest.XCTCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingUseCase
    )

    SliderGetTypographiesUseCaseableMockTest.XCTCalled(
        stub.getTypographiesUseCaseMock,
        executeWithThemeAndIsFloatingValueLabelCalled: !getTypographiesUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherColors: SliderColors? = nil,
    otherDim: CGFloat? = nil,
    otherSpacing: CGFloat? = nil,
    otherTypographies: SliderTypographies? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.colors,
        otherColors ?? stub.expectedColors,
        "Wrong colors value"
    )
    XCTAssertEqual(
        viewModel.dim,
        otherDim ?? stub.expectedDim,
        "Wrong dim value"
    )
    XCTAssertEqual(
        viewModel.spacing,
        otherSpacing ?? stub.expectedSpacing,
        "Wrong spacing value"
    )
    XCTAssertEqual(
        viewModel.typographies,
        otherTypographies ?? stub.expectedTypographies,
        "Wrong typographies value"
    )
}
