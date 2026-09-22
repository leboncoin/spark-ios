//
//  FontWeightExtensionTests.swift
//  SparkTheming
//
//  Created by robin.lemaire on 28/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable @_spi(SI_SPI) import SparkTheming
import SwiftUI
import Testing

// MARK: - Tests

@Suite("Font.Weight Extension Tests")
struct FontWeightExtensionTests {

    // MARK: - Tests

    @Test(
        "Init from TypographyFontWeight maps correctly",
        arguments: [
            (TypographyFontWeight.regular, Font.Weight.regular),
            (TypographyFontWeight.medium, Font.Weight.medium),
            (TypographyFontWeight.semibold, Font.Weight.semibold),
            (TypographyFontWeight.bold, Font.Weight.bold)
        ]
    )
    func testInitFromTypographyFontWeight(
        typographyFontWeight: TypographyFontWeight,
        expectedFontWeight: Font.Weight
    ) {
        // GIVEN / WHEN
        let fontWeight = Font.Weight(from: typographyFontWeight)

        // THEN
        #expect(fontWeight == expectedFontWeight)
    }
}
