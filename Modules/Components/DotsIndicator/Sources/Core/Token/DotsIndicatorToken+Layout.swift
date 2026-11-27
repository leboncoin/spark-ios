//
//  DotsIndicatorToken+Layout.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming

// MARK: - Layout

public extension DotsIndicatorToken {

    /// Contains the layout token values of the DotsIndicator.
    struct Layout: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The spacing between the dots.
        public func spacing(size: DotsIndicatorSize) -> CGFloat {
            let spacing = self.theme.layout.spacing

            return switch size {
            case .small: spacing.small
            case .medium: spacing.medium
            case .large: spacing.large
            }
        }

        /// The padding of the background displayed during the long press.
        /// The values are **negative**: the background is drawn outside the dots without changing the layout.
        public func longPressBackgroundPadding(size: DotsIndicatorSize) -> EdgeInsets {
            let horizontal = -self.theme.layout.spacing.medium
            let vertical = -self.spacing(size: size)

            return .init(
                top: vertical,
                leading: horizontal,
                bottom: vertical,
                trailing: horizontal
            )
        }

        /// The scale of the dots indicator during the long press.
        public var longPressScale: CGFloat {
            1.2
        }

        // MARK: - Equatable

        public static func == (lhs: Layout, rhs: Layout) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
