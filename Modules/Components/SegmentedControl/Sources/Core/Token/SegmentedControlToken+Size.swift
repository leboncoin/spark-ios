//
//  SegmentedControlToken+Size.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Size

public extension SegmentedControlToken {

    /// Contains the theme-independent size values of the SegmentedControl.
    struct Size: Equatable {

        // MARK: - Properties

        /// The width and height of an item icon.
        public var icon: CGFloat {
            return 16
        }

        /// The minimum height of the segmented control.
        public var minHeight: CGFloat {
            return 44
        }

        /// The height of the vertical separator between the items.
        public var separatorHeight: CGFloat {
            return 24
        }

        /// The thickness of the separators between the items.
        public var separatorWidth: CGFloat {
            return 1
        }
    }
}
