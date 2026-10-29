//
//  CircularMeterToken+Layout.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Layout

public extension CircularMeterToken {

    /// Contains the layout token values of the CircularMeter.
    struct Layout: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The padding between the gauge stroke and the inside content.
        public var padding: CGFloat {
            return self.theme.layout.spacing.small
        }

        /// The spacing between the gauge and the outside content.
        public var spacing: CGFloat {
            return self.theme.layout.spacing.medium
        }

        // MARK: - Equatable

        public static func == (lhs: Layout, rhs: Layout) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
