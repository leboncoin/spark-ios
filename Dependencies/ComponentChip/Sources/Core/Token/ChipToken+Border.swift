//
//  ChipToken+Border.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Border

public extension ChipToken {

    /// Contains border-related token properties for the Chip component.
    struct Border: Equatable {

        // MARK: - Properties

        /// The width of the chip border.
        public let width: CGFloat

        /// The radius of the chip border.
        public let radius: CGFloat

        /// The dash length for dashed borders.
        public let dashLength: CGFloat = 2

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
