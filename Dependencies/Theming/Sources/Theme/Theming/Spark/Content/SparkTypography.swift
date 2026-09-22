//
//  SparkTypography.swift
//  SparkTheme
//
//  Created by robin.lemaire on 28/02/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import SparkTheming
import SwiftUI
import UIKit

struct SparkTypography: Typography {

    // MARK: - Properties

    let bigTitle: any TypographyFontToken = TypographyFontTokenDefault(
        size: 80,
        weight: .bold,
        style: .largeTitle
    )

    let display1: any TypographyFontToken = TypographyFontTokenDefault(
        size: 40,
        weight: .bold,
        style: .largeTitle
    )
    let display2: any TypographyFontToken = TypographyFontTokenDefault(
        size: 32,
        weight: .bold,
        style: .largeTitle
    )
    let display3: any TypographyFontToken = TypographyFontTokenDefault(
        size: 24,
        weight: .bold,
        style: .largeTitle
    )

    let headline1: any TypographyFontToken = TypographyFontTokenDefault(
        size: 20,
        weight: .semibold,
        style: .headline
    )
    let headline2: any TypographyFontToken = TypographyFontTokenDefault(
        size: 18,
        weight: .semibold,
        style: .headline
    )

    let subhead: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        weight: .semibold,
        style: .subheadline
    )

    let body1: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        weight: .regular,
        style: .body
    )
    let body1Highlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        weight: .medium,
        style: .body
    )

    let body2: any TypographyFontToken = TypographyFontTokenDefault(
        size: 14,
        weight: .regular,
        style: .body
    )
    let body2Highlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 14,
        weight: .medium,
        style: .body
    )

    let caption: any TypographyFontToken = TypographyFontTokenDefault(
        size: 12,
        weight: .regular,
        style: .caption
    )
    let captionHighlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 12,
        weight: .medium,
        style: .caption
    )

    let small: any TypographyFontToken = TypographyFontTokenDefault(
        size: 10,
        weight: .regular,
        style: .footnote
    )
    let smallHighlight: any TypographyFontToken = TypographyFontTokenDefault(
        size: 10,
        weight: .medium,
        style: .footnote
    )

    let callout: any TypographyFontToken = TypographyFontTokenDefault(
        size: 16,
        weight: .medium,
        style: .callout
    )

    // MARK: - Initialization

    init() {}

    // MARK: - Methods

    func custom(
        size: CGFloat,
        weight: TypographyFontWeight,
        style: TypographyFontStyle
    ) -> any TypographyFontToken {
        return TypographyFontTokenDefault(
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
        static let regularFontName = "LBCDenimINK-Regular"
        static let mediumFontName = "LBCDenimINK-Medium"
        static let semiBoldFontName = "LBCDenimINK-SemiBold"
        static let boldFontName = "LBCDenimINK-Bold"
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
                medium: Constants.mediumFontName,
                semibold: Constants.semiBoldFontName,
                bold: Constants.boldFontName
            ),
            weight: weight,
            size: size,
            style: style
        )
    }
}
