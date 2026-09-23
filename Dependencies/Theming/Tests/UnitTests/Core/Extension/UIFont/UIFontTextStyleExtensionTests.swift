//
//  UIFontTextStyleExtensionTests.swift
//  SparkTheming
//
//  Created by robin.lemaire on 28/08/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable @_spi(SI_SPI) import SparkTheming
import UIKit
import Testing

// MARK: - Tests

@Suite("UIFont.TextStyle Extension Tests")
struct UIFontTextStyleExtensionTests {

    // MARK: - Tests

    @Test(
        "Init from TypographyFontStyle maps correctly",
        arguments: [
            (TypographyFontStyle.largeTitle, UIFont.TextStyle.largeTitle),
            (TypographyFontStyle.title, UIFont.TextStyle.title1),
            (TypographyFontStyle.title2, UIFont.TextStyle.title2),
            (TypographyFontStyle.title3, UIFont.TextStyle.title3),
            (TypographyFontStyle.headline, UIFont.TextStyle.headline),
            (TypographyFontStyle.subheadline, UIFont.TextStyle.subheadline),
            (TypographyFontStyle.body, UIFont.TextStyle.body),
            (TypographyFontStyle.callout, UIFont.TextStyle.callout),
            (TypographyFontStyle.footnote, UIFont.TextStyle.footnote),
            (TypographyFontStyle.caption, UIFont.TextStyle.caption1),
            (TypographyFontStyle.caption2, UIFont.TextStyle.caption2)
        ]
    )
    func testInitFromTypographyFontStyle(
        typographyFontStyle: TypographyFontStyle,
        expectedUIFontTextStyle: UIFont.TextStyle
    ) {
        // GIVEN / WHEN
        let uiFontTextStyle = UIFont.TextStyle(from: typographyFontStyle)

        // THEN
        #expect(uiFontTextStyle == expectedUIFontTextStyle)
    }
}
