//
//  PopoverToken+Colors.swift
//  SparkComponentPopover
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Colors

public extension PopoverToken {

    /// Contains the color token values of the Popover.
    struct Colors: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The foreground color of the popover content.
        public func foreground(intent: PopoverIntent) -> any ColorToken {
            let colors = self.theme.colors
            return switch intent {
            case .surface: colors.base.onSurface
            default: colors.feedback.info
            }
        }

        // MARK: - Equatable

        public static func == (lhs: Colors, rhs: Colors) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
