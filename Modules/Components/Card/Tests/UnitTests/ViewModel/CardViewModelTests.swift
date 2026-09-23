//
//  CardViewModelTests.swift
//  SparkComponentCardTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing

@testable import SparkComponentCard
@_spi(SI_SPI) @testable import SparkComponentCardTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
import Foundation

// MARK: - Tests

@Suite("CardViewModel Tests")
struct CardViewModelTests {

    // MARK: - Initialization

    @Test("Initialization should use default values")
    func initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        #expect(viewModel.theme == nil)
        #expect(viewModel.intent == nil)
        #expect(viewModel.isEnabled == nil)
        #expect(viewModel.padding == nil)
        #expect(viewModel.variant == nil)
        #expect(viewModel.isHeader == nil)
        #expect(viewModel.headerPosition == nil)
        #expect(viewModel.isPressed == false)

        expectEqualToExpected(
            on: stub,
            otherBorder: CardBorder(),
            otherColors: CardColors(),
            otherDim: .zero,
            otherLayout: CardLayout(),
            otherTypographies: CardTypographies(),
            otherHeaderColors: CardHeaderColors()
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getHeaderColorsUseCase: true
        )
    }

    // MARK: - Setup

    @Test("Setup should call all use cases")
    func setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        expectEqualToExpected(on: stub)

        CardGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenVariant: stub.givenVariant,
            givenIsHeader: stub.givenIsHeader,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedBorder
        )
        CardGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: viewModel.isPressed,
            expectedReturnValue: stub.expectedColors
        )
        CardGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
        CardGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenPadding: stub.givenPadding,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedLayout
        )
        CardGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedTypographies
        )
        CardGetHeaderColorsUseCaseableMockTest.expect(
            stub.getHeaderColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedHeaderColors
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update dependent properties")
    func themeChanged_shouldUpdateDependentProperties() {
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

        CardGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenVariant: stub.givenVariant,
            givenIsHeader: stub.givenIsHeader,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedBorder
        )
        CardGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: viewModel.isPressed,
            expectedReturnValue: stub.expectedColors
        )
        CardGetDimUseCaseableMockTest.expect(
            stub.getDimUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIsEnabled: stub.givenIsEnabled,
            expectedReturnValue: stub.expectedDim
        )
        CardGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenPadding: stub.givenPadding,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedLayout
        )
        CardGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedTypographies
        )
        CardGetHeaderColorsUseCaseableMockTest.expect(
            stub.getHeaderColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedHeaderColors
        )
    }

    @Test("Intent changed should update colors and header colors")
    func intentChanged_shouldUpdateColorsAndHeaderColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent: CardIntent = .alert

        // WHEN
        viewModel.intent = newIntent

        // THEN
        expectEqualToExpected(on: stub)

        CardGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: viewModel.isPressed,
            expectedReturnValue: stub.expectedColors
        )
        CardGetHeaderColorsUseCaseableMockTest.expect(
            stub.getHeaderColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            givenVariant: stub.givenVariant,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedHeaderColors
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getDimUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true
        )
    }

    @Test("IsEnabled changed should update dim only")
    func isEnabledChanged_shouldUpdateDimOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsEnabled = !stub.givenIsEnabled

        // WHEN
        viewModel.isEnabled = newIsEnabled

        // THEN
        expectEqualToExpected(on: stub)

        CardGetDimUseCaseableMockTest.expect(
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
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getHeaderColorsUseCase: true
        )
    }

    @Test("Padding changed should update layout only")
    func paddingChanged_shouldUpdateLayoutOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newPadding: CardPadding = .none

        // WHEN
        viewModel.padding = newPadding

        // THEN
        expectEqualToExpected(on: stub)

        CardGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenPadding: newPadding,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedLayout
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getTypographiesUseCase: true,
            getHeaderColorsUseCase: true
        )
    }

    @Test("IsPressed changed should update colors only")
    func isPressedChanged_shouldUpdateColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsPressed = !viewModel.isPressed

        // WHEN
        viewModel.isPressed = newIsPressed

        // THEN
        expectEqualToExpected(on: stub)

        CardGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenIsPressed: newIsPressed,
            expectedReturnValue: stub.expectedColors
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getDimUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getHeaderColorsUseCase: true
        )
    }

    @Test("Variant changed should update colors and header colors")
    func variantChanged_shouldUpdateColorsAndHeaderColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newVariant: CardVariant = .tinted

        // WHEN
        viewModel.variant = newVariant

        // THEN
        expectEqualToExpected(on: stub)

        CardGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenVariant: newVariant,
            givenIsHeader: stub.givenIsHeader,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedBorder
        )
        CardGetColorsUseCaseableMockTest.expect(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: newVariant,
            givenIsPressed: viewModel.isPressed,
            expectedReturnValue: stub.expectedColors
        )
        CardGetHeaderColorsUseCaseableMockTest.expect(
            stub.getHeaderColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: newVariant,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedHeaderColors
        )

        expectNotCalled(
            on: stub,
            getDimUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true
        )
    }

    @Test("IsHeader changed should update border only")
    func isHeaderChanged_shouldUpdateBorderOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsHeader = !stub.givenIsHeader

        // WHEN
        viewModel.isHeader = newIsHeader

        // THEN
        expectEqualToExpected(on: stub)

        CardGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenVariant: stub.givenVariant,
            givenIsHeader: newIsHeader,
            givenHeaderPosition: stub.givenHeaderPosition,
            expectedReturnValue: stub.expectedBorder
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getHeaderColorsUseCase: true
        )
    }

    @Test("HeaderPosition changed should update layout, typographies and header colors")
    func headerPositionChanged_shouldUpdateLayoutTypographiesAndHeaderColors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newHeaderPosition: CardHeaderPosition = .border

        // WHEN
        viewModel.headerPosition = newHeaderPosition

        // THEN
        expectEqualToExpected(on: stub)
        CardGetBorderUseCaseableMockTest.expect(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenVariant: stub.givenVariant,
            givenIsHeader: stub.givenIsHeader,
            givenHeaderPosition: newHeaderPosition,
            expectedReturnValue: stub.expectedBorder
        )
        CardGetLayoutUseCaseableMockTest.expect(
            stub.getLayoutUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenPadding: stub.givenPadding,
            givenHeaderPosition: newHeaderPosition,
            expectedReturnValue: stub.expectedLayout
        )
        CardGetTypographiesUseCaseableMockTest.expect(
            stub.getTypographiesUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenHeaderPosition: newHeaderPosition,
            expectedReturnValue: stub.expectedTypographies
        )
        CardGetHeaderColorsUseCaseableMockTest.expect(
            stub.getHeaderColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            givenHeaderPosition: newHeaderPosition,
            expectedReturnValue: stub.expectedHeaderColors
        )

        expectNotCalled(
            on: stub,
            getColorsUseCase: true,
            getDimUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChanged_beforeSetup_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        let theme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = theme
        viewModel.intent = stub.givenIntent.otherRandom
        viewModel.isEnabled = false
        viewModel.padding = .all
        viewModel.variant = stub.givenVariant.otherRandom
        viewModel.isHeader = !stub.givenIsHeader
        viewModel.headerPosition = stub.givenHeaderPosition.otherRandom
        viewModel.isPressed = !stub.givenIsPressed

        // THEN
        expectEqualToExpected(
            on: stub,
            otherBorder: CardBorder(),
            otherColors: CardColors(),
            otherDim: .zero,
            otherLayout: CardLayout(),
            otherTypographies: CardTypographies(),
            otherHeaderColors: CardHeaderColors()
        )

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getHeaderColorsUseCase: true
        )
    }

    @Test("Properties changed without value change should not call use cases")
    func propertiesChanged_withoutValueChange_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = stub.givenTheme
        viewModel.intent = stub.givenIntent
        viewModel.isEnabled = stub.givenIsEnabled
        viewModel.padding = stub.givenPadding
        viewModel.isPressed = stub.givenIsPressed
        viewModel.variant = stub.givenVariant
        viewModel.isHeader = stub.givenIsHeader
        viewModel.headerPosition = stub.givenHeaderPosition

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getHeaderColorsUseCase: true
        )
    }

    @Test("Properties changed for nil should not call use cases")
    func propertiesChanged_forNil_shouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.theme = nil
        viewModel.intent = nil
        viewModel.isEnabled = nil
        viewModel.padding = nil
        viewModel.variant = nil
        viewModel.isHeader = nil
        viewModel.headerPosition = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getBorderUseCase: true,
            getColorsUseCase: true,
            getDimUseCase: true,
            getLayoutUseCase: true,
            getTypographiesUseCase: true,
            getHeaderColorsUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: CardIntent = .accent
    let givenIsEnabled = true
    let givenPadding: CardPadding = .allAndBottomHeader
    let givenIsPressed = false
    let givenVariant: CardVariant = .outlined
    let givenIsHeader = false
    let givenHeaderPosition: CardHeaderPosition = .banner

    // MARK: - Expected

    let expectedBorder = CardBorder(width: 2, radius: 8)
    let expectedColors = CardColors(
        background: ColorTokenGeneratedMock.blue(),
        border: ColorTokenGeneratedMock.red()
    )
    let expectedDim: CGFloat = 0.5
    let expectedLayout = CardLayout(padding: 12, headerVerticalPadding: 8, headerHorizontalPadding: 10)
    let expectedTypographies = CardTypographies(
        headerFontToken: TypographyFontTokenGeneratedMock.body()
    )
    let expectedHeaderColors = CardHeaderColors(
        background: ColorTokenGeneratedMock.green(),
        foreground: ColorTokenGeneratedMock.orange()
    )

    // MARK: - Use Case Mocks

    let getColorsUseCaseMock: CardGetColorsUseCaseableGeneratedMock
    let getBorderUseCaseMock: CardGetBorderUseCaseableGeneratedMock
    let getDimUseCaseMock: CardGetDimUseCaseableGeneratedMock
    let getLayoutUseCaseMock: CardGetLayoutUseCaseableGeneratedMock
    let getTypographiesUseCaseMock: CardGetTypographiesUseCaseableGeneratedMock
    let getHeaderColorsUseCaseMock: CardGetHeaderColorsUseCaseableGeneratedMock

    // MARK: - View Model

    let viewModel: CardViewModel

    // MARK: - Initialization

    init() {
        let getColorsUseCaseMock = CardGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentAndVariantAndIsPressedReturnValue = self.expectedColors

        let getBorderUseCaseMock = CardGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeAndVariantAndIsHeaderAndHeaderPositionReturnValue = self.expectedBorder

        let getDimUseCaseMock = CardGetDimUseCaseableGeneratedMock()
        getDimUseCaseMock.executeWithThemeAndIsEnabledReturnValue = self.expectedDim

        let getLayoutUseCaseMock = CardGetLayoutUseCaseableGeneratedMock()
        getLayoutUseCaseMock.executeWithThemeAndPaddingAndHeaderPositionReturnValue = self.expectedLayout

        let getTypographiesUseCaseMock = CardGetTypographiesUseCaseableGeneratedMock()
        getTypographiesUseCaseMock.executeWithThemeAndHeaderPositionReturnValue = self.expectedTypographies

        let getHeaderColorsUseCaseMock = CardGetHeaderColorsUseCaseableGeneratedMock()
        getHeaderColorsUseCaseMock.executeWithThemeAndIntentAndVariantAndHeaderPositionReturnValue = self.expectedHeaderColors

        self.viewModel = CardViewModel(
            getColorsUseCase: getColorsUseCaseMock,
            getBorderUseCase: getBorderUseCaseMock,
            getDimUseCase: getDimUseCaseMock,
            getLayoutUseCase: getLayoutUseCaseMock,
            getTypographiesUseCase: getTypographiesUseCaseMock,
            getHeaderColorsUseCase: getHeaderColorsUseCaseMock
        )

        self.getColorsUseCaseMock = getColorsUseCaseMock
        self.getBorderUseCaseMock = getBorderUseCaseMock
        self.getDimUseCaseMock = getDimUseCaseMock
        self.getLayoutUseCaseMock = getLayoutUseCaseMock
        self.getTypographiesUseCaseMock = getTypographiesUseCaseMock
        self.getHeaderColorsUseCaseMock = getHeaderColorsUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getColorsUseCaseMock.reset()
        self.getBorderUseCaseMock.reset()
        self.getDimUseCaseMock.reset()
        self.getLayoutUseCaseMock.reset()
        self.getTypographiesUseCaseMock.reset()
        self.getHeaderColorsUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension CardViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            isEnabled: stub.givenIsEnabled,
            padding: stub.givenPadding,
            variant: stub.givenVariant,
            isHeader: stub.givenIsHeader,
            headerPosition: stub.givenHeaderPosition
        )
    }
}

private func expectNotCalled(
    on stub: Stub,
    getBorderUseCase: Bool = false,
    getColorsUseCase: Bool = false,
    getDimUseCase: Bool = false,
    getLayoutUseCase: Bool = false,
    getTypographiesUseCase: Bool = false,
    getHeaderColorsUseCase: Bool = false
) {
    CardGetBorderUseCaseableMockTest.expectCalled(
        stub.getBorderUseCaseMock,
        executeWithThemeAndVariantAndIsHeaderAndHeaderPositionCalled: !getBorderUseCase
    )
    CardGetColorsUseCaseableMockTest.expectCalled(
        stub.getColorsUseCaseMock,
        executeWithThemeAndIntentAndVariantAndIsPressedCalled: !getColorsUseCase
    )
    CardGetDimUseCaseableMockTest.expectCalled(
        stub.getDimUseCaseMock,
        executeWithThemeAndIsEnabledCalled: !getDimUseCase
    )
    CardGetLayoutUseCaseableMockTest.expectCalled(
        stub.getLayoutUseCaseMock,
        executeWithThemeAndPaddingAndHeaderPositionCalled: !getLayoutUseCase
    )
    CardGetTypographiesUseCaseableMockTest.expectCalled(
        stub.getTypographiesUseCaseMock,
        executeWithThemeAndHeaderPositionCalled: !getTypographiesUseCase
    )
    CardGetHeaderColorsUseCaseableMockTest.expectCalled(
        stub.getHeaderColorsUseCaseMock,
        executeWithThemeAndIntentAndVariantAndHeaderPositionCalled: !getHeaderColorsUseCase
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherBorder: CardBorder? = nil,
    otherColors: CardColors? = nil,
    otherDim: CGFloat? = nil,
    otherLayout: CardLayout? = nil,
    otherTypographies: CardTypographies? = nil,
    otherHeaderColors: CardHeaderColors? = nil
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.border == (otherBorder ?? stub.expectedBorder),
        "Wrong border value"
    )

    #expect(
        viewModel.colors == (otherColors ?? stub.expectedColors),
        "Wrong colors value"
    )

    #expect(
        viewModel.dim == (otherDim ?? stub.expectedDim),
        "Wrong dim value"
    )

    #expect(
        viewModel.layout == (otherLayout ?? stub.expectedLayout),
        "Wrong layout value"
    )

    #expect(
        viewModel.typographies == (otherTypographies ?? stub.expectedTypographies),
        "Wrong typographies value"
    )

    #expect(
        viewModel.headerColors == (otherHeaderColors ?? stub.expectedHeaderColors),
        "Wrong headerColors value"
    )
}
