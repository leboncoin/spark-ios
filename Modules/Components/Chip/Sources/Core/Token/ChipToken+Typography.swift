//
//  ChipToken+Typography.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Typography

public extension ChipToken {

    /// Contains the typography token values of the Chip.
    struct Typography: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The font token of the title.
        public var title: any TypographyFontToken {
            return self.theme.typography.body1
        }

        // MARK: - Equatable

        public static func == (lhs: Typography, rhs: Typography) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
