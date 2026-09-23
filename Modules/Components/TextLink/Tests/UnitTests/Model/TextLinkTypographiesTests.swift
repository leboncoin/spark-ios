//
//  TextLinkTypographiesTests.swift
//  SparkComponentTextLinkUnitTests
//
//  Created by robin.lemaire on 25/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

final class TextLinkTypographiesTests: XCTestCase {

    // MARK: - Tests

    func test_init_with_default_values() {
        // GIVEN / WHEN
        let typographies = TextLinkTypographies()

        // THEN
        XCTAssertTrue(typographies.normal is TypographyFontTokenClear, "Normal should be TypographyFontTokenClear")
        XCTAssertTrue(typographies.highlight is TypographyFontTokenClear, "Highlight should be TypographyFontTokenClear")
    }

    func test_init_with_custom_values() {
        // GIVEN
        let normalToken = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.systemFont(ofSize: 16), font: .body)
        let highlightToken = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.boldSystemFont(ofSize: 16), font: .body)

        // WHEN
        let typographies = TextLinkTypographies(normal: normalToken, highlight: highlightToken)

        // THEN
        XCTAssertIdentical(typographies.normal as? TypographyFontTokenGeneratedMock, normalToken)
        XCTAssertIdentical(typographies.highlight as? TypographyFontTokenGeneratedMock, highlightToken)
    }

    func test_equatable_same_default_instances() {
        // GIVEN
        let typographies1 = TextLinkTypographies()
        let typographies2 = TextLinkTypographies()

        // WHEN / THEN
        XCTAssertEqual(typographies1, typographies2, "Two default instances should be equal")
    }

    func test_equatable_different_normal_tokens() {
        // GIVEN
        let normalToken1 = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.systemFont(ofSize: 16), font: .body)
        let normalToken2 = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.systemFont(ofSize: 18), font: .body)
        let highlightToken = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.boldSystemFont(ofSize: 16), font: .body)

        let typographies1 = TextLinkTypographies(normal: normalToken1, highlight: highlightToken)
        let typographies2 = TextLinkTypographies(normal: normalToken2, highlight: highlightToken)

        // WHEN / THEN
        XCTAssertNotEqual(typographies1, typographies2, "Instances with different normal tokens should not be equal")
    }

    func test_equatable_different_highlight_tokens() {
        // GIVEN
        let normalToken = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.systemFont(ofSize: 16), font: .body)
        let highlightToken1 = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.boldSystemFont(ofSize: 16), font: .body)
        let highlightToken2 = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.boldSystemFont(ofSize: 18), font: .body)

        let typographies1 = TextLinkTypographies(normal: normalToken, highlight: highlightToken1)
        let typographies2 = TextLinkTypographies(normal: normalToken, highlight: highlightToken2)

        // WHEN / THEN
        XCTAssertNotEqual(typographies1, typographies2, "Instances with different highlight tokens should not be equal")
    }

    func test_equatable_same_font_properties() {
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
        XCTAssertEqual(typographies1, typographies2, "Instances with same font properties should be equal")
    }
}
