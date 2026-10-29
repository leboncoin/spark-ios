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

    /// Contains the layout token values of the Chip.
    struct Layout: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The spacing between the label and the extra content.
        public var extraContentSpacing: CGFloat {
            return self.theme.layout.spacing.medium
        }

        /// The horizontal padding of the chip.
        public var horizontalPadding: CGFloat {
            return 12
        }

        // MARK: - Methods

        /// The spacing between the content and the icon.
        public func spacing(alignment: ChipAlignment) -> CGFloat {
            let spacing = self.theme.layout.spacing

            return switch alignment {
            case .leadingIcon: spacing.small
            case .trailingIcon: spacing.medium
            }
        }

        // MARK: - Equatable

        public static func == (lhs: Layout, rhs: Layout) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
