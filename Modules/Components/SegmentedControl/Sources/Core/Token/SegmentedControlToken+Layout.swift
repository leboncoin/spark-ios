//
//  SegmentedControlToken+Layout.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Layout

public extension SegmentedControlToken {

    /// Contains the layout token values of the SegmentedControl.
    struct Layout: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The horizontal padding of the accessibility list.
        public var accessibilityHorizontalPadding: CGFloat {
            return self.theme.layout.spacing.large
        }

        /// The vertical padding of the accessibility list.
        public var accessibilityVerticalPadding: CGFloat {
            return self.theme.layout.spacing.medium
        }

        /// The padding of an item.
        public var itemPadding: CGFloat {
            return self.theme.layout.spacing.medium
        }

        /// The spacing between the icon and the text of an item.
        public var itemSpacing: CGFloat {
            return self.theme.layout.spacing.medium
        }

        /// The padding around the items.
        public var padding: CGFloat {
            return self.theme.layout.spacing.small
        }

        /// The spacing between the items.
        public var spacing: CGFloat {
            return self.theme.layout.spacing.small
        }

        // MARK: - Equatable

        public static func == (lhs: Layout, rhs: Layout) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
