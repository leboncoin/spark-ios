//
//  DotIndicatorToken+Layout.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Layout

public extension DotIndicatorToken {

    /// Contains the layout token values of the DotIndicator.
    struct Layout: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The spacing between the dots.
        public func spacing(size: DotIndicatorSize) -> CGFloat {
            let spacing = self.theme.layout.spacing

            return switch size {
            case .small: spacing.small
            case .medium: spacing.medium
            case .large: spacing.large
            }
        }

        // MARK: - Equatable

        public static func == (lhs: Layout, rhs: Layout) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
