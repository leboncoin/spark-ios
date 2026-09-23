//
//  RatingDisplayViewModelTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentRating
@_spi(SI_SPI) @testable import SparkComponentRatingTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

final class RatingDisplayViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertNil(stub.viewModel.theme)
        XCTAssertNil(stub.viewModel.size)

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getTextStylesUseCase: true
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

        RatingDisplayGetSpacingsUseCaseableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacings
        )

        XCTAssertNotCalled(on: stub)
    }

    // MARK: - Property Changes

    func test_themeChanged_shouldUpdateColorsAndSpacingOnly() {
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

        RatingDisplayGetSpacingsUseCaseableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSpacings
        )

        RatingDisplayGetTextStylesUseCaseableMockTest.XCTAssert(
            stub.getTextStylesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedTextStyle
        )

        XCTAssertNotCalled(on: stub)
    }

    func test_sizeChanged_shouldUpdateSpacingOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize = RatingDisplaySize.large

        // WHEN
        viewModel.size = newSize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        RatingDisplayGetTextStylesUseCaseableMockTest.XCTAssert(
            stub.getTextStylesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: newSize,
            expectedReturnValue: stub.expectedTextStyle
        )

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.size = .large

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherSpacings: RatingDisplaySpacings(),
            otherTextStyle: RatingDisplayTextStyles()
        )

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getTextStylesUseCase: true
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
        viewModel.size = stub.givenSize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getTextStylesUseCase: true
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
        viewModel.size = nil

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getTextStylesUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenSize: RatingDisplaySize = .small

    // MARK: - Expected

    let expectedFilling: CGFloat = 0.5
    let expectedSpacings = RatingDisplaySpacings(
        content: 0.5,
        stars: 1.5
    )
    let expectedTextStyle = RatingDisplayTextStyles(
        value: .init(
            fontToken: TypographyFontTokenGeneratedMock.mocked(),
            colorToken: ColorTokenGeneratedMock.blue()
        ),
        count: .init(
            fontToken: TypographyFontTokenGeneratedMock.mocked(),
            colorToken: ColorTokenGeneratedMock.red()
        ),
        additional: .init(
            fontToken: TypographyFontTokenGeneratedMock.mocked(),
            colorToken: ColorTokenGeneratedMock.yellow()
        )
    )

    // MARK: - Use Case Mocks

    let getSpacingsUseCaseMock: RatingDisplayGetSpacingsUseCaseableGeneratedMock
    let getTextStylesUseCaseMock: RatingDisplayGetTextStylesUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: RatingDisplayViewModel

    // MARK: - Initialization

    init() {
        let getSpacingsUseCaseMock = RatingDisplayGetSpacingsUseCaseableGeneratedMock()
        getSpacingsUseCaseMock.executeWithThemeReturnValue = self.expectedSpacings

        let getTextStylesUseCaseMock = RatingDisplayGetTextStylesUseCaseableGeneratedMock()
        getTextStylesUseCaseMock.executeWithThemeAndSizeReturnValue = self.expectedTextStyle

        self.viewModel = RatingDisplayViewModel(
            getSpacingUseCase: getSpacingsUseCaseMock,
            getTextStylesUseCase: getTextStylesUseCaseMock
        )

        self.getSpacingsUseCaseMock = getSpacingsUseCaseMock
        self.getTextStylesUseCaseMock = getTextStylesUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getSpacingsUseCaseMock.reset()
        self.getTextStylesUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension RatingDisplayViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            size: stub.givenSize
        )
    }
}

private func XCTAssertNotCalled(
    on stub: Stub,
    getSpacingUseCase: Bool = false,
    getTextStylesUseCase: Bool = false
) {
    RatingDisplayGetSpacingsUseCaseableMockTest.XCTCalled(
        stub.getSpacingsUseCaseMock,
        executeWithThemeCalled: !getSpacingUseCase
    )

    RatingDisplayGetTextStylesUseCaseableMockTest.XCTCalled(
        stub.getTextStylesUseCaseMock,
        executeWithThemeAndSizeCalled: !getTextStylesUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherSpacings: RatingDisplaySpacings? = nil,
    otherTextStyle: RatingDisplayTextStyles? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.spacings,
        otherSpacings ?? stub.expectedSpacings,
        "Wrong spacings value"
    )

    XCTAssertEqual(
        viewModel.textStyles,
        otherTextStyle ?? stub.expectedTextStyle,
        "Wrong textStyles value"
    )
}
