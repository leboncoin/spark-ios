//
//  TypographyFontTokenDefault.swift
//  SparkTheming
//
//  Created by robin.lemaire on 05/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
import UIKit

// MARK: - Font

public struct TypographyFontTokenDefault: TypographyFontToken {

    // MARK: - Private Properties

    private let weight: TypographyFontWeight
    private let fontNames: TypographyFontNames
    private let fontSize: CGFloat
    private let fontTextStyle: TypographyFontStyle

    private var fontName: String {
        let boldFontName = self.fontNames.bold
        let fontName = self.fontNames.getFontName(from: self.weight)

        return UIAccessibility.isBoldTextEnabled ? boldFontName : fontName
    }

    // MARK: - Public Properties

    public var uiFont: UIFont {
        guard let font = UIFont(name: self.fontName, size: self.fontSize) else {
            fatalError("Missing font named \(self.fontName)")
        }
        let style = UIFont.TextStyle(from: self.fontTextStyle)
        return UIFontMetrics(forTextStyle: style).scaledFont(for: font)
    }

    public var font: Font {
        let style = Font.TextStyle(from: self.fontTextStyle)
        return Font.custom(
            self.fontName,
            size: self.fontSize,
            relativeTo: style
        )
    }

    // MARK: - Initialization

    public init(
        named fontName: String,
        weight: TypographyFontWeight = .regular,
        size: CGFloat,
        style: TypographyFontStyle
    ) {
        let fontNames = TypographyFontNames(fontName: fontName)
        self.fontNames = fontNames
        self.weight = weight
        self.fontSize = size
        self.fontTextStyle = style
    }

    public init(
        names: TypographyFontNames,
        weight: TypographyFontWeight,
        size: CGFloat,
        style: TypographyFontStyle
    ) {
        self.fontNames = names
        self.weight = weight
        self.fontSize = size
        self.fontTextStyle = style
    }
}
