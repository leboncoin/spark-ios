//
//  AvatarToken+Typography.swift
//  SparkComponentAvatar
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Typography

public extension AvatarToken {

    /// Contains the typography token values of the Avatar.
    struct Typography: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The font token of the placeholder.
        public func placeholder(size: AvatarSize) -> any TypographyFontToken {
            let typography = self.theme.typography

            return switch size {
            case .xs: typography.body2Highlight
            case .sm: typography.headline2
            case .md: typography.display3
            case .lg, .xl: typography.display2
            case .xxl: typography.display1
            case .xxxl:
                typography.custom(
                    size: 64,
                    weight: .bold,
                    style: .largeTitle
                )
            }
        }

        // MARK: - Equatable

        public static func == (lhs: Typography, rhs: Typography) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
