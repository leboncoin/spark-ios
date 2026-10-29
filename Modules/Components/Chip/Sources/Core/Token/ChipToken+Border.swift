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

    /// Contains the border token values of the Chip.
    struct Border: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The width of the chip border.
        public var width: CGFloat {
            return self.theme.border.width.small
        }

        /// The radius of the chip border.
        public var radius: CGFloat {
            return self.theme.border.radius.full
        }

        // MARK: - Methods

        /// The dash length of the chip border. Zero when the variant isn't dashed.
        public func dash(variant: ChipVariant) -> CGFloat {
            return variant == .dashed ? 2 : .zero
        }

        // MARK: - Equatable

        public static func == (lhs: Border, rhs: Border) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
