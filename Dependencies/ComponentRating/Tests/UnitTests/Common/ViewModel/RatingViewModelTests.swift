//
//  RatingViewModelTests.swift
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

final class RatingViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertNil(stub.viewModel.theme)

        XCTAssertEqualToExpected(
            on: stub,
            otherColors: RatingColors()
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getFillingUseCase: true
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

        RatingGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getFillingUseCase: true
        )
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

        RatingGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedColors
        )

        XCTAssertNotCalled(
            on: stub,
            getFillingUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherColors: RatingColors()
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getFillingUseCase: true
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

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getFillingUseCase: true
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

        // THEN
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true,
            getFillingUseCase: true
        )
    }

    // MARK: - GetFilling

    func test_getFilling_shouldCallUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        let result = viewModel.getFillingRatio(
            at: stub.givenIndex,
            count: stub.givenCount,
            value: stub.givenRating
        )

        // THEN
        XCTAssertEqual(result, stub.expectedFilling)

        RatingGetFillingRatioUseCaseableMockTest.XCTAssert(
            stub.getFillingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIndex: stub.givenIndex,
            givenCount: stub.givenCount,
            givenRating: stub.givenRating,
            expectedReturnValue: stub.expectedFilling
        )

        XCTAssertNotCalled(
            on: stub,
            getColorsUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIndex: Int = 0
    let givenCount: Int = 5
    let givenRating: Double = 3.5

    // MARK: - Expected

    let expectedColors = RatingColors(
        filledStarTintColorToken: ColorTokenGeneratedMock.green(),
        strokeStarTintColorToken: ColorTokenGeneratedMock.red()
    )
    let expectedFilling: CGFloat = 0.5

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: RatingGetColorsUseCaseableGeneratedMock
    let getFillingUseCaseMock: RatingGetFillingRatioUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: RatingViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = RatingGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeReturnValue = self.expectedColors

        let getFillingUseCaseMock = RatingGetFillingRatioUseCaseableGeneratedMock()
        getFillingUseCaseMock.executeWithIndexAndCountAndRatingReturnValue = self.expectedFilling

        self.viewModel = RatingViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getFillingRatioUseCase: getFillingUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getFillingUseCaseMock = getFillingUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getFillingUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension RatingViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme
        )
    }
}

private func XCTAssertNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getFillingUseCase: Bool = false
) {
    RatingGetColorsUseCaseableMockTest.XCTCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeCalled: !getColorsUseCase
    )

    RatingGetFillingRatioUseCaseableMockTest.XCTCalled(
        stub.getFillingUseCaseMock,
        executeWithIndexAndCountAndRatingCalled: !getFillingUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherColors: RatingColors? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertTrue(
        viewModel.colors == (otherColors ?? stub.expectedColors),
        "Wrong colors value"
    )
}
