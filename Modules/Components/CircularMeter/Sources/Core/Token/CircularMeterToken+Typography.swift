//
//  CircularMeterToken+Typography.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Typography

public extension CircularMeterToken {

    /// Contains the typography token values of the CircularMeter.
    struct Typography: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The font token of the content label.
        public func content(size: CircularMeterSize) -> any TypographyFontToken {
            let typography = self.theme.typography

            return switch size {
            case .small, .medium: typography.small
            case .large: typography.caption
            case .xLarge: typography.body2
            }
        }

        /// The font token of the value label.
        public func value(size: CircularMeterSize) -> any TypographyFontToken {
            let typography = self.theme.typography

            return switch size {
            case .small, .medium: typography.body2Highlight
            case .large: typography.body1Highlight
            case .xLarge: typography.display3
            }
        }

        // MARK: - Equatable

        public static func == (lhs: Typography, rhs: Typography) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
