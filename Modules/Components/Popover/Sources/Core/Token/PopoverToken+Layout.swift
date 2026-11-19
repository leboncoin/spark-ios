//
//  PopoverToken+Layout.swift
//  SparkComponentPopover
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Layout

public extension PopoverToken {

    /// Contains the layout token values of the Popover.
    struct Layout: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The horizontal padding of the popover content.
        public var horizontalPadding: CGFloat {
            return self.theme.layout.spacing.xLarge
        }

        /// The vertical padding of the popover content.
        public var verticalPadding: CGFloat {
            return self.theme.layout.spacing.large
        }

        // MARK: - Equatable

        public static func == (lhs: Layout, rhs: Layout) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
