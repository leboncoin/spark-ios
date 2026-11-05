//
//  RatingDisplayViewModelTests.swift
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
@Suite("Rating Display ViewModel Tests")
struct RatingDisplayViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        #expect(stub.viewModel.theme == nil)
        #expect(stub.viewModel.size == nil)

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getTextStylesUseCase: true
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

        RatingDisplayGetSpacingsUseCaseableMockTest.expect(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacings
        )

        expectNotCalled(on: stub)
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

        RatingDisplayGetSpacingsUseCaseableMockTest.expect(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSpacings
        )

        RatingDisplayGetTextStylesUseCaseableMockTest.expect(
            stub.getTextStylesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedTextStyle
        )

        expectNotCalled(on: stub)
    }

    @Test("Size changed should update spacing only")
    func sizeChangedShouldUpdateSpacingOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize = RatingDisplaySize.large

        // WHEN
        viewModel.size = newSize

        // THEN
        expectEqualToExpected(on: stub)

        RatingDisplayGetTextStylesUseCaseableMockTest.expect(
            stub.getTextStylesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: newSize,
            expectedReturnValue: stub.expectedTextStyle
        )

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.size = .large

        // THEN
        expectEqualToExpected(
            on: stub,
            otherSpacings: RatingDisplaySpacings(),
            otherTextStyle: RatingDisplayTextStyles()
        )

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getTextStylesUseCase: true
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
        viewModel.size = stub.givenSize

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getSpacingUseCase: true,
            getTextStylesUseCase: true
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
        viewModel.size = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
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

private func expectNotCalled(
    on stub: Stub,
    getSpacingUseCase: Bool = false,
    getTextStylesUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    RatingDisplayGetSpacingsUseCaseableMockTest.expectCalled(
        stub.getSpacingsUseCaseMock,
        executeWithThemeCalled: !getSpacingUseCase,
        sourceLocation: sourceLocation
    )

    RatingDisplayGetTextStylesUseCaseableMockTest.expectCalled(
        stub.getTextStylesUseCaseMock,
        executeWithThemeAndSizeCalled: !getTextStylesUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherSpacings: RatingDisplaySpacings? = nil,
    otherTextStyle: RatingDisplayTextStyles? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.spacings == otherSpacings ?? stub.expectedSpacings,
        "Wrong spacings value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.textStyles == otherTextStyle ?? stub.expectedTextStyle,
        "Wrong textStyles value",
        sourceLocation: sourceLocation
    )
}
