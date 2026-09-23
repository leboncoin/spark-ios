//
//  XXXToken+Border.swift
//  SparkComponentXXX
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Border

public extension XXXToken {

    /// Contains border-related token properties for the XXX component.
    ///
    /// This category depends on the theme, so it exposes a `theme:` initializer
    /// and its properties are plain `CGFloat`, which are natively `Equatable`.
    struct Border: Equatable {

        // MARK: - Properties

        /// The width of the XXX border.
        public let width: CGFloat

        /// The radius of the XXX border.
        public let radius: CGFloat

        // MARK: - Initialization

        /// Creates a Border token with the given theme.
        ///
        /// - Parameter theme: The theme to use for border values.
        public init(theme: any Theme) {
            self.width = theme.border.width.small
            self.radius = theme.border.radius.full
        }
    }
}
