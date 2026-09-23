//
//  BadgeGetTextFontUseCase.swift
//  SparkComponentBadge
//
//  Created by robin.lemaire on 10/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol BadgeGetTextFontUseCaseable {

    // sourcery: theme = "Identical", return = "Identical"
    func execute(theme: any Theme, size: BadgeSize) -> any TypographyFontToken
}

final class BadgeGetTextFontUseCase: BadgeGetTextFontUseCaseable {

    // MARK: - Methods

    func execute(theme: any Theme, size: BadgeSize) -> any TypographyFontToken {
        return switch size {
        case .small: theme.typography.smallHighlight
        case .medium: theme.typography.captionHighlight
        }
    }
}
