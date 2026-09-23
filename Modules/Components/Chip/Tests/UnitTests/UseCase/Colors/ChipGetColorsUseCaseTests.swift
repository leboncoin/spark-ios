//
//  ChipGetColorsUseCaseTests.swift
//  SparkComponentChipTests
//
//  Created by robin.lemaire on 23/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import XCTest
@testable import SparkComponentChip
@_spi(SI_SPI) @testable import SparkComponentChipTesting
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class ChipGetColorsUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var sut: ChipGetColorsUseCase!
    private var getStateOutlinedColorsUseCase: ChipGetStateColorsUseCaseableGeneratedMock!
    private var getStateTintedColorsUseCase: ChipGetStateColorsUseCaseableGeneratedMock!
    private var theme: ThemeGeneratedMock!

    // MARK: - Setup

    override func setUp() {
        super.setUp()

        self.getStateOutlinedColorsUseCase = ChipGetStateColorsUseCaseableGeneratedMock()
        self.getStateTintedColorsUseCase = ChipGetStateColorsUseCaseableGeneratedMock()
        self.sut = ChipGetColorsUseCase(
            getStateOutlinedColorsUseCase: self.getStateOutlinedColorsUseCase,
            getStateTintedColorsUseCase: self.getStateTintedColorsUseCase
        )
        self.theme = ThemeGeneratedMock.mocked()
    }

    // MARK: - Tests

    func test_execute_with_outlined_variant_uses_outlined_colors_use_case() {
        // GIVEN
        let mockStateColors = ChipStateColors.mock()
        self.getStateOutlinedColorsUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = ChipColors(
            background: mockStateColors.background,
            border: mockStateColors.border,
            content: mockStateColors.content
        )

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            intent: .support,
            variant: .outlined,
            isSelected: false,
            isPressed: false
        )

        // THEN
        ChipGetStateColorsUseCaseableMockTest.XCTAssert(
            self.getStateOutlinedColorsUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: .support,
            expectedReturnValue: mockStateColors
        )
        ChipGetStateColorsUseCaseableMockTest.XCTCalled(
            self.getStateTintedColorsUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_dashed_variant_uses_outlined_colors_use_case() {
        // GIVEN
        let mockStateColors = ChipStateColors.mock()
        self.getStateOutlinedColorsUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = ChipColors(
            background: mockStateColors.background,
            border: mockStateColors.border,
            content: mockStateColors.content
        )

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            intent: .support,
            variant: .dashed,
            isSelected: false,
            isPressed: false
        )

        // THEN
        ChipGetStateColorsUseCaseableMockTest.XCTAssert(
            self.getStateOutlinedColorsUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: .support,
            expectedReturnValue: mockStateColors
        )
        ChipGetStateColorsUseCaseableMockTest.XCTCalled(
            self.getStateTintedColorsUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_with_tinted_variant_uses_tinted_colors_use_case() {
        // GIVEN
        let mockStateColors = ChipStateColors.mock()
        self.getStateTintedColorsUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = ChipColors(
            background: mockStateColors.background,
            border: mockStateColors.border,
            content: mockStateColors.content
        )

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            intent: .support,
            variant: .tinted,
            isSelected: false,
            isPressed: false
        )

        // THEN
        ChipGetStateColorsUseCaseableMockTest.XCTAssert(
            self.getStateTintedColorsUseCase,
            expectedNumberOfCalls: 1,
            givenTheme: self.theme,
            givenIntent: .support,
            expectedReturnValue: mockStateColors
        )

        ChipGetStateColorsUseCaseableMockTest.XCTCalled(
            self.getStateOutlinedColorsUseCase,
            executeWithThemeAndIntentCalled: false
        )

        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_when_pressed_uses_pressed_background() {
        // GIVEN
        let mockStateColors = ChipStateColors.mock()
        self.getStateTintedColorsUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = ChipColors(
            background: mockStateColors.pressedBackground,
            border: mockStateColors.pressedBorder,
            content: mockStateColors.content
        )

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            intent: .support,
            variant: .tinted,
            isSelected: false,
            isPressed: true
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_when_selected_uses_selected_colors() {
        // GIVEN
        let mockStateColors = ChipStateColors.mock()
        self.getStateTintedColorsUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = ChipColors(
            background: mockStateColors.selectedBackground,
            border: mockStateColors.selectedBorder,
            content: mockStateColors.selectedContent
        )

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            intent: .support,
            variant: .tinted,
            isSelected: true,
            isPressed: false
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }

    func test_execute_when_pressed_and_selected_uses_pressed_background() {
        // GIVEN
        let mockStateColors = ChipStateColors.mock()
        self.getStateTintedColorsUseCase.executeWithThemeAndIntentReturnValue = mockStateColors

        let expectedColors = ChipColors(
            background: mockStateColors.pressedBackground,
            border: mockStateColors.pressedBorder,
            content: mockStateColors.content
        )

        // WHEN
        let result = self.sut.execute(
            theme: self.theme,
            intent: .support,
            variant: .tinted,
            isSelected: true,
            isPressed: true
        )

        // THEN
        XCTAssertEqual(result, expectedColors)
    }
}

private extension ChipStateColors {
    static func mock() -> ChipStateColors {
        return ChipStateColors(
            border: ColorTokenGeneratedMock.random(),
            pressedBorder: ColorTokenGeneratedMock.random(),
            selectedBorder: ColorTokenGeneratedMock.random(),
            content: ColorTokenGeneratedMock.random(),
            selectedContent: ColorTokenGeneratedMock.random(),
            background: ColorTokenGeneratedMock.random(),
            pressedBackground: ColorTokenGeneratedMock.random(),
            selectedBackground: ColorTokenGeneratedMock.random()
        )
    }
}
