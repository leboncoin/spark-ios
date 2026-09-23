//
//  RatingDisplayGetTextStylesUseCase.swift
//  SparkComponentRating
//
//  Created by robin.lemaire on 07/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

// sourcery: AutoMockable, AutoMockTest
protocol RatingDisplayGetTextStylesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        size: RatingDisplaySize
    ) -> RatingDisplayTextStyles
}

final class RatingDisplayGetTextStylesUseCase: RatingDisplayGetTextStylesUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        size: RatingDisplaySize
    ) -> RatingDisplayTextStyles {
        typealias FontTokens = (value: any TypographyFontToken, other: any TypographyFontToken)

        let typography = theme.typography
        let fontTokens: FontTokens = switch size {
        case .small: (typography.captionHighlight, typography.caption)
        case .medium: (typography.body2Highlight, typography.body2)
        case .large: (typography.display3, typography.display3)
        case .input: (typography.display3, typography.display3)
        }

        let colorToken = theme.colors.base.onSurface
        let countColorToken = colorToken.opacity(theme.dims.dim1)

        return .init(
            value: .init(
                fontToken: fontTokens.value,
                colorToken: colorToken
            ),
            count: .init(
                fontToken: fontTokens.other,
                colorToken: countColorToken
            ),
            additional: .init(
                fontToken: fontTokens.other,
                colorToken: colorToken
            )
        )
    }
}
