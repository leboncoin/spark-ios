//
//  TabSegmentViewModelTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import UIKit

@testable import SparkComponentTab
@_spi(SI_SPI) @testable import SparkComponentTabTesting
@_spi(SI_SPI) import SparkThemingTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkCommonTesting

final class TabSegmentViewModelTests: XCTestCase {

    // MARK: - Initialization

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // THEN
        XCTAssertNil(viewModel.theme)
        XCTAssertNil(viewModel.intent)
        XCTAssertNil(viewModel.size)
        XCTAssertNil(viewModel.isSelected)
        XCTAssertFalse(viewModel.isPressed)

        XCTAssertEqualToExpected(
            on: stub,
            otherContentColors: TabContentColors(),
            otherFonts: TabFonts(),
            otherDim: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getContentColorsUseCase: true,
            getFontsUseCase: true
        )
    }

    // MARK: - Setup

    func test_setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TabGetContentColorsUseCaseableMockTest.XCTAssert(
            stub.getContentColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedContentColors
        )

        TabGetFontsUseCaseableMockTest.XCTAssert(
            stub.getFontsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            givenIsSelected: stub.givenIsSelected,
            expectedReturnValue: stub.expectedFonts
        )
    }

    // MARK: - Property Changes

    func test_themeChanged_shouldUpdateAllProperties() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = newTheme

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TabGetContentColorsUseCaseableMockTest.XCTAssert(
            stub.getContentColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenIntent: stub.givenIntent,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedContentColors
        )

        TabGetFontsUseCaseableMockTest.XCTAssert(
            stub.getFontsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: newTheme,
            givenSize: stub.givenSize,
            givenIsSelected: stub.givenIsSelected,
            expectedReturnValue: stub.expectedFonts
        )
    }

    func test_intentChanged_shouldUpdateContentColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIntent = TabIntent.main

        // WHEN
        viewModel.intent = newIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TabGetContentColorsUseCaseableMockTest.XCTAssert(
            stub.getContentColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: newIntent,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedContentColors
        )

        XCTAssertNotCalled(
            on: stub,
            getFontsUseCase: true
        )
    }

    func test_sizeChanged_shouldUpdateFontsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newSize = TabSize.small

        // WHEN
        viewModel.size = newSize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TabGetFontsUseCaseableMockTest.XCTAssert(
            stub.getFontsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: newSize,
            givenIsSelected: stub.givenIsSelected,
            expectedReturnValue: stub.expectedFonts
        )

        XCTAssertNotCalled(
            on: stub,
            getContentColorsUseCase: true
        )
    }

    func test_isSelectedChanged_shouldUpdateContentColorsAndFontsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsSelected = false

        // WHEN
        viewModel.isSelected = newIsSelected

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TabGetContentColorsUseCaseableMockTest.XCTAssert(
            stub.getContentColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsSelected: newIsSelected,
            givenIsPressed: stub.givenIsPressed,
            expectedReturnValue: stub.expectedContentColors
        )

        TabGetFontsUseCaseableMockTest.XCTAssert(
            stub.getFontsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            givenIsSelected: newIsSelected,
            expectedReturnValue: stub.expectedFonts
        )

        XCTAssertNotCalled(
            on: stub
        )
    }

    func test_isPressedChanged_shouldUpdateContentColorsOnly() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let newIsPressed = true

        // WHEN
        viewModel.isPressed = newIsPressed

        // THEN
        XCTAssertEqualToExpected(on: stub)

        TabGetContentColorsUseCaseableMockTest.XCTAssert(
            stub.getContentColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenIsSelected: stub.givenIsSelected,
            givenIsPressed: newIsPressed,
            expectedReturnValue: stub.expectedContentColors
        )

        XCTAssertNotCalled(
            on: stub,
            getFontsUseCase: true
        )
    }

    func test_propertiesChanged_beforeSetup_shouldNotCallUseCases() {
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
        XCTAssertEqualToExpected(
            on: stub,
            otherContentColors: TabContentColors(),
            otherFonts: TabFonts(),
            otherDim: 0
        )

        XCTAssertNotCalled(
            on: stub,
            getContentColorsUseCase: true,
            getFontsUseCase: true
        )
    }

    func test_propertiesChanged_withoutValueChange_shouldNotCallUseCases() {
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
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
            on: stub,
            getContentColorsUseCase: true,
            getFontsUseCase: true
        )
    }

    func test_propertiesChanged_withNilValues_shouldNotCallUseCases() {
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
        XCTAssertEqualToExpected(on: stub)

        XCTAssertNotCalled(
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

private func XCTAssertNotCalled(
    on stub: Stub,
    getContentColorsUseCase: Bool = false,
    getFontsUseCase: Bool = false
) {
    TabGetContentColorsUseCaseableMockTest.XCTCalled(
        stub.getContentColorsUseCaseMock,
        executeWithThemeAndIntentAndIsSelectedAndIsPressedCalled: !getContentColorsUseCase
    )

    TabGetFontsUseCaseableMockTest.XCTCalled(
        stub.getFontsUseCaseMock,
        executeWithThemeAndSizeAndIsSelectedCalled: !getFontsUseCase
    )
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherContentColors: TabContentColors? = nil,
    otherFonts: TabFonts? = nil,
    otherDim: CGFloat? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.contentColors,
        otherContentColors ?? stub.expectedContentColors,
        "Wrong contentColors value"
    )
    XCTAssertEqual(
        viewModel.fonts,
        otherFonts ?? stub.expectedFonts,
        "Wrong fonts value"
    )
}
