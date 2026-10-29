//
//  TabSegmentViewModelTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import UIKit

@testable import SparkComponentTab
@_spi(SI_SPI) @testable import SparkComponentTabTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting

@MainActor
@Suite("Tab Segment ViewModel Tests")
struct TabSegmentViewModelTests {

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
        #expect(viewModel.isSelected == nil)
        #expect(!viewModel.isPressed)

        expectEqualToExpected(
            on: stub,
            otherContentColors: TabContentColors(),
            otherFonts: TabFonts(),
            otherDim: 0
        )

        expectNotCalled(
            on: stub,
            getContentColorsUseCase: true,
            getFontsUseCase: true
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

        TabGetContentColorsUseCaseableMockTest.expect(
            stub.getContentColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedContentColors
        )

        TabGetFontsUseCaseableMockTest.expect(
            stub.getFontsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            givenIsSelected: stub.givenIsSelected,
            expectedReturnValue: stub.expectedFonts
        )
    }

    // MARK: - Property Changes

    @Test("Theme changed should update all properties")
    func themeChangedShouldUpdateAllProperties() {
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

        TabGetContentColorsUseCaseableMockTest.expect(
            stub.getContentColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedContentColors
        )

        TabGetFontsUseCaseableMockTest.expect(
            stub.getFontsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenSize: stub.givenSize,
            givenIsSelected: stub.givenIsSelected,
            expectedReturnValue: stub.expectedFonts
        )
    }

    @Test("Intent changed should update content colors only")
    func intentChangedShouldUpdateContentColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = TabIntent.main

        // WHEN
        viewModel.intent = newIntent

        // THEN
        expectEqualToExpected(on: stub)

        TabGetContentColorsUseCaseableMockTest.expect(
            stub.getContentColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedContentColors
        )

        expectNotCalled(
            on: stub,
            getFontsUseCase: true
        )
    }

    @Test("Size changed should update fonts only")
    func sizeChangedShouldUpdateFontsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize = TabSize.small

        // WHEN
        viewModel.size = newSize

        // THEN
        expectEqualToExpected(on: stub)

        TabGetFontsUseCaseableMockTest.expect(
            stub.getFontsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: newSize,
            givenIsSelected: stub.givenIsSelected,
            expectedReturnValue: stub.expectedFonts
        )

        expectNotCalled(
            on: stub,
            getContentColorsUseCase: true
        )
    }

    @Test("Is selected changed should update content colors and fonts only")
    func isSelectedChangedShouldUpdateContentColorsAndFontsOnly() {
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

        TabGetContentColorsUseCaseableMockTest.expect(
            stub.getContentColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsSelected: newIsSelected,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedContentColors
        )

        TabGetFontsUseCaseableMockTest.expect(
            stub.getFontsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            givenIsSelected: newIsSelected,
            expectedReturnValue: stub.expectedFonts
        )

        expectNotCalled(
            on: stub
        )
    }

    @Test("Is pressed changed should update content colors only")
    func isPressedChangedShouldUpdateContentColorsOnly() {
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

        TabGetContentColorsUseCaseableMockTest.expect(
            stub.getContentColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: newIsPressed,
            expectedReturnValue: stub.expectedContentColors
        )

        expectNotCalled(
            on: stub,
            getFontsUseCase: true
        )
    }

    @Test("Properties changed before setup should not call use cases")
    func propertiesChangedBeforeSetupShouldNotCallUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.theme = ThemeGeneratedMock.mocked()
        viewModel.intent = stub.givenIntent.otherRandom
        viewModel.size = stub.givenSize.otherRandom
        viewModel.isSelected = false
        viewModel.isPressed = true

        // THEN
        expectEqualToExpected(
            on: stub,
            otherContentColors: TabContentColors(),
            otherFonts: TabFonts(),
            otherDim: 0
        )

        expectNotCalled(
            on: stub,
            getContentColorsUseCase: true,
            getFontsUseCase: true
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
        viewModel.isSelected = stub.givenIsSelected
        viewModel.isPressed = stub.givenIsPressed

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getContentColorsUseCase: true,
            getFontsUseCase: true
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
        viewModel.isSelected = nil

        // THEN
        expectEqualToExpected(on: stub)

        expectNotCalled(
            on: stub,
            getContentColorsUseCase: true,
            getFontsUseCase: true
        )
    }
}

// MARK: - Stub

private final class Stub {

    // MARK: - Given

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent: TabIntent = .support
    let givenSize: TabSize = .medium
    let givenIsEnabled: Bool = true
    let givenIsSelected: Bool = true
    let givenIsPressed: Bool = false

    // MARK: - Expected

    let expectedContentColors = TabContentColors(
        tintColorToken: ColorTokenGeneratedMock.red(),
        backgroundColorToken: ColorTokenGeneratedMock.blue()
    )
    let expectedFonts = TabFonts(
        typographyFontToken: TypographyFontTokenGeneratedMock.mocked()
    )

    // MARK: - Use Case Mocks

    let getContentColorsUseCaseMock: TabGetContentColorsUseCaseableGeneratedMock
    let getFontsUseCaseMock: TabGetFontsUseCaseableGeneratedMock

    // MARK: - ViewModel

    let viewModel: TabSegmentViewModel

    // MARK: - Initialization

    init() {
        let getContentColorsUseCaseMock = TabGetContentColorsUseCaseableGeneratedMock()
        getContentColorsUseCaseMock.executeWithThemeAndIntentAndIsSelectedAndIsPressedReturnValue = self.expectedContentColors

        let getFontsUseCaseMock = TabGetFontsUseCaseableGeneratedMock()
        getFontsUseCaseMock.executeWithThemeAndSizeAndIsSelectedReturnValue = self.expectedFonts

        self.viewModel = TabSegmentViewModel(
            getContentColorsUseCase: getContentColorsUseCaseMock,
            getFontsUseCase: getFontsUseCaseMock
        )

        self.getContentColorsUseCaseMock = getContentColorsUseCaseMock
        self.getFontsUseCaseMock = getFontsUseCaseMock
    }

    // MARK: - Helpers

    func resetMockedData() {
        self.getContentColorsUseCaseMock.reset()
        self.getFontsUseCaseMock.reset()
    }
}

// MARK: - Helpers

private extension TabSegmentViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            size: stub.givenSize,
            isSelected: stub.givenIsSelected
        )
    }
}

private func expectNotCalled(
    on stub: Stub,
    getContentColorsUseCase: Bool = false,
    getFontsUseCase: Bool = false,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    TabGetContentColorsUseCaseableMockTest.expectCalled(
        stub.getContentColorsUseCaseMock,
        executeWithThemeAndIntentAndIsSelectedAndIsPressedCalled: !getContentColorsUseCase,
        sourceLocation: sourceLocation
    )

    TabGetFontsUseCaseableMockTest.expectCalled(
        stub.getFontsUseCaseMock,
        executeWithThemeAndSizeAndIsSelectedCalled: !getFontsUseCase,
        sourceLocation: sourceLocation
    )
}

private func expectEqualToExpected(
    on stub: Stub,
    otherContentColors: TabContentColors? = nil,
    otherFonts: TabFonts? = nil,
    otherDim: CGFloat? = nil,
    sourceLocation: Testing.SourceLocation = #_sourceLocation
) {
    let viewModel = stub.viewModel

    #expect(
        viewModel.contentColors == (otherContentColors ?? stub.expectedContentColors),
        "Wrong contentColors value",
        sourceLocation: sourceLocation
    )
    #expect(
        viewModel.fonts == (otherFonts ?? stub.expectedFonts),
        "Wrong fonts value",
        sourceLocation: sourceLocation
    )
}
