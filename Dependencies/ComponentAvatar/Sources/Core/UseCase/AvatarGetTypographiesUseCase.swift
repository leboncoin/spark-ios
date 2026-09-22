//
//  AvatarGetTypographiesUseCase.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol AvatarGetTypographiesUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: any Theme, size: AvatarSize) -> AvatarTypographies
}

final class AvatarGetTypographiesUseCase: AvatarGetTypographiesUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        size: AvatarSize
    ) -> AvatarTypographies {
        let placeholderFontToken = switch size {
        case .xs: theme.typography.body2Highlight
        case .sm: theme.typography.headline2
        case .md: theme.typography.display3
        case .lg, .xl: theme.typography.display2
        case .xxl: theme.typography.display1
        case .xxxl:
            theme.typography.custom(
                size: 64,
                weight: .bold,
                style: .largeTitle
            )
        }

        return .init(
            placeholderFontToken: placeholderFontToken
        )
    }
}
