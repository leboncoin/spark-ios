//
//  PopoverIntentTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by louis.borlee on 26/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentPopover
@_spi(SI_SPI) @testable import SparkComponentPopoverTesting
@_spi(SI_SPI) import SparkThemingTesting

final class PopoverIntentTests: XCTestCase {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Cases Tests

    func test_allCases_count() {
        // THEN
        XCTAssertEqual(PopoverIntent.allCases.count, 2, "Wrong allCases count")
    }

    func test_allCases_contains_all_non_deprecated_cases() {
        // THEN
        XCTAssertTrue(PopoverIntent.allCases.contains(.info), "allCases should contain .info")
        XCTAssertTrue(PopoverIntent.allCases.contains(.surface), "allCases should contain .surface")
    }

    func test_allCases_does_not_contain_deprecated_cases() {
        // THEN
        XCTAssertFalse(PopoverIntent.allCases.contains(.neutral), "allCases should not contain .neutral (deprecated)")
        XCTAssertFalse(PopoverIntent.allCases.contains(.accent), "allCases should not contain .accent (deprecated)")
        XCTAssertFalse(PopoverIntent.allCases.contains(.main), "allCases should not contain .main (deprecated)")
        XCTAssertFalse(PopoverIntent.allCases.contains(.support), "allCases should not contain .support (deprecated)")
        XCTAssertFalse(PopoverIntent.allCases.contains(.success), "allCases should not contain .success (deprecated)")
        XCTAssertFalse(PopoverIntent.allCases.contains(.alert), "allCases should not contain .alert (deprecated)")
        XCTAssertFalse(PopoverIntent.allCases.contains(.error), "allCases should not contain .error (deprecated)")
    }

    // MARK: - GetColors Tests

    func test_internal_getColors_withDefaultIsLiquidGlass() throws {
        // GIVEN
        let useCaseMock = PopoverGetColorsUseCasableGeneratedMock()
        useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReturnValue = .init(
            background: self.theme.colors.feedback.alert,
            foreground: self.theme.colors.main.onMain
        )

        // WHEN
        let colors = PopoverIntent.alert.getColors(theme: self.theme, getColorsUseCase: useCaseMock)

        // THEN - Values
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.alert), "Wrong background color")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.main.onMain), "Wrong foreground color")

        // THEN - UseCase
        XCTAssertEqual(useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassCallsCount, 1, "useCaseMock.executeWithColorsAndIntentAndIsLiquidGlass should have been called once")
        let receivedArguments = try XCTUnwrap(useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReceivedArguments)
        XCTAssertIdentical(
            receivedArguments.colors as? ColorsGeneratedMock,
            self.theme.colors as? ColorsGeneratedMock,
            "Wrong receivedArguments.colors"
        )
        XCTAssertEqual(receivedArguments.intent, .alert, "Wrong receivedArguments.intent")
        XCTAssertEqual(receivedArguments.isLiquidGlass, PopoverConstants.isLiquidGlass, "Wrong receivedArguments.isLiquidGlass")
    }

    func test_internal_getColors_withCustomIsLiquidGlass() throws {
        // GIVEN
        let useCaseMock = PopoverGetColorsUseCasableGeneratedMock()
        useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReturnValue = .init(
            background: self.theme.colors.feedback.success,
            foreground: self.theme.colors.main.main
        )

        // WHEN
        let colors = PopoverIntent.success.getColors(theme: self.theme, getColorsUseCase: useCaseMock, isLiquidGlass: true)

        // THEN - Values
        XCTAssertTrue(colors.background.equals(self.theme.colors.feedback.success), "Wrong background color")
        XCTAssertTrue(colors.foreground.equals(self.theme.colors.main.main), "Wrong foreground color")

        // THEN - UseCase
        XCTAssertEqual(useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassCallsCount, 1, "useCaseMock.executeWithColorsAndIntentAndIsLiquidGlass should have been called once")
        let receivedArguments = try XCTUnwrap(useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReceivedArguments)
        XCTAssertIdentical(
            receivedArguments.colors as? ColorsGeneratedMock,
            self.theme.colors as? ColorsGeneratedMock,
            "Wrong receivedArguments.colors"
        )
        XCTAssertEqual(receivedArguments.intent, .success, "Wrong receivedArguments.intent")
        XCTAssertEqual(receivedArguments.isLiquidGlass, true, "Wrong receivedArguments.isLiquidGlass")
    }

    func test_used_getColorsUseCase() {
        for intent in PopoverIntent.allCases {
            XCTAssertTrue(intent.getColorsUseCase is PopoverGetColorsUseCase, "Wrong getColorsUseCase type for intent \(intent)")
        }
    }
}
