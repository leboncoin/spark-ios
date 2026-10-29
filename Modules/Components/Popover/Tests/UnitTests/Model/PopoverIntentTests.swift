//
//  PopoverIntentTests.swift
//  SparkComponentPopoverUnitTests
//
//  Created by louis.borlee on 26/06/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentPopover
@_spi(SI_SPI) @testable import SparkComponentPopoverTesting
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Popover Intent Tests")
struct PopoverIntentTests {

    // MARK: - Properties

    private let theme = ThemeGeneratedMock.mocked()

    // MARK: - Cases Tests

    @Test("All cases count")
    func allCasesCount() {
        // THEN
        #expect(PopoverIntent.allCases.count == 2, "Wrong allCases count")
    }

    @Test("All cases contains all non deprecated cases")
    func allCasesContainsAllNonDeprecatedCases() {
        // THEN
        #expect(PopoverIntent.allCases.contains(.info), "allCases should contain .info")
        #expect(PopoverIntent.allCases.contains(.surface), "allCases should contain .surface")
    }

    @Test("All cases does not contain deprecated cases")
    func allCasesDoesNotContainDeprecatedCases() {
        // THEN
        #expect(!PopoverIntent.allCases.contains(.neutral), "allCases should not contain .neutral (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.accent), "allCases should not contain .accent (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.main), "allCases should not contain .main (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.support), "allCases should not contain .support (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.success), "allCases should not contain .success (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.alert), "allCases should not contain .alert (deprecated)")
        #expect(!PopoverIntent.allCases.contains(.error), "allCases should not contain .error (deprecated)")
    }

    // MARK: - GetColors Tests

    @Test("Internal get colors with default is liquid glass")
    func internalGetColorsWithDefaultIsLiquidGlass() throws {
        // GIVEN
        let useCaseMock = PopoverGetColorsUseCasableGeneratedMock()
        useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReturnValue = .init(
            background: self.theme.colors.feedback.alert,
            foreground: self.theme.colors.main.onMain
        )

        // WHEN
        let colors = PopoverIntent.alert.getColors(theme: self.theme, getColorsUseCase: useCaseMock)

        // THEN - Values
        #expect(colors.background.equals(self.theme.colors.feedback.alert), "Wrong background color")
        #expect(colors.foreground.equals(self.theme.colors.main.onMain), "Wrong foreground color")

        // THEN - UseCase
        #expect(useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassCallsCount == 1, "useCaseMock.executeWithColorsAndIntentAndIsLiquidGlass should have been called once")
        let receivedArguments = try #require(useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReceivedArguments)
        #expect(
            (receivedArguments.colors as? ColorsGeneratedMock) === (self.theme.colors as? ColorsGeneratedMock),
            "Wrong receivedArguments.colors"
        )
        #expect(receivedArguments.intent == .alert, "Wrong receivedArguments.intent")
        #expect(receivedArguments.isLiquidGlass == PopoverConstants.isLiquidGlass, "Wrong receivedArguments.isLiquidGlass")
    }

    @Test("Internal get colors with custom is liquid glass")
    func internalGetColorsWithCustomIsLiquidGlass() throws {
        // GIVEN
        let useCaseMock = PopoverGetColorsUseCasableGeneratedMock()
        useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReturnValue = .init(
            background: self.theme.colors.feedback.success,
            foreground: self.theme.colors.main.main
        )

        // WHEN
        let colors = PopoverIntent.success.getColors(theme: self.theme, getColorsUseCase: useCaseMock, isLiquidGlass: true)

        // THEN - Values
        #expect(colors.background.equals(self.theme.colors.feedback.success), "Wrong background color")
        #expect(colors.foreground.equals(self.theme.colors.main.main), "Wrong foreground color")

        // THEN - UseCase
        #expect(useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassCallsCount == 1, "useCaseMock.executeWithColorsAndIntentAndIsLiquidGlass should have been called once")
        let receivedArguments = try #require(useCaseMock.executeWithColorsAndIntentAndIsLiquidGlassReceivedArguments)
        #expect(
            (receivedArguments.colors as? ColorsGeneratedMock) === (self.theme.colors as? ColorsGeneratedMock),
            "Wrong receivedArguments.colors"
        )
        #expect(receivedArguments.intent == .success, "Wrong receivedArguments.intent")
        #expect(receivedArguments.isLiquidGlass == true, "Wrong receivedArguments.isLiquidGlass")
    }

    @Test("Used get colors use case")
    func usedGetColorsUseCase() {
        for intent in PopoverIntent.allCases {
            #expect(intent.getColorsUseCase is PopoverGetColorsUseCase, "Wrong getColorsUseCase type for intent \(intent)")
        }
    }
}
