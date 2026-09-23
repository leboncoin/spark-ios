//
//  TextLinkGetTypographiesUseCase.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 20/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol TextLinkGetTypographiesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        typography: TextLinkTypography
    ) -> TextLinkTypographies
}

struct TextLinkGetTypographiesUseCase: TextLinkGetTypographiesUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        typography textLinkTypography: TextLinkTypography
    ) -> TextLinkTypographies {
        let typography = theme.typography
        switch textLinkTypography {
        case .display1:
            return .init(
                normal: typography.display1,
                highlight: typography.display1
            )
        case .display2:
            return .init(
                normal: typography.display2,
                highlight: typography.display2
            )
        case .display3:
            return .init(
                normal: typography.display3,
                highlight: typography.display3
            )

        case .headline1:
            return .init(
                normal: typography.headline1,
                highlight: typography.headline1
            )
        case .headline2:
            return .init(
                normal: typography.headline2,
                highlight: typography.headline2
            )

        case .subhead:
            return .init(
                normal: typography.subhead,
                highlight: typography.subhead
            )

        case .body1:
            return .init(
                normal: typography.body1,
                highlight: typography.body1Highlight
            )
        case .body2:
            return .init(
                normal: typography.body2,
                highlight: typography.body2Highlight
            )

        case .caption:
            return .init(
                normal: typography.caption,
                highlight: typography.captionHighlight
            )

        case .small:
            return .init(
                normal: typography.small,
                highlight: typography.smallHighlight
            )

        case .callout:
            return .init(
                normal: typography.callout,
                highlight: typography.callout
            )
        }
    }
}
