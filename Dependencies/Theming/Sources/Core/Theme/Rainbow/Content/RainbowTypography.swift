//
//  RainbowTypography.swift
//  SparkTheming
//
//  Created by robin.lemaire on 14/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit

struct RainbowTypography: Typography {

    // MARK: - Properties

    let bigTitle: any TypographyFontToken = RainbowTypographyToken()

    let display1: any TypographyFontToken = RainbowTypographyToken()
    let display2: any TypographyFontToken = RainbowTypographyToken()
    let display3: any TypographyFontToken = RainbowTypographyToken()

    let headline1: any TypographyFontToken = RainbowTypographyToken()
    let headline2: any TypographyFontToken = RainbowTypographyToken()

    let subhead: any TypographyFontToken = RainbowTypographyToken()

    let body1: any TypographyFontToken = RainbowTypographyToken()
    let body1Highlight: any TypographyFontToken = RainbowTypographyToken()

    let body2: any TypographyFontToken = RainbowTypographyToken()
    let body2Highlight: any TypographyFontToken = RainbowTypographyToken()

    let caption: any TypographyFontToken = RainbowTypographyToken()
    let captionHighlight: any TypographyFontToken = RainbowTypographyToken()

    let small: any TypographyFontToken = RainbowTypographyToken()
    let smallHighlight: any TypographyFontToken = RainbowTypographyToken()

    let callout: any TypographyFontToken = RainbowTypographyToken()

    // MARK: - Initialization

    init() {}

    // MARK: - Methods

    func custom(
        size: CGFloat,
        weight: TypographyFontWeight,
        style: TypographyFontStyle
    ) -> any TypographyFontToken {
        RainbowTypographyToken()
    }
}

// MARK: - Private Token

private struct RainbowTypographyToken: TypographyFontToken {

    // MARK: - Properties

    let font: Font = .body
    let uiFont: UIFont = .systemFont(ofSize: 14)
}
