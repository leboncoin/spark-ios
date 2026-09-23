//
//  SegmentedControlItemTypographiesTests.swift
//  SparkComponentSegmentedControlTests
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import Testing
@testable import SparkComponentSegmentedControl
@_spi(SI_SPI) import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

@Suite("SegmentedControl Item Typographies Tests")
struct SegmentedControlItemTypographiesTests {

    // MARK: - Tests

    @Test("Default initialization")
    func defaultInitialization() {
        // GIVEN / WHEN
        let typographies = SegmentedControlItemTypographies()

        // THEN
        #expect(typographies.textFontToken is TypographyFontTokenClear)
    }

    @Test("Custom initialization")
    func customInitialization() {
        // GIVEN
        let textToken = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.systemFont(ofSize: 16), font: .body)

        // WHEN
        let typographies = SegmentedControlItemTypographies(textFontToken: textToken)

        // THEN
        #expect(typographies.textFontToken as? TypographyFontTokenGeneratedMock === textToken)
    }

    @Test("Equality with same default instances")
    func equalitySameDefaultInstances() {
        // GIVEN
        let typographies1 = SegmentedControlItemTypographies()
        let typographies2 = SegmentedControlItemTypographies()

        // WHEN / THEN
        #expect(typographies1 == typographies2)
    }

    @Test("Inequality when different text font tokens")
    func inequalityDifferentTextFontTokens() {
        // GIVEN
        let textToken1 = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.systemFont(ofSize: 16), font: .body)
        let textToken2 = TypographyFontTokenGeneratedMock.mocked(uiFont: UIFont.systemFont(ofSize: 18), font: .body)

        let typographies1 = SegmentedControlItemTypographies(textFontToken: textToken1)
        let typographies2 = SegmentedControlItemTypographies(textFontToken: textToken2)

        // WHEN / THEN
        #expect(typographies1 != typographies2)
    }

    @Test("Equality when same font properties")
    func equalitySameFontProperties() {
        // GIVEN
        let font = Font.body
        let uiFont = UIFont.systemFont(ofSize: 16)

        let textToken1 = TypographyFontTokenGeneratedMock.mocked(uiFont: uiFont, font: font)
        let textToken2 = TypographyFontTokenGeneratedMock.mocked(uiFont: uiFont, font: font)

        let typographies1 = SegmentedControlItemTypographies(textFontToken: textToken1)
        let typographies2 = SegmentedControlItemTypographies(textFontToken: textToken2)

        // WHEN / THEN
        #expect(typographies1 == typographies2)
    }
}
