//
//  SegmentedControlToken+Typography.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Typography

public extension SegmentedControlToken {

    /// Contains the typography token values of the SegmentedControl.
    struct Typography: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The font token of the item text.
        public func itemFontToken(isSelected: Bool) -> any TypographyFontToken {
            let typography = self.theme.typography

            return isSelected ? typography.body1Highlight : typography.body1
        }

        // MARK: - Equatable

        public static func == (lhs: Typography, rhs: Typography) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
