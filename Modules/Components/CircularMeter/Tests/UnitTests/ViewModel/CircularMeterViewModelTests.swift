//
//  CircularMeterViewModelTests.swift
//  SparkComponentCircularMeterTests
//
//  Created by robin.lemaire on 01/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

@testable import SparkComponentCircularMeter
@_spi(SI_SPI) @testable import SparkComponentCircularMeterTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting
import Testing

@Suite("Circular Meter ViewModel Tests")
struct CircularMeterViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.intent == nil)
        #expect(viewModel.size == nil)

        expectEqualToExpected(
            on: stub,
            otherColors: CircularMeterColors(),
            otherSizes: CircularMeterSizes(),
            otherTypographies: CircularMeterTypographies(),
            otherLayout: CircularMeterLayout(),
            otherIsInsideContent: false
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSizesUseCase: true,
            getTypographiesUseCase: true,
            getLayoutUseCase: true,
            getIsInsideContentUseCase: true
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

        CircularMeterGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        CircularMeterGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedSizes
        )

        CircularMeterGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedTypographies
        )

        CircularMeterGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLayout
        )

        CircularMeterGetIsInsideContentUseCaseableMockTest.expect(
            stub.getIsInsideContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedIsInsideContent
        )
    }

    // MARK: - Property Changes

    @Test("Theme when changed should call use cases")
    func themeWhenChangedShouldCallUseCases() {
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

        CircularMeterGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        CircularMeterGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedTypographies
        )

        CircularMeterGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLayout
        )

        expectNotCalled(
            on: stub,
            getSizesUseCase: true,
            getIsInsideContentUseCase: true
        )
    }

    @Test("Intent when changed should call colors use case")
    func intentWhenChangedShouldCallColorsUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newIntent = CircularMeterIntent.error

        // WHEN
        viewModel.intent = newIntent

        // THEN
        expectEqualToExpected(on: stub)

        CircularMeterGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getSizesUseCase: true,
            getTypographiesUseCase: true,
            getLayoutUseCase: true,
            getIsInsideContentUseCase: true
        )
    }

    @Test("Size when changed should call use cases")
    func sizeWhenChangedShouldCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newSize = CircularMeterSize.large

        // WHEN
        viewModel.size = newSize

        // THEN
        expectEqualToExpected(on: stub)

        CircularMeterGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            expectedReturnValue: stub.expectedSizes
        )

        CircularMeterGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: newSize,
            expectedReturnValue: stub.expectedTypographies
        )

        CircularMeterGetIsInsideContentUseCaseableMockTest.expect(
            stub.getIsInsideContentUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: newSize,
            expectedReturnValue: stub.expectedIsInsideContent
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLayoutUseCase: true
        )
    }

    // MARK: - Properties Changed Before Setup

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = .success
        viewModel.size = .medium

        // THEN
        expectEqualToExpected(
            on: stub,
            otherColors: CircularMeterColors(),
            otherSizes: CircularMeterSizes(),
            otherTypographies: CircularMeterTypographies(),
            otherLayout: CircularMeterLayout(),
            otherIsInsideContent: false
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSizesUseCase: true,
            getTypographiesUseCase: true,
            getLayoutUseCase: true,
            getIsInsideContentUseCase: true
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

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSizesUseCase: true,
            getTypographiesUseCase: true,
            getLayoutUseCase: true,
            getIsInsideContentUseCase: true
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

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSizesUseCase: true,
            getTypographiesUseCase: true,
            getLayoutUseCase: true,
            getIsInsideContentUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent = CircularMeterIntent.main
    let givenSize = CircularMeterSize.medium

    let expectedColors = CircularMeterColors(
        trackColorToken: ColorTokenGeneratedMock.random(),
        indicatorColorToken: ColorTokenGeneratedMock.green(),
        iconColorToken: ColorTokenGeneratedMock.random(),
        valueColorToken: ColorTokenGeneratedMock.random(),
        contentColorToken: ColorTokenGeneratedMock.random()
    )
    let expectedSizes = CircularMeterSizes(
        gaugeDiameter: 120.0,
        gaugeStroke: 8.0,
        icon: 24.0
    )
    let expectedTypographies = CircularMeterTypographies(
        valueFontToken: TypographyFontTokenGeneratedMock.caption(),
        contentFontToken: TypographyFontTokenGeneratedMock.callout()
    )
    let expectedLayout = CircularMeterLayout(
        spacing: 8.0,
        padding: 12.0
    )
    let expectedIsInsideContent = true

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: CircularMeterGetColorsUseCaseableGeneratedMock
    let getSizesUseCaseMock: CircularMeterGetSizesUseCaseableGeneratedMock
    let getTypographiesUseCaseMock: CircularMeterGetTypographiesUseCaseableGeneratedMock
    let getLayoutUseCaseMock: CircularMeterGetLayoutUseCaseableGeneratedMock
    let getIsInsideContentUseCaseMock: CircularMeterGetIsInsideContentUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: CircularMeterViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = CircularMeterGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedColors

        let getSizesUseCaseMock = CircularMeterGetSizesUseCaseableGeneratedMock()
        getSizesUseCaseMock.executeWithSizeReturnValue = self.expectedSizes

        let getTypographiesUseCaseMock = CircularMeterGetTypographiesUseCaseableGeneratedMock()
        getTypographiesUseCaseMock.executeWithThemeAndSizeReturnValue = self.expectedTypographies

        let getLayoutUseCaseMock = CircularMeterGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        let getIsInsideContentUseCaseMock = CircularMeterGetIsInsideContentUseCaseableGeneratedMock()
        getIsInsideContentUseCaseMock.executeWithSizeReturnValue = self.expectedIsInsideContent

        self.viewModel = CircularMeterViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getSizesUseCase: getSizesUseCaseMock,
            getTypographiesUseCase: getTypographiesUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock,
            getIsInsideContentUseCase: getIsInsideContentUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getSizesUseCaseMock = getSizesUseCaseMock
        self.getTypographiesUseCaseMock = getTypographiesUseCaseMock
        self.getLayoutUseCaseMock = getLayoutUseCaseMock
        self.getIsInsideContentUseCaseMock = getIsInsideContentUseCaseMock
    }

    // MARK: - Methods

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getSizesUseCaseMock.reset()
        self.getTypographiesUseCaseMock.reset()
        self.getLayoutUseCaseMock.reset()
        self.getIsInsideContentUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension CircularMeterViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            size: stub.givenSize
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getSizesUseCase: Bool = false,
    getTypographiesUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    getIsInsideContentUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    CircularMeterGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    CircularMeterGetSizesUseCaseableMockTest.expectCalled(
        stub.getSizesUseCaseMock,
        executeWithSizeCalled: !getSizesUseCase,
        sourceLocation: sourceLocation
    )

    CircularMeterGetTypographiesUseCaseableMockTest.expectCalled(
        stub.getTypographiesUseCaseMock,
        executeWithThemeAndSizeCalled: !getTypographiesUseCase,
        sourceLocation: sourceLocation
    )

    CircularMeterGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCase,
        sourceLocation: sourceLocation
    )

    CircularMeterGetIsInsideContentUseCaseableMockTest.expectCalled(
        stub.getIsInsideContentUseCaseMock,
        executeWithSizeCalled: !getIsInsideContentUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherColors: CircularMeterColors? = nil,
    otherSizes: CircularMeterSizes? = nil,
    otherTypographies: CircularMeterTypographies? = nil,
    otherLayout: CircularMeterLayout? = nil,
    otherIsInsideContent: Bool? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    let expectedColors = otherColors ?? stub.expectedColors
    let expectedSizes = otherSizes ?? stub.expectedSizes
    let expectedTypographies = otherTypographies ?? stub.expectedTypographies
    let expectedLayout = otherLayout ?? stub.expectedLayout
    let expectedIsInsideContent = otherIsInsideContent ?? stub.expectedIsInsideContent

    #expect(
        viewModel.colors == expectedColors,
        "Wrong colors value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.sizes == expectedSizes,
        "Wrong sizes value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.typographies == expectedTypographies,
        "Wrong typographies value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.layout == expectedLayout,
        "Wrong layout value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.isInsideContent == expectedIsInsideContent,
        "Wrong isInsideContent value",
        sourceLocation: sourceLocation
    )
}
