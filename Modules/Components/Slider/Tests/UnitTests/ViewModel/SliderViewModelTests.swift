//
//  SliderViewModelTests.swift
//  SparkComponentSliderTests
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import Foundation
import SwiftUI
import UIKit

@testable import SparkComponentSlider
@_spi(SI_SPI) @testable import SparkComponentSliderTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting

@MainActor
@Suite("Slider ViewModel Tests")
struct SliderViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.intent == nil)
        #expect(viewModel.isFloatingValueLabel == nil)
        #expect(viewModel.isEnabled == nil)

        expectEqualToExpected(
            on: stub,
            otherColors: SliderColors(),
            otherDim: .zero,
            otherSpacing: .zero,
            otherTypographies: SliderTypographies()
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
            getSpacingUseCase: true,
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

        SliderGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        SliderGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        SliderGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        SliderGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsFloatingValueLabel: stub.givenIsFloatingValueLabel,
            expectedReturnValue: stub.expectedTypographies
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update colors and dim and typographies and spacing")
    func themeChangedShouldUpdateColorsAndDimAndTypographiesAndSpacing() {
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

        SliderGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        SliderGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        SliderGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        SliderGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsFloatingValueLabel: stub.givenIsFloatingValueLabel,
            expectedReturnValue: stub.expectedTypographies
        )
    }

    @Test("Intent changed should update colors only")
    func intentChangedShouldUpdateColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = SliderIntent.accent

        // WHEN
        viewModel.intent = newIntent

        // THEN
        expectEqualToExpected(on: stub)

        SliderGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getDimUseCase: true,
            getSpacingUseCase: true,
            getTypographiesUseCase: true
        )
    }

    @Test("Is enabled changed should update dim only")
    func isEnabledChangedShouldUpdateDimOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsEnabled = false

        // WHEN
        viewModel.isEnabled = newIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        SliderGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: newIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSpacingUseCase: true,
            getTypographiesUseCase: true
        )
    }

    @Test("Is floating value label changed should update typographies only")
    func isFloatingValueLabelChangedShouldUpdateTypographiesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsFloatingValueLabel = true

        // WHEN
        viewModel.isFloatingValueLabel = newIsFloatingValueLabel

        // THEN
        expectEqualToExpected(on: stub)

        SliderGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsFloatingValueLabel: newIsFloatingValueLabel,
            expectedReturnValue: stub.expectedTypographies
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
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
        viewModel.intent = SliderIntent.support
        viewModel.isFloatingValueLabel = true
        viewModel.isEnabled = false

        // THEN
        expectEqualToExpected(
            on: stub,
            otherColors: SliderColors(),
            otherDim: 0,
            otherSpacing: 0.0,
            otherTypographies: SliderTypographies()
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
            getSpacingUseCase: true,
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
        viewModel.isFloatingValueLabel = stub.givenIsFloatingValueLabel
        viewModel.isEnabled = stub.givenIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
            getSpacingUseCase: true,
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
        viewModel.isFloatingValueLabel = nil
        viewModel.isEnabled = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
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

private func expectNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getDimUseCase: Bool = false,
    getSpacingUseCase: Bool = false,
    getTypographiesUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    SliderGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    SliderGetDimUseCaseableMockTest.expectCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase,
        sourceLocation: sourceLocation
    )

    SliderGetSpacingUseCaseableMockTest.expectCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingUseCase,
        sourceLocation: sourceLocation
    )

    SliderGetTypographiesUseCaseableMockTest.expectCalled(
        stub.getTypographiesUseCaseMock,
        executeWithThemeAndIsFloatingValueLabelCalled: !getTypographiesUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherColors: SliderColors? = nil,
    otherDim: CGFloat? = nil,
    otherSpacing: CGFloat? = nil,
    otherTypographies: SliderTypographies? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.colors == otherColors ?? stub.expectedColors,
        "Wrong colors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.dim == otherDim ?? stub.expectedDim,
        "Wrong dim value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.spacing == otherSpacing ?? stub.expectedSpacing,
        "Wrong spacing value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.typographies == otherTypographies ?? stub.expectedTypographies,
        "Wrong typographies value",
        sourceLocation: sourceLocation
    )
}
