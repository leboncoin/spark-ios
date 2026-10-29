//
//  RatingViewModelTests.swift
//  SparkComponentRatingTests
//
//  Created by robin.lemaire on 08/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
import SwiftUI
@testable import SparkComponentRating
@_spi(SI_SPI) @testable import SparkComponentRatingTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming

@MainActor
@Suite("Rating ViewModel Tests")
struct RatingViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        #expect(stub.viewModel.theme == nil)

        expectEqualToExpected(
            on: stub,
            otherColors: RatingColors()
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getFillingUseCase: true
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

        RatingGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getFillingUseCase: true
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update colors and spacing only")
    func themeChangedShouldUpdateColorsAndSpacingOnly() {
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

        RatingGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getFillingUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherColors: RatingColors()
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getFillingUseCase: true
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

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getFillingUseCase: true
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

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getFillingUseCase: true
        )
    }

    // MARK: - GetFilling

    @Test("Get filling should call use case")
    func getFillingShouldCallUseCase() {
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
        #expect(result == stub.expectedFilling)

        RatingGetFillingRatioUseCaseableMockTest.expect(
            stub.getFillingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIndex: stub.givenIndex,
            givenCount: stub.givenCount,
            givenRating: stub.givenRating,
            expectedReturnValue: stub.expectedFilling
        )

        expectNotCalled(
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

private func expectNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getFillingUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    RatingGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    RatingGetFillingRatioUseCaseableMockTest.expectCalled(
        stub.getFillingUseCaseMock,
        executeWithIndexAndCountAndRatingCalled: !getFillingUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherColors: RatingColors? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.colors == (otherColors ?? stub.expectedColors),
        "Wrong colors value",
        sourceLocation: sourceLocation
    )
}
