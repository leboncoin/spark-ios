//
//  SnackbarIntentTests.swift
//  SparkComponentSnackbar
//
//  Created by louis.borlee on 03/09/2024.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkComponentSnackbar
@_spi(SI_SPI) @testable import SparkComponentSnackbarTesting
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Snackbar Intent Tests")
struct SnackbarIntentTests {

    // MARK: - Tests

    @Test("All cases contains expected cases")
    func allCasesContainsExpectedCases() {
        // GIVEN
        let expectedCases: [SnackbarIntent] = [.alert, .error, .info, .success]

        // WHEN / THEN
        #expect(SnackbarIntent.allCases.count == expectedCases.count)
        #expect(Set(SnackbarIntent.allCases) == Set(expectedCases))
    }

    @Test("Default value is info")
    func defaultValueIsInfo() {
        // GIVEN / WHEN / THEN
        #expect(SnackbarIntent.default == .info)
    }

    @Test("All cases are sorted alphabetically")
    func allCasesAreSortedAlphabetically() {
        // GIVEN
        let expectedOrder: [SnackbarIntent] = [.alert, .error, .info, .success]

        // WHEN / THEN
        #expect(SnackbarIntent.allCases == expectedOrder)
    }

    @Test("Deprecated cases are not in allCases")
    func deprecatedCasesAreNotInAllCases() {
        // GIVEN
        let allCases = SnackbarIntent.allCases

        // WHEN / THEN
        #expect(!allCases.contains(.accent))
        #expect(!allCases.contains(.main))
        #expect(!allCases.contains(.neutral))
        #expect(!allCases.contains(.support))
        #expect(!allCases.contains(.surfaceInverse))
    }

    // MARK: - Deprecated Tests

    @Test("Internal getColors returns expected colors")
    func internalGetColorsReturnsExpectedColors() throws {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCaseMock = SnackbarGetColorsUseCasableDeprecatedGeneratedMock()
        useCaseMock.executeWithColorsAndIntentAndVariantReturnValue = .init(
            background: theme.colors.feedback.alert,
            foreground: theme.colors.main.onMain
        )

        // WHEN
        let colors = SnackbarIntent.alert.getColors(theme: theme, variant: .filled, getColorsUseCase: useCaseMock)

        // THEN - Values
        #expect(colors.background.equals(theme.colors.feedback.alert))
        #expect(colors.foreground.equals(theme.colors.main.onMain))

        // THEN - UseCase
        #expect(useCaseMock.executeWithColorsAndIntentAndVariantCallsCount == 1)
        let receivedArguments = try #require(useCaseMock.executeWithColorsAndIntentAndVariantReceivedArguments)
        #expect(receivedArguments.colors as? ColorsGeneratedMock === theme.colors as? ColorsGeneratedMock)
        #expect(receivedArguments.variant == .filled)
        #expect(receivedArguments.intent == .alert)
    }

    @Test("Used getColorsUseCase is correct type for all cases")
    func usedGetColorsUseCaseIsCorrectType() {
        // GIVEN / WHEN / THEN
        for intent in SnackbarIntent.allCases {
            #expect(intent.getColorsUseCase is SnackbarGetColorsUseCaseDeprecated)
        }
    }
}
