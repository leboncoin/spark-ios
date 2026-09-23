//
//  FontTextStyleExtensionTests.swift
//  SparkTheming
//
//  Created by robin.lemaire on 28/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable @_spi(SI_SPI) import SparkTheming
import SwiftUI
import Testing

// MARK: - Tests

@Suite("Font.TextStyle Extension Tests")
struct FontTextStyleExtensionTests {

    // MARK: - Tests

    @Test(
        "Init from TypographyFontStyle maps correctly",
        arguments: [
            (TypographyFontStyle.largeTitle, Font.TextStyle.largeTitle),
            (TypographyFontStyle.title, Font.TextStyle.title),
            (TypographyFontStyle.title2, Font.TextStyle.title2),
            (TypographyFontStyle.title3, Font.TextStyle.title3),
            (TypographyFontStyle.headline, Font.TextStyle.headline),
            (TypographyFontStyle.subheadline, Font.TextStyle.subheadline),
            (TypographyFontStyle.body, Font.TextStyle.body),
            (TypographyFontStyle.callout, Font.TextStyle.callout),
            (TypographyFontStyle.footnote, Font.TextStyle.footnote),
            (TypographyFontStyle.caption, Font.TextStyle.caption),
            (TypographyFontStyle.caption2, Font.TextStyle.caption2)
        ]
    )
    func testInitFromTypographyFontStyle(
        typographyFontStyle: TypographyFontStyle,
        expectedFontTextStyle: Font.TextStyle
    ) {
        // GIVEN / WHEN
        let fontTextStyle = Font.TextStyle(from: typographyFontStyle)

        // THEN
        #expect(fontTextStyle == expectedFontTextStyle)
    }
}
