//
//  DividerViewModelTests.swift
//  SparkComponentDividerUnitTests
//
//  Created by robin.lemaire on 14/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import SparkTheming

@testable import SparkComponentDivider
@_spi(SI_SPI) @testable import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Divider ViewModel Tests")
struct DividerViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.colors == DividerColors(), "Wrong colors value")
        #expect(viewModel.separatorWidthTypes == DividerSeparatorWidthTypes(), "Wrong separator widths value")
        #expect(viewModel.spacing == 0, "Wrong spacing value")
        #expect(viewModel.textFont is TypographyFontTokenClear, "Wrong textFont value")

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSeparatorWidthTypesUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
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

        DividerGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        DividerGetSeparatorWidthTypesUseCaseableMockTest.expect(
            stub.getSeparatorWidthTypesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAlignment: stub.givenAlignment,
            givenAxis: stub.givenAxis,
            expectedReturnValue: stub.expectedSeparatorWidthTypes
        )

        DividerGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        DividerGetTextFontUseCaseableMockTest.expect(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTextFont
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update dependent properties")
    func themeChangedShouldUpdateDependentProperties() {
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

        DividerGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            expectedReturnValue: stub.expectedColors
        )

        DividerGetSpacingUseCaseableMockTest.expect(
            stub.getSpacingUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedSpacing
        )

        DividerGetTextFontUseCaseableMockTest.expect(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedTextFont
        )

        expectNotCalled(
            on: stub,
            getSeparatorWidthTypesUseCase: true
        )
    }

    @Test("Alignment changed should update separator width types only")
    func alignmentChangedShouldUpdateSeparatorWidthTypesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newAlignment: DividerAlignment = .leading

        // WHEN
        viewModel.alignment = newAlignment

        // THEN
        expectEqualToExpected(on: stub)

        DividerGetSeparatorWidthTypesUseCaseableMockTest.expect(
            stub.getSeparatorWidthTypesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAlignment: newAlignment,
            givenAxis: stub.givenAxis,
            expectedReturnValue: stub.expectedSeparatorWidthTypes
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
        )
    }

    @Test("Axis changed should update separator width types only")
    func axisChangedShouldUpdateSeparatorWidthTypesOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newAxis: DividerAxis = .vertical

        // WHEN
        viewModel.axis = newAxis

        // THEN
        expectEqualToExpected(on: stub)

        DividerGetSeparatorWidthTypesUseCaseableMockTest.expect(
            stub.getSeparatorWidthTypesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAlignment: stub.givenAlignment,
            givenAxis: newAxis,
            expectedReturnValue: stub.expectedSeparatorWidthTypes
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
        )
    }

    @Test("Intent changed should update colors only")
    func intentChangedShouldUpdateColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent: DividerIntent = .outlineHigh

        // WHEN
        viewModel.intent = newIntent

        // THEN
        expectEqualToExpected(on: stub)

        DividerGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getSeparatorWidthTypesUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.axis = .vertical
        viewModel.alignment = .leading
        viewModel.intent = .outlineHigh

        // THEN
        expectEqualToExpected(
            on: stub,
            otherColors: DividerColors(),
            otherSeparatorWidthTypes: DividerSeparatorWidthTypes(),
            otherSpacing: 0,
            otherTextFont: TypographyFontTokenClear()
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSeparatorWidthTypesUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
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
        viewModel.axis = stub.givenAxis
        viewModel.alignment = stub.givenAlignment
        viewModel.intent = stub.givenIntent

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getSeparatorWidthTypesUseCase: true,
            getSpacingUseCase: true,
            getTextFontUseCase: true
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
        viewModel.axis = nil
        viewModel.alignment = nil
        viewModel.intent = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
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

private func expectNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getSeparatorWidthTypesUseCase: Bool = false,
    getSpacingUseCase: Bool = false,
    getTextFontUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    DividerGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    DividerGetSeparatorWidthTypesUseCaseableMockTest.expectCalled(
        stub.getSeparatorWidthTypesUseCaseMock,
        executeWithAlignmentAndAxisCalled: !getSeparatorWidthTypesUseCase,
        sourceLocation: sourceLocation
    )

    DividerGetSpacingUseCaseableMockTest.expectCalled(
        stub.getSpacingUseCaseMock,
        executeWithThemeCalled: !getSpacingUseCase,
        sourceLocation: sourceLocation
    )

    DividerGetTextFontUseCaseableMockTest.expectCalled(
        stub.getTextFontUseCaseMock,
        executeWithThemeCalled: !getTextFontUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherColors: DividerColors? = nil,
    otherSeparatorWidthTypes: DividerSeparatorWidthTypes? = nil,
    otherSpacing: CGFloat? = nil,
    otherTextFont: (any TypographyFontToken)? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.colors == (otherColors ?? stub.expectedColors),
        "Wrong colors value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.separatorWidthTypes == (otherSeparatorWidthTypes ?? stub.expectedSeparatorWidthTypes),
        "Wrong separatorWidthTypes value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.spacing == (otherSpacing ?? stub.expectedSpacing),
        "Wrong spacing value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.textFont.equals(otherTextFont ?? stub.expectedTextFont),
        "Wrong textFont value",
        sourceLocation: sourceLocation
    )
}
