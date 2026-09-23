//
//  SkyTypography.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/08/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming
import SwiftUI
import UIKit

public struct SkyTypography: Typography {

    // MARK: - Properties

    public let bigTitle: any TypographyFontToken = TypographyFontTokenDefault(
        size: 80,
        weight: .bold,
        style: .largeTitle
    )

    public let display1: any TypographyFontToken = TypographyFontTokenDefault(
        size: 40,
        weight: .bold,
        style: .largeTitle
    )
    public let display2: any TypographyFontToken = TypographyFontTokenDefault(
        size: 32,
        weight: .bold,
        style: .largeTitle
    )
    public let display3: any TypographyFontToken = TypographyFontTokenDefault(
        size: 24,
        weight: .bold,
        style: .largeTitle
    )

    public let headline1: any TypographyFontToken = TypographyFontTokenDefault(
        size: 20,
        weight: .semibold,
        style: .headline
    )
    public let headline2: any TypographyFontToken = TypographyFontTokenDefault(
        size: 18,
        weight: .semibold,
        style: .headline
    )

    public let subhead: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        weight: .semibold,
        style: .subheadline
    )

    public let body1: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        weight: .regular,
        style: .body
    )
    public let body1Highlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        weight: .medium,
        style: .body
    )

    public let body2: any TypographyFontToken = TypographyFontTokenDefault(
        size: 14,
        weight: .regular,
        style: .body
    )
    public let body2Highlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 14,
        weight: .medium,
        style: .body
    )

    public let caption: any TypographyFontToken = TypographyFontTokenDefault(
        size: 12,
        weight: .regular,
        style: .caption
    )
    public let captionHighlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 12,
        weight: .medium,
        style: .caption
    )

    public let small: any TypographyFontToken = TypographyFontTokenDefault(
        size: 10,
        weight: .regular,
        style: .footnote
    )
    public let smallHighlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 10,
        weight: .medium,
        style: .footnote
    )

    public let callout: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        weight: .medium,
        style: .callout
    )

    // MARK: - Initialization

    public init() {}

    // MARK: - Methods

    public func custom(
        size: CGFloat,
        weight: TypographyFontWeight,
        style: TypographyFontStyle
    ) -> any TypographyFontToken {
        TypographyFontTokenDefault(
            size: size,
            weight: weight,
            style: style
        )
    }
}

// MARK: - TypographyFont Extension

private extension TypographyFontTokenDefault {

    // MARK: - Constants

    private enum Constants {
        static let regularFontName = "NunitoSans-Regular"
        static let boldFontName = "NunitoSans-Bold"
    }

    // MARK: - Initialization

    init(
        size: CGFloat,
        weight: TypographyFontWeight,
        style: TypographyFontStyle
    ) {
        self.init(
            names: .init(
                regular: Constants.regularFontName,
                medium: Constants.boldFontName,
                semibold: Constants.boldFontName,
                bold: Constants.boldFontName
            ),
            weight: weight,
            size: size,
            style: style
        )
    }
}
