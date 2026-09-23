//
//  SegmentedControlViewModelTests.swift
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

@Suite("SegmentedControl ViewModel Tests")
struct SegmentedControlViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.isEnabled == nil)

        expectEqualToExpected(
            on: stub,
            otherBorder: SegmentedControlBorder(),
            otherColors: SegmentedControlColors(),
            otherLayout: SegmentedControlLayout(),
            otherDim: 0.0
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getLayoutUseCase: true,
            getDimUseCase: true
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

        SegmentedControlGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedBorder
        )

        SegmentedControlGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedControlGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedLayout
        )

        SegmentedControlGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
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

        SegmentedControlGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedBorder
        )

        SegmentedControlGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedColors
        )

        SegmentedControlGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            expectedReturnValue: stub.expectedLayout
        )

        SegmentedControlGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
    }

    @Test("IsEnabled when changed should call dim use case")
    func isEnabledWhenChangedShouldCallDimUseCase() {
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

        SegmentedControlGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: newIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
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
        viewModel.isEnabled = false

        // THEN
        expectEqualToExpected(
            on: stub,
            otherBorder: SegmentedControlBorder(),
            otherColors: SegmentedControlColors(),
            otherLayout: SegmentedControlLayout(),
            otherDim: 0.0
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getLayoutUseCase: true,
            getDimUseCase: true
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
        viewModel.isEnabled = stub.givenIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getLayoutUseCase: true,
            getDimUseCase: true
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
        viewModel.isEnabled = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getLayoutUseCase: true,
            getDimUseCase: true
        )
    }

    // MARK: - GetDisplayTags

    @Test("GetDisplayTags should call use case and return result")
    func getDisplayTagsShouldCallUseCaseAndReturnResult() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let tags: [AnyHashable] = [0, 1, 2, 3, 4]

        // WHEN
        let result = viewModel.getDisplayTags(from: tags)

        // THEN
        SegmentedControlGetDisplayTagsUseCaseableMockTest.expect(
            stub.getDisplayTagsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTags: tags,
            expectedReturnValue: stub.expectedDisplayTags
        )
    }

    // MARK: - GetIsVerticalSeparator

    @Test("GetIsVerticalSeparator should call use case and return result")
    func getIsVerticalSeparatorShouldCallUseCaseAndReturnResult() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel
        let tags = 6
        let horizontalTags = 3
        let columnIndex = 1

        // WHEN
        let result = viewModel.getIsVerticalSeparator(
            tags: tags,
            horizontalTags: horizontalTags,
            columnIndex: columnIndex
        )

        // THEN
        SegmentedControlGetIsVerticalSeparatorUseCaseableMockTest.expect(
            stub.getIsVerticalSeparatorUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTags: tags,
            givenHorizontalTags: horizontalTags,
            givenColumnIndex: columnIndex,
            expectedReturnValue: stub.expectedIsVerticalSeparator
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIsEnabled = true

    let expectedBorder = SegmentedControlBorder(
        radius: 8.0,
        width: 1.0,
        selectedItemRadius: 6.0,
        selectedItemWidth: 2.0
    )
    let expectedColors = SegmentedControlColors(
        backgroundColorToken: ColorTokenGeneratedMock.random(),
        borderColorToken: ColorTokenGeneratedMock.green(),
        separatorColorToken: ColorTokenGeneratedMock.blue(),
        selectedItemBackgroundColorToken: ColorTokenGeneratedMock.red(),
        selectedItemBorderColorToken: ColorTokenGeneratedMock.random(),
        accessibilitySelectedTintColorToken: ColorTokenGeneratedMock.random(),
        accessibilitySelectedBackgroundColorToken: ColorTokenGeneratedMock.random()
    )
    let expectedLayout = SegmentedControlLayout(
        padding: 8.0,
        spacing: 4.0,
        accessibilityHorizontalPadding: 16.0,
        accessibilityVerticalPadding: 12.0
    )
    let expectedDim: CGFloat = 0.4
    let expectedDisplayTags: [[AnyHashable]] = [[0, 1, 2], [3, 4]]
    let expectedIsVerticalSeparator: Bool = true

    // MARK: - Use Case Mocks

    let getBorderUseCaseMock: SegmentedControlGetBorderUseCaseableGeneratedMock
    let getColorsUseCaseMock: SegmentedControlGetColorsUseCaseableGeneratedMock
    let getLayoutUseCaseMock: SegmentedControlGetLayoutUseCaseableGeneratedMock
    let getDimUseCaseMock: SegmentedControlGetDimUseCaseableGeneratedMock
    let getDisplayTagsUseCaseMock: SegmentedControlGetDisplayTagsUseCaseableGeneratedMock
    let getIsVerticalSeparatorUseCaseMock: SegmentedControlGetIsVerticalSeparatorUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: SegmentedControlViewModel

    // MARK: - Initialization

    init() {
        let getBorderUseCaseMock = SegmentedControlGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeReturnValue = self.expectedBorder

        let getColorsUseCaseMock = SegmentedControlGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeReturnValue = self.expectedColors

        let getLayoutUseCaseMock = SegmentedControlGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeReturnValue = self.expectedLayout

        let getDimUseCaseMock = SegmentedControlGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getDisplayTagsUseCaseMock = SegmentedControlGetDisplayTagsUseCaseableGeneratedMock()
        getDisplayTagsUseCaseMock.executeWithTagsReturnValue = self.expectedDisplayTags

        let getIsVerticalSeparatorUseCaseMock = SegmentedControlGetIsVerticalSeparatorUseCaseableGeneratedMock()
        getIsVerticalSeparatorUseCaseMock.executeWithTagsAndHorizontalTagsAndColumnIndexReturnValue = self.expectedIsVerticalSeparator

        self.viewModel = SegmentedControlViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getDisplayTagsUseCase: getDisplayTagsUseCaseMock,
            getIsVerticalSeparatorUseCase: getIsVerticalSeparatorUseCaseMock
        )

        self.getBorderUseCaseMock = getBorderUseCaseMock
        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getLayoutUseCaseMock = getLayoutUseCaseMock
        self.getDimUseCaseMock = getDimUseCaseMock
        self.getDisplayTagsUseCaseMock = getDisplayTagsUseCaseMock
        self.getIsVerticalSeparatorUseCaseMock = getIsVerticalSeparatorUseCaseMock
    }

    // MARK: - Methods

    func resetMockedData() {
        self.getBorderUseCaseMock.reset()
        self.getColorsUseCaseMock.reset()
        self.getLayoutUseCaseMock.reset()
        self.getDimUseCaseMock.reset()
        self.getDisplayTagsUseCaseMock.reset()
        self.getIsVerticalSeparatorUseCaseMock.reset()
    }
}

// MARK: - Extension

private extension SegmentedControlViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            isEnabled: stub.givenIsEnabled
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getBorderUseCase: Bool = false,
    getColorsUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    getDimUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    SegmentedControlGetBorderUseCaseableMockTest.expectCalled(
        stub.getBorderUseCaseMock,
        executeWithThemeCalled: !getBorderUseCase,
        sourceLocation: sourceLocation
    )

    SegmentedControlGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeCalled: !getColorsUseCase,
        sourceLocation: sourceLocation
    )

    SegmentedControlGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeCalled: !getLayoutUseCase,
        sourceLocation: sourceLocation
    )

    SegmentedControlGetDimUseCaseableMockTest.expectCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase,
        sourceLocation: sourceLocation
    )

    SegmentedControlGetDisplayTagsUseCaseableMockTest.expectCalled(
        stub.getDisplayTagsUseCaseMock,
        executeWithTagsCalled: false
    )

    SegmentedControlGetIsVerticalSeparatorUseCaseableMockTest.expectCalled(
        stub.getIsVerticalSeparatorUseCaseMock,
        executeWithTagsAndHorizontalTagsAndColumnIndexCalled: false
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherBorder: SegmentedControlBorder? = nil,
    otherColors: SegmentedControlColors? = nil,
    otherLayout: SegmentedControlLayout? = nil,
    otherDim: CGFloat? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    let expectedBorder = otherBorder ?? stub.expectedBorder
    let expectedColors = otherColors ?? stub.expectedColors
    let expectedLayout = otherLayout ?? stub.expectedLayout
    let expectedDim = otherDim ?? stub.expectedDim

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
        viewModel.layout == expectedLayout,
        "Wrong layout value",
        sourceLocation: sourceLocation
    )

    #expect(
        viewModel.dim == expectedDim,
        "Wrong dim value",
        sourceLocation: sourceLocation
    )
}
