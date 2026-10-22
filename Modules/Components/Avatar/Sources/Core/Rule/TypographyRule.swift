//
//  TypographyRule.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

extension Theme {

    // MARK: - Getter

    func placeholderFontToken(size: AvatarSize) -> any TypographyFontToken {
        return switch size {
        case .xs: self.typography.body2Highlight
        case .sm: self.typography.headline2
        case .md: self.typography.display3
        case .lg, .xl: self.typography.display2
        case .xxl: self.typography.display1
        case .xxxl:
            self.typography.custom(
                size: 64,
                weight: .bold,
                style: .largeTitle
            )
        }
    }
}
