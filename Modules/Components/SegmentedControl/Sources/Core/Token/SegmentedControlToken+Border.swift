//
//  SegmentedControlToken+Border.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Border

public extension SegmentedControlToken {

    /// Contains the border token values of the SegmentedControl.
    struct Border: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The border radius of the segmented control.
        public var radius: CGFloat {
            return Size().minHeight / 2
        }

        /// The border radius of the selected item.
        public var selectedItemRadius: CGFloat {
            return self.radius - self.theme.layout.spacing.small
        }

        /// The border width of the selected item.
        public var selectedItemWidth: CGFloat {
            return self.theme.border.width.small
        }

        /// The border width of the segmented control.
        public var width: CGFloat {
            return self.theme.border.width.small
        }

        // MARK: - Equatable

        public static func == (lhs: Border, rhs: Border) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
