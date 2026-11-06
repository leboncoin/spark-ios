//
//  TypographyFontTokenDefaultTests.swift
//  SparkThemingUnitTests
//
//  Created by Robin Lemaire on 06/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import Testing
import SparkTheming

@Suite("Typography Font Token Default Tests")
struct TypographyFontTokenDefaultTests {

    // MARK: - Properties

    private static let names = TypographyFontNames(
        regular: "Regular",
        medium: "Medium",
        semibold: "Semibold",
        bold: "Bold"
    )

    // MARK: - Tests

    @Test("Same configuration should be equal with the same hash")
    func sameConfigurationShouldBeEqual() {
        // GIVEN
        let token1 = TypographyFontTokenDefault(names: Self.names, weight: .bold, size: 16, style: .body)
        let token2 = TypographyFontTokenDefault(names: Self.names, weight: .bold, size: 16, style: .body)

        // WHEN / THEN
        #expect(token1.equals(token2))
        #expect(token1 == token2)
        #expect(token1.hashValue == token2.hashValue)
    }

    @Test("Different names should not be equal")
    func differentNamesShouldNotBeEqual() {
        // GIVEN
        let token1 = TypographyFontTokenDefault(names: Self.names, weight: .bold, size: 16, style: .body)
        let token2 = TypographyFontTokenDefault(named: "Other", weight: .bold, size: 16, style: .body)

        // WHEN / THEN
        #expect(!token1.equals(token2))
    }

    @Test("Different weight should not be equal")
    func differentWeightShouldNotBeEqual() {
        // GIVEN
        let token1 = TypographyFontTokenDefault(names: Self.names, weight: .bold, size: 16, style: .body)
        let token2 = TypographyFontTokenDefault(names: Self.names, weight: .regular, size: 16, style: .body)

        // WHEN / THEN
        #expect(!token1.equals(token2))
    }

    @Test("Different size should not be equal")
    func differentSizeShouldNotBeEqual() {
        // GIVEN
        let token1 = TypographyFontTokenDefault(names: Self.names, weight: .bold, size: 16, style: .body)
        let token2 = TypographyFontTokenDefault(names: Self.names, weight: .bold, size: 18, style: .body)

        // WHEN / THEN
        #expect(!token1.equals(token2))
    }

    @Test("Different style should not be equal")
    func differentStyleShouldNotBeEqual() {
        // GIVEN
        let token1 = TypographyFontTokenDefault(names: Self.names, weight: .bold, size: 16, style: .body)
        let token2 = TypographyFontTokenDefault(names: Self.names, weight: .bold, size: 16, style: .caption)

        // WHEN / THEN
        #expect(!token1.equals(token2))
    }
}
