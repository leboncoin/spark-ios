//
//  DotsIndicatorToken+Colors.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Colors

public extension DotsIndicatorToken {

    /// Contains the color token values of the DotsIndicator.
    struct Colors: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The color of a dot.
        ///
        /// - Parameters:
        ///   - intent: The intent of the dots indicator.
        ///   - isActive: Whether the dot is the active (current page) dot.
        public func dot(intent: DotsIndicatorIntent, isActive: Bool) -> any ColorToken {
            let colors = self.theme.colors

            let color: any ColorToken = switch intent {
            case .support: colors.support.support
            case .surface: colors.base.surface
            }

            return isActive ? color : color.opacity(self.theme.dims.dim2)
        }

        /// The color of the background displayed during the long press.
        ///
        /// - Parameters:
        ///   - intent: The intent of the dots indicator.
        public func longPressBackground(intent: DotsIndicatorIntent) -> any ColorToken {
            return self.dot(intent: intent, isActive: true).opacity(self.theme.dims.dim4)
        }

        // MARK: - Equatable

        public static func == (lhs: Colors, rhs: Colors) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
