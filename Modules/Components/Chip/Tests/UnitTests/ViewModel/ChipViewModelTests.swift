//
//  ChipViewModelTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 22/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentChip
@_spi(SI_SPI) @testable import SparkComponentChipTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

@MainActor
@Suite("Chip ViewModel Tests")
struct ChipViewModelTests {

    // MARK: - Initialization Test

    @Test("Initialization should use default values")
    func initializationShouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        expectEqualToExpected(
            on: stub,
            otherBorder: ChipBorder(),
            otherColors: ChipColors(),
            otherDim: 0,
            otherIsReversed: false,
            otherLayout: ChipLayout(),
            otherSizes: ChipSizes(),
            otherTitleFont: TypographyFontTokenClear()
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getTitleFontUseCase: true
        )
    }

    // MARK: - Setup Tests

    @Test("Setup should call all use cases")
    func setupShouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: stub.defaultIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        ChipGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenVariant: stub.givenVariant,
            expectedReturnValue: stub.expectedBorder
        )

        ChipGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        ChipGetIsReversedUseCaseableMockTest.expect(
            stub.getIsReversedUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAlignment: stub.givenAlignment,
            expectedReturnValue: stub.expectedIsReversed
        )

        ChipGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAlignment: stub.givenAlignment,
            expectedReturnValue: stub.expectedLayout
        )

        ChipGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedSizes
        )

        ChipGetTitleFontUseCaseableMockTest.expect(
            stub.getTitleFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTitleFont
        )
    }

    // MARK: - Property Change Tests

    @Test("Theme changed should update colors")
    func themeChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getIsReversedUseCase: true
        )

        ChipGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: stub.defaultIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        ChipGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenVariant: stub.givenVariant,
            expectedReturnValue: stub.expectedBorder
        )

        ChipGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        ChipGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenAlignment: stub.givenAlignment,
            expectedReturnValue: stub.expectedLayout
        )

        ChipGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenSize: stub.givenSize,
            expectedReturnValue: stub.expectedSizes
        )

        ChipGetTitleFontUseCaseableMockTest.expect(
            stub.getTitleFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedTitleFont
        )
    }

    @Test("Alignment changed should update colors")
    func alignmentChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenAlignment = ChipAlignment.leadingIcon

        // WHEN
        viewModel.alignment = givenAlignment

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetIsReversedUseCaseableMockTest.expect(
            stub.getIsReversedUseCaseMock,
            expectedNumberOfCalls: 1,
            givenAlignment: givenAlignment,
            expectedReturnValue: stub.expectedIsReversed
        )

        ChipGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenAlignment: givenAlignment,
            expectedReturnValue: stub.expectedLayout
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getSizesUseCase: true,
            getTitleFontUseCase: true
        )
    }

    @Test("Intent changed should update colors")
    func intentChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIntent = ChipIntent.danger

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenVariant: stub.givenVariant,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: stub.defaultIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getTitleFontUseCase: true
        )
    }

    @Test("Variant changed should update colors")
    func variantChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenVariant = ChipVariant.dashed

        // WHEN
        viewModel.variant = givenVariant

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: givenVariant,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: stub.defaultIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        ChipGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenVariant: givenVariant,
            expectedReturnValue: stub.expectedBorder
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getTitleFontUseCase: true
        )
    }

    @Test("Size changed should update height")
    func sizeChangedShouldUpdateHeight() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenSize = ChipSize.medium

        // WHEN
        viewModel.size = givenSize

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetSizesUseCaseableMockTest.expect(
            stub.getSizesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: givenSize,
            expectedReturnValue: stub.expectedSizes
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getTitleFontUseCase: true
        )
    }

    @Test("Is selected changed should update colors")
    func isSelectedChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsSelected = !stub.givenIsSelected

        // WHEN
        viewModel.isSelected = givenIsSelected

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsSelected: givenIsSelected,
            givenIsPressed: stub.defaultIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getTitleFontUseCase: true
        )
    }

    @Test("Is pressed changed should update colors")
    func isPressedChangedShouldUpdateColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let defaultIsPressed = !stub.defaultIsPressed

        // WHEN
        viewModel.isPressed = defaultIsPressed

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: defaultIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getTitleFontUseCase: true
        )
    }

    @Test("Is enabled changed should update dim")
    func isEnabledChangedShouldUpdateDim() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenIsEnabled = !stub.givenIsEnabled

        // WHEN
        viewModel.isEnabled = givenIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        // UseCase Calls Count
        ChipGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getTitleFontUseCase: true
        )
    }

    @Test("Properties changed without setup before should not call use cases")
    func propertiesChangedWithoutSetupBeforeShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.alignment = .trailingIcon
        viewModel.intent = .danger
        viewModel.variant = .dashed
        viewModel.size = .medium
        viewModel.isSelected = !stub.givenIsSelected
        viewModel.isPressed = !stub.defaultIsPressed
        viewModel.isEnabled = !stub.givenIsEnabled

        // THEN
        expectEqualToExpected(
            on: stub,
            otherBorder: ChipBorder(),
            otherColors: ChipColors(),
            otherDim: 0,
            otherIsReversed: false,
            otherLayout: ChipLayout(),
            otherSizes: ChipSizes(),
            otherTitleFont: TypographyFontTokenClear()
        )

        // UseCase Calls Count
        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getTitleFontUseCase: true
        )
    }

    @Test("Properties changed without change should not call use cases")
    func propertiesChangedWithoutChangeShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.alignment = stub.givenAlignment
        viewModel.intent = stub.givenIntent
        viewModel.variant = stub.givenVariant
        viewModel.size = stub.givenSize
        viewModel.isSelected = stub.givenIsSelected
        viewModel.isPressed = stub.defaultIsPressed
        viewModel.isEnabled = stub.givenIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getIsReversedUseCase: true,
            getLayoutUseCase: true,
            getSizesUseCase: true,
            getTitleFontUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub: ChipViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenAlignment = ChipAlignment.trailingIcon
    let givenIntent = ChipIntent.neutral
    let givenVariant = ChipVariant.outlined
    let givenSize = ChipSize.large
    var givenIsSelected: Bool = true
    var givenIsEnabled: Bool = false

    var defaultIsPressed: Bool = false

    // MARK: - Expected Properties

    let expectedColors = ChipColors(
        background: ColorTokenGeneratedMock.blue(),
        border: ColorTokenGeneratedMock.green(),
        content: ColorTokenGeneratedMock.orange()
    )
    let expectedBorder = ChipBorder(width: 1, radius: 2, dash: 3)
    let expectedDim: CGFloat = 0.5
    let expectedIsReversed = true
    let expectedLayout = ChipLayout(spacing: 10, padding: 11)
    let expectedSizes = ChipSizes(height: 32, iconSize: 16)
    let expectedTitleFont = TypographyFontTokenGeneratedMock.mocked(.body)

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = ChipGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentAndVariantAndIsSelectedAndIsPressedReturnValue = self.expectedColors

        let getBorderUseCaseMock = ChipGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeAndVariantReturnValue = self.expectedBorder

        let getDimUseCaseMock = ChipGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getIsReversedUseCaseMock = ChipGetIsReversedUseCaseableGeneratedMock()
        getIsReversedUseCaseMock.executeWithAlignmentReturnValue = self.expectedIsReversed

        let getLayoutUseCaseMock = ChipGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeAndAlignmentReturnValue = self.expectedLayout

        let getSizesUseCaseMock = ChipGetSizesUseCaseableGeneratedMock()
        getSizesUseCaseMock.executeWithThemeAndSizeReturnValue = self.expectedSizes

        let getTitleFontUseCaseMock = ChipGetTitleFontUseCaseableGeneratedMock()
        getTitleFontUseCaseMock.executeWithThemeReturnValue = self.expectedTitleFont

        let viewModel = ChipViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getIsReversedUseCase: getIsReversedUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock,
            getSizesUseCase: getSizesUseCaseMock,
            getTitleFontUseCase: getTitleFontUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getColorsUseCaseMock: getColorsUseCaseMock,
            getBorderUseCaseMock: getBorderUseCaseMock,
            getDimUseCaseMock: getDimUseCaseMock,
            getIsReversedUseCaseMock: getIsReversedUseCaseMock,
            getLayoutUseCaseMock: getLayoutUseCaseMock,
            getSizesUseCaseMock: getSizesUseCaseMock,
            getTitleFontUseCaseMock: getTitleFontUseCaseMock
        )
    }
}

// MARK: - Extension

private extension ChipViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            alignment: stub.givenAlignment,
            intent: stub.givenIntent,
            variant: stub.givenVariant,
            size: stub.givenSize,
            isSelected: stub.givenIsSelected,
            isEnabled: stub.givenIsEnabled
        )
    }
}

// MARK: - Expectations

private func expectNotCalled(
    on stub: Stub,
    getBorderUseCase getBorderUseCaseNotCalled: Bool = false,
    getColorsUseCase getColorsUseCaseNotCalled: Bool = false,
    getDimUseCase getDimUseCaseNotCalled: Bool = false,
    getIsReversedUseCase getIsReversedUseCaseNotCalled: Bool = false,
    getLayoutUseCase getLayoutUseCaseNotCalled: Bool = false,
    getSizesUseCase getSizesUseCaseNotCalled: Bool = false,
    getTitleFontUseCase getTitleFontUseCaseNotCalled: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    ChipGetBorderUseCaseableMockTest.expectCalled(
        stub.getBorderUseCaseMock,
        executeWithThemeAndVariantCalled: !getBorderUseCaseNotCalled,
        sourceLocation: sourceLocation
    )

    ChipGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentAndVariantAndIsSelectedAndIsPressedCalled: !getColorsUseCaseNotCalled,
        sourceLocation: sourceLocation
    )

    ChipGetDimUseCaseableMockTest.expectCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCaseNotCalled,
        sourceLocation: sourceLocation
    )

    ChipGetIsReversedUseCaseableMockTest.expectCalled(
        stub.getIsReversedUseCaseMock,
        executeWithAlignmentCalled: !getIsReversedUseCaseNotCalled,
        sourceLocation: sourceLocation
    )

    ChipGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeAndAlignmentCalled: !getLayoutUseCaseNotCalled,
        sourceLocation: sourceLocation
    )

    ChipGetSizesUseCaseableMockTest.expectCalled(
        stub.getSizesUseCaseMock,
        executeWithThemeAndSizeCalled: !getSizesUseCaseNotCalled,
        sourceLocation: sourceLocation
    )

    ChipGetTitleFontUseCaseableMockTest.expectCalled(
        stub.getTitleFontUseCaseMock,
        executeWithThemeCalled: !getTitleFontUseCaseNotCalled,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherBorder: ChipBorder? = nil,
    otherColors: ChipColors? = nil,
    otherDim: CGFloat? = nil,
    otherIsReversed: Bool? = nil,
    otherLayout: ChipLayout? = nil,
    otherSizes: ChipSizes? = nil,
    otherTitleFont: (any TypographyFontToken)? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.border == (otherBorder ?? stub.expectedBorder),
        "Wrong border value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.colors == (otherColors ?? stub.expectedColors),
        "Wrong colors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.dim == (otherDim ?? stub.expectedDim),
        "Wrong dim value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.isReversed == (otherIsReversed ?? stub.expectedIsReversed),
        "Wrong isReversed value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.layout == (otherLayout ?? stub.expectedLayout),
        "Wrong layout value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.sizes == (otherSizes ?? stub.expectedSizes),
        "Wrong sizes value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.titleFont.equals(otherTitleFont ?? stub.expectedTitleFont),
        "Wrong titleFont value",
        sourceLocation: sourceLocation
    )
}
