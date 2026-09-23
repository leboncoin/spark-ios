//
//  SegmentedControlItemViewModelTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) @testable import SparkComponentSegmentedControlTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting
import Testing

@Suite("SegmentedControl Item ViewModel Tests")
struct SegmentedControlItemViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.isSelected == nil)
        #expect(viewModel.isPressed == false)

        expectEqualToExpected(
            on: stub,
            otherColors: SegmentedControlItemColors(),
            otherTypographies: SegmentedControlItemTypographies(),
            otherLayout: SegmentedControlItemLayout()
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getTypographiesUseCase: true,
            getLayoutUseCase: true
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

        SegmentedControlGetItemColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsPressed: stub.givenIsPressed,
            givenIsSelected: stub.givenIsSelected,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedControlGetItemTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsSelected: stub.givenIsSelected,
            expectedReturnValue: stub.expectedTypographies
        )

        SegmentedControlGetItemLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLayout
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

        SegmentedControlGetItemColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsPressed: stub.givenIsPressed,
            givenIsSelected: stub.givenIsSelected,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedControlGetItemTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsSelected: stub.givenIsSelected,
            expectedReturnValue: stub.expectedTypographies
        )

        SegmentedControlGetItemLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLayout
        )
    }

    @Test("IsSelected when changed should call typographies use case")
    func isSelectedWhenChangedShouldCallTypographiesUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newIsSelected = false

        // WHEN
        viewModel.isSelected = newIsSelected

        // THEN
        expectEqualToExpected(on: stub)

        SegmentedControlGetItemTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsSelected: newIsSelected,
            expectedReturnValue: stub.expectedTypographies
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getLayoutUseCase: true
        )
    }

    @Test("IsPressed when changed should call colors use case")
    func isPressedWhenChangedShouldCallColorsUseCase() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        viewModel.setup(stub: stub)

        stub.resetMockedData()

        let newIsPressed = true

        // WHEN
        viewModel.isPressed = newIsPressed

        // THEN
        expectEqualToExpected(on: stub)

        SegmentedControlGetItemColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsPressed: newIsPressed,
            givenIsSelected: stub.givenIsSelected,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getTypographiesUseCase: true,
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
        viewModel.isSelected = false
        viewModel.isPressed = true

        // THEN
        expectEqualToExpected(
            on: stub,
            otherColors: SegmentedControlItemColors(),
            otherTypographies: SegmentedControlItemTypographies(),
            otherLayout: SegmentedControlItemLayout()
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getTypographiesUseCase: true,
            getLayoutUseCase: true
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
        viewModel.isSelected = stub.givenIsSelected
        viewModel.isPressed = stub.givenIsPressed

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getTypographiesUseCase: true,
            getLayoutUseCase: true
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
        viewModel.isSelected = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getTypographiesUseCase: true,
            getLayoutUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIsSelected = true
    let givenIsPressed = false

    let expectedColors = SegmentedControlItemColors(
        backgroundColorToken: ColorTokenGeneratedMock.random(),
        contentColorToken: ColorTokenGeneratedMock.blue()
    )
    let expectedTypographies = SegmentedControlItemTypographies(
        textFontToken: TypographyFontTokenGeneratedMock.body()
    )
    let expectedLayout = SegmentedControlItemLayout(
        spacing: 8.0
    )

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: SegmentedControlGetItemColorsUseCaseableGeneratedMock
    let getTypographiesUseCaseMock: SegmentedControlGetItemTypographiesUseCaseableGeneratedMock
    let getLayoutUseCaseMock: SegmentedControlGetItemLayoutUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: SegmentedControlItemViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = SegmentedControlGetItemColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIsPressedAndIsSelectedReturnValue = self.expectedColors

        let getTypographiesUseCaseMock = SegmentedControlGetItemTypographiesUseCaseableGeneratedMock()
        getTypographiesUseCaseMock.executeWithThemeAndIsSelectedReturnValue = self.expectedTypographies

        let getLayoutUseCaseMock = SegmentedControlGetItemLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        self.viewModel = SegmentedControlItemViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getTypographiesUseCase: getTypographiesUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getTypographiesUseCaseMock = getTypographiesUseCaseMock
        self.getLayoutUseCaseMock = getLayoutUseCaseMock
    }

    // MARK: - Methods

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getTypographiesUseCaseMock.reset()
        self.getLayoutUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension SegmentedControlItemViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            isSelected: stub.givenIsSelected,
            isPressed: stub.givenIsPressed
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getColorsUseCase: Bool = false,
    getTypographiesUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    SegmentedControlGetItemColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIsPressedAndIsSelectedCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    SegmentedControlGetItemTypographiesUseCaseableMockTest.expectCalled(
        stub.getTypographiesUseCaseMock,
        executeWithThemeAndIsSelectedCalled: !getTypographiesUseCase,
        sourceLocation: sourceLocation
    )

    SegmentedControlGetItemLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherColors: SegmentedControlItemColors? = nil,
    otherTypographies: SegmentedControlItemTypographies? = nil,
    otherLayout: SegmentedControlItemLayout? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    let expectedColors = otherColors ?? stub.expectedColors
    let expectedTypographies = otherTypographies ?? stub.expectedTypographies
    let expectedLayout = otherLayout ?? stub.expectedLayout

    #expect(
        viewModel.colors == expectedColors,
        "Wrong colors value",
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
}
