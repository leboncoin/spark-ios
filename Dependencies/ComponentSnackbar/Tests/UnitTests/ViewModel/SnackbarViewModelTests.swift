//
//  SnackbarViewModelTests.swift
//  SparkComponentSnackbarTests
//
//  Created by robin.lemaire on 12/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

@testable import SparkComponentSnackbar
@_spi(SI_SPI) @testable import SparkComponentSnackbarTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting
import Testing

@Suite("Snackbar ViewModel Tests")
struct SnackbarViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.intent == nil)

        expectEqualToExpected(
            on: stub,
            otherBorder: SnackbarBorder(),
            otherColors: SnackbarColors(),
            otherIntents: SnackbarIntents(),
            otherLayout: SnackbarLayout(),
            otherTypographies: SnackbarTypographies()
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getIntentsUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true
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

        SnackbarGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedBorder
        )

        SnackbarGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        SnackbarGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLayout
        )

        SnackbarGetIntentsUseCaseableMockTest.expect(
            stub.getIntentsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedIntents
        )

        SnackbarGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTypographies
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

        SnackbarGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedBorder
        )

        SnackbarGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        SnackbarGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLayout
        )

        SnackbarGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedTypographies
        )

        expectNotCalled(
            on: stub,
            getIntentsUseCase: true
        )
    }

    @Test("Intent when changed should call colors and intents use cases")
    func intentWhenChangedShouldCallColorsUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        // WHEN
        viewModel.intent = .success

        // THEN
        expectEqualToExpected(on: stub)

        SnackbarGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: .success,
            expectedReturnValue: stub.expectedColors
        )

        SnackbarGetIntentsUseCaseableMockTest.expect(
            stub.getIntentsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenIntent: .success,
            expectedReturnValue: stub.expectedIntents
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true
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
        viewModel.intent = .alert

        // THEN
        expectEqualToExpected(
            on: stub,
            otherBorder: SnackbarBorder(),
            otherColors: SnackbarColors(),
            otherIntents: SnackbarIntents(),
            otherLayout: SnackbarLayout(),
            otherTypographies: SnackbarTypographies()
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getIntentsUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true
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

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getIntentsUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true
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

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getIntentsUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: SnackbarIntent = .info

    let expectedBorder = SnackbarBorder(width: 1, radius: 16)
    let expectedColors = SnackbarColors(
        tintColorToken: ColorTokenGeneratedMock.random(),
        backgroundColorToken: ColorTokenGeneratedMock.green(),
        borderColorToken: ColorTokenGeneratedMock.random()
    )
    let expectedIntents = SnackbarIntents(button: .support)
    let expectedLayout = SnackbarLayout(
        leadingPadding: 16,
        trailingPadding: 12,
        horizontalSpacing: 12,
        verticalPadding: 12,
        verticalSpacing: 12,
        verticalSubSpacing: 8
    )
    let expectedTypographies = SnackbarTypographies(
        titleFontToken: TypographyFontTokenGeneratedMock.body(),
        descriptionFontToken: TypographyFontTokenGeneratedMock.footnote()
    )

    // MARK: - Use Case Mocks

    let getBorderUseCaseMock: SnackbarGetBorderUseCaseableGeneratedMock
    let getColorsUseCaseMock: SnackbarGetColorsUseCaseableGeneratedMock
    let getIntentsUseCaseMock: SnackbarGetIntentsUseCaseableGeneratedMock
    let getLayoutUseCaseMock: SnackbarGetLayoutUseCaseableGeneratedMock
    let getTypographiesUseCaseMock: SnackbarGetTypographiesUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: SnackbarViewModel

    // MARK: - Initialization

    init() {
        let getBorderUseCaseMock = SnackbarGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeReturnValue = self.expectedBorder

        let getColorsUseCaseMock = SnackbarGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentReturnValue = self.expectedColors

        let getIntentsUseCaseMock = SnackbarGetIntentsUseCaseableGeneratedMock()
        getIntentsUseCaseMock.executeWithIntentReturnValue = self.expectedIntents

        let getLayoutUseCaseMock = SnackbarGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        let getTypographiesUseCaseMock = SnackbarGetTypographiesUseCaseableGeneratedMock()
        getTypographiesUseCaseMock.executeWithThemeReturnValue = self.expectedTypographies

        self.viewModel = SnackbarViewModel(
            getBorderUseCase: getBorderUseCaseMock,
            getColorsUseCase: getColorsUseCaseMock,
            getIntentsUseCase: getIntentsUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock,
            getTypographiesUseCase: getTypographiesUseCaseMock
        )

        self.getBorderUseCaseMock = getBorderUseCaseMock
        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getIntentsUseCaseMock = getIntentsUseCaseMock
        self.getLayoutUseCaseMock = getLayoutUseCaseMock
        self.getTypographiesUseCaseMock = getTypographiesUseCaseMock
    }

    // MARK: - Methods

    func resetMockedData() {
        self.getBorderUseCaseMock.reset()
        self.getColorsUseCaseMock.reset()
        self.getIntentsUseCaseMock.reset()
        self.getLayoutUseCaseMock.reset()
        self.getTypographiesUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension SnackbarViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getBorderUseCase: Bool = false,
    getColorsUseCase: Bool = false,
    getIntentsUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    getTypographiesUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    SnackbarGetBorderUseCaseableMockTest.expectCalled(
        stub.getBorderUseCaseMock,
        executeWithThemeCalled: !getBorderUseCase,
        sourceLocation: sourceLocation
    )

    SnackbarGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    SnackbarGetIntentsUseCaseableMockTest.expectCalled(
        stub.getIntentsUseCaseMock,
        executeWithIntentCalled: !getIntentsUseCase,
        sourceLocation: sourceLocation
    )

    SnackbarGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCase,
        sourceLocation: sourceLocation
    )

    SnackbarGetTypographiesUseCaseableMockTest.expectCalled(
        stub.getTypographiesUseCaseMock,
        executeWithThemeCalled: !getTypographiesUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherBorder: SnackbarBorder? = nil,
    otherColors: SnackbarColors? = nil,
    otherIntents: SnackbarIntents? = nil,
    otherLayout: SnackbarLayout? = nil,
    otherTypographies: SnackbarTypographies? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    let expectedBorder = otherBorder ?? stub.expectedBorder
    let expectedColors = otherColors ?? stub.expectedColors
    let expectedIntents = otherIntents ?? stub.expectedIntents
    let expectedLayout = otherLayout ?? stub.expectedLayout
    let expectedTypographies = otherTypographies ?? stub.expectedTypographies

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
        viewModel.intents == expectedIntents,
        "Wrong intents value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.layout == expectedLayout,
        "Wrong layout value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.typographies == expectedTypographies,
        "Wrong typographies value",
        sourceLocation: sourceLocation
    )
}
