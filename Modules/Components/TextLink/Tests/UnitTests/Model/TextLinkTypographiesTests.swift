//
//  TextLinkTypographiesTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@MainActor
@Suite("Text Link Typographies Tests")
struct TextLinkTypographiesTests {

    // MARK: - Tests

    @Test("Init with default values")
    func initWithDefaultValues() {
        // GIVEN / WHEN
        let typographies = TextLinkTypographies()

        // THEN
        #expect(typographies.normal is TypographyFontTokenClear, "Normal should be TypographyFontTokenClear")
        #expect(typographies.highlight is TypographyFontTokenClear, "Highlight should be TypographyFontTokenClear")
    }

    @Test("Init with custom values")
    func initWithCustomValues() {
        // GIVEN
        let normalToken = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.systemFont(ofSize: 16), font: .body)
        let highlightToken = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.boldSystemFont(ofSize: 16), font: .body)

        // WHEN
        let typographies = TextLinkTypographies(normal: normalToken, highlight: highlightToken)

        // THEN
        #expect(typographies.normal as? TypographyFontTokenGeneratedMock === normalToken)
        #expect(typographies.highlight as? TypographyFontTokenGeneratedMock === highlightToken)
    }

    @Test("Equatable same default instances")
    func equatableSameDefaultInstances() {
        // GIVEN
        let typographies1 = TextLinkTypographies()
        let typographies2 = TextLinkTypographies()

        // WHEN / THEN
        #expect(typographies1 == typographies2, "Two default instances should be equal")
    }

    @Test("Equatable different normal tokens")
    func equatableDifferentNormalTokens() {
        // GIVEN
        let normalToken1 = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.systemFont(ofSize: 16), font: .body)
        let normalToken2 = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.systemFont(ofSize: 18), font: .body)
        let highlightToken = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.boldSystemFont(ofSize: 16), font: .body)

        let typographies1 = TextLinkTypographies(normal: normalToken1, highlight: highlightToken)
        let typographies2 = TextLinkTypographies(normal: normalToken2, highlight: highlightToken)

        // WHEN / THEN
        #expect(typographies1 != typographies2, "Instances with different normal tokens should not be equal")
    }

    @Test("Equatable different highlight tokens")
    func equatableDifferentHighlightTokens() {
        // GIVEN
        let normalToken = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.systemFont(ofSize: 16), font: .body)
        let highlightToken1 = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.boldSystemFont(ofSize: 16), font: .body)
        let highlightToken2 = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.boldSystemFont(ofSize: 18), font: .body)

        let typographies1 = TextLinkTypographies(normal: normalToken, highlight: highlightToken1)
        let typographies2 = TextLinkTypographies(normal: normalToken, highlight: highlightToken2)

        // WHEN / THEN
        #expect(typographies1 != typographies2, "Instances with different highlight tokens should not be equal")
    }

    @Test("Equatable same font properties")
    func equatableSameFontProperties() {
        // GIVEN
        let font = Font.body
        let uiFont = UIFont.systemFont(ofSize: 16)

        let normalToken1 = TypographyFontTokenGeneratedMock.mocked(uiFont: uiFont, font: font)
        let normalToken2 = TypographyFontTokenGeneratedMock.mocked(uiFont: uiFont, font: font)
        let highlightToken1 = TypographyFontTokenGeneratedMock.mocked(uiFont: uiFont, font: font)
        let highlightToken2 = TypographyFontTokenGeneratedMock.mocked(uiFont: uiFont, font: font)

        let typographies1 = TextLinkTypographies(normal: normalToken1, highlight: highlightToken1)
        let typographies2 = TextLinkTypographies(normal: normalToken2, highlight: highlightToken2)

        // WHEN / THEN
        #expect(typographies1 == typographies2, "Instances with same font properties should be equal")
    }
}
