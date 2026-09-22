//
//  TypographyFontNamesTests.swift
//  SparkThemeUnitTests
//
//  Created by robin.lemaire on 29/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
@testable import SparkTheming

@Suite("Typography Font Names Tests")
struct TypographyFontNamesTests {

    // MARK: - Tests

    @Test("Initialization with different font names")
    func initializationWithDifferentFontNames() {
        // GIVEN
        let regular = "Helvetica"
        let medium = "Helvetica-Medium"
        let semibold = "Helvetica-SemiBold"
        let bold = "Helvetica-Bold"

        // WHEN
        let fontNames = TypographyFontNames(
            regular: regular,
            medium: medium,
            semibold: semibold,
            bold: bold
        )

        // THEN
        #expect(fontNames.regular == regular)
        #expect(fontNames.medium == medium)
        #expect(fontNames.semibold == semibold)
        #expect(fontNames.bold == bold)
    }

    @Test("Initialization with single font name")
    func initializationWithSingleFontName() {
        // GIVEN
        let fontName = "Arial"

        // WHEN
        let fontNames = TypographyFontNames(fontName: fontName)

        // THEN
        #expect(fontNames.regular == fontName)
        #expect(fontNames.medium == fontName)
        #expect(fontNames.semibold == fontName)
        #expect(fontNames.bold == fontName)
    }

    @Test("Get font name for regular style")
    func getFontNameForRegularStyle() {
        // GIVEN
        let fontNames = TypographyFontNames(
            regular: "Font-Regular",
            medium: "Font-Medium",
            semibold: "Font-SemiBold",
            bold: "Font-Bold"
        )

        // WHEN
        let fontName = fontNames.getFontName(from: .regular)

        // THEN
        #expect(fontName == "Font-Regular")
    }

    @Test("Get font name for medium style")
    func getFontNameForMediumStyle() {
        // GIVEN
        let fontNames = TypographyFontNames(
            regular: "Font-Regular",
            medium: "Font-Medium",
            semibold: "Font-SemiBold",
            bold: "Font-Bold"
        )

        // WHEN
        let fontName = fontNames.getFontName(from: .medium)

        // THEN
        #expect(fontName == "Font-Medium")
    }

    @Test("Get font name for semibold style")
    func getFontNameForSemiBoldStyle() {
        // GIVEN
        let fontNames = TypographyFontNames(
            regular: "Font-Regular",
            medium: "Font-Medium",
            semibold: "Font-SemiBold",
            bold: "Font-Bold"
        )

        // WHEN
        let fontName = fontNames.getFontName(from: .semibold)

        // THEN
        #expect(fontName == "Font-SemiBold")
    }

    @Test("Get font name for bold style")
    func getFontNameForBoldStyle() {
        // GIVEN
        let fontNames = TypographyFontNames(
            regular: "Font-Regular",
            medium: "Font-Medium",
            semibold: "Font-SemiBold",
            bold: "Font-Bold"
        )

        // WHEN
        let fontName = fontNames.getFontName(from: .bold)

        // THEN
        #expect(fontName == "Font-Bold")
    }

    @Test("Equality when same values")
    func equalityWhenSameValues() {
        // GIVEN / WHEN
        let fontNames1 = TypographyFontNames(
            regular: "Arial",
            medium: "Arial-Medium",
            semibold: "Arial-SemiBold",
            bold: "Arial-Bold"
        )

        let fontNames2 = TypographyFontNames(
            regular: "Arial",
            medium: "Arial-Medium",
            semibold: "Arial-SemiBold",
            bold: "Arial-Bold"
        )

        // THEN
        #expect(fontNames1 == fontNames2)
    }

    @Test("Inequality when different regular")
    func inequalityWhenDifferentRegular() {
        // GIVEN / WHEN
        let fontNames1 = TypographyFontNames(
            regular: "Arial",
            medium: "Arial-Medium",
            semibold: "Arial-SemiBold",
            bold: "Arial-Bold"
        )

        let fontNames2 = TypographyFontNames(
            regular: "Helvetica",
            medium: "Arial-Medium",
            semibold: "Arial-SemiBold",
            bold: "Arial-Bold"
        )

        // THEN
        #expect(fontNames1 != fontNames2)
    }

    @Test("Inequality when different medium")
    func inequalityWhenDifferentMedium() {
        // GIVEN / WHEN
        let fontNames1 = TypographyFontNames(
            regular: "Arial",
            medium: "Arial-Medium",
            semibold: "Arial-SemiBold",
            bold: "Arial-Bold"
        )

        let fontNames2 = TypographyFontNames(
            regular: "Arial",
            medium: "Helvetica-Medium",
            semibold: "Arial-SemiBold",
            bold: "Arial-Bold"
        )

        // THEN
        #expect(fontNames1 != fontNames2)
    }

    @Test("Inequality when different semibold")
    func inequalityWhenDifferentSemiBold() {
        // GIVEN / WHEN
        let fontNames1 = TypographyFontNames(
            regular: "Arial",
            medium: "Arial-Medium",
            semibold: "Arial-SemiBold",
            bold: "Arial-Bold"
        )

        let fontNames2 = TypographyFontNames(
            regular: "Arial",
            medium: "Arial-Medium",
            semibold: "Helvetica-SemiBold",
            bold: "Arial-Bold"
        )

        // THEN
        #expect(fontNames1 != fontNames2)
    }

    @Test("Inequality when different bold")
    func inequalityWhenDifferentBold() {
        // GIVEN / WHEN
        let fontNames1 = TypographyFontNames(
            regular: "Arial",
            medium: "Arial-Medium",
            semibold: "Arial-SemiBold",
            bold: "Arial-Bold"
        )

        let fontNames2 = TypographyFontNames(
            regular: "Arial",
            medium: "Arial-Medium",
            semibold: "Arial-SemiBold",
            bold: "Helvetica-Bold"
        )

        // THEN
        #expect(fontNames1 != fontNames2)
    }

    @Test("Equality when using single font name initializer")
    func equalityWhenUsingSingleFontNameInitializer() {
        // GIVEN / WHEN
        let fontNames1 = TypographyFontNames(fontName: "CustomFont")
        let fontNames2 = TypographyFontNames(fontName: "CustomFont")

        // THEN
        #expect(fontNames1 == fontNames2)
    }

    @Test("Inequality when using different single font names")
    func inequalityWhenUsingDifferentSingleFontNames() {
        // GIVEN / WHEN
        let fontNames1 = TypographyFontNames(fontName: "Arial")
        let fontNames2 = TypographyFontNames(fontName: "Helvetica")

        // THEN
        #expect(fontNames1 != fontNames2)
    }

    @Test("Get font name returns same value when initialized with single font name")
    func getFontNameReturnsSameValueWhenInitializedWithSingleFontName() {
        // GIVEN
        let fontName = "CustomFont"
        let fontNames = TypographyFontNames(fontName: fontName)

        // WHEN / THEN
        #expect(fontNames.getFontName(from: .regular) == fontName)
        #expect(fontNames.getFontName(from: .medium) == fontName)
        #expect(fontNames.getFontName(from: .semibold) == fontName)
        #expect(fontNames.getFontName(from: .bold) == fontName)
    }
}
