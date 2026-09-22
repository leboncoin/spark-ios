//
//  TabFontsTests.swift
//  SparkComponentTabTests
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentTab
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("Tab Fonts Tests")
struct TabFontsTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let fonts = TabFonts()

        // THEN
        #expect(fonts.typographyFontToken.equals(TypographyFontTokenClear()))
    }

    @Test("Equality when same fonts")
    func equalityWhenSameFonts() {
        // GIVEN / WHEN
        let typographyFontToken = TypographyFontTokenGeneratedMock.mocked()

        let fonts1 = TabFonts(
            typographyFontToken: typographyFontToken
        )

        let fonts2 = TabFonts(
            typographyFontToken: typographyFontToken
        )

        // THEN
        #expect(fonts1 == fonts2)
    }

    @Test("Inequality when different typography font token")
    func inequalityWhenDifferentTypographyFontToken() {
        // GIVEN / WHEN
        let typographyFontToken1 = TypographyFontTokenGeneratedMock.mocked(.body)
        let typographyFontToken2 = TypographyFontTokenGeneratedMock.mocked(.title)

        let fonts1 = TabFonts(
            typographyFontToken: typographyFontToken1
        )

        let fonts2 = TabFonts(
            typographyFontToken: typographyFontToken2
        )

        // THEN
        #expect(fonts1 != fonts2)
    }
}
