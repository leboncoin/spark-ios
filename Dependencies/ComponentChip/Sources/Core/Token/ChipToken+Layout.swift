//
//  ChipToken+Layout.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Layout

public extension ChipToken {

    /// Contains layout-related properties (spacing and padding) for the Chip component.
    struct Layout: Equatable {

        // MARK: - Properties

        /// The spacing between content and icon when the icon is leading.
        public let spacingWhenLeadingIcon: CGFloat

        /// The spacing between content and icon when the icon is trailing.
        public let spacingWhenTrailingIcon: CGFloat

        /// The spacing between label and extra content.
        public let extraContentSpacing: CGFloat

        /// The horizontal padding.
        public let horizontalPadding: CGFloat = 12

        // MARK: - Initialization

        /// Creates a Layout token with the given theme.
        ///
        /// - Parameter theme: The theme to use for layout values.
        public init(theme: any Theme) {
            let spacing = theme.layout.spacing

            self.spacingWhenLeadingIcon = spacing.small
            self.spacingWhenTrailingIcon = spacing.medium
            self.extraContentSpacing = spacing.medium
        }
    }
}
