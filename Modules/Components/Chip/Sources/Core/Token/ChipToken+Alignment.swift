//
//  ChipToken+Alignment.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Alignment

public extension ChipToken {

    /// Contains the theme-independent alignment values of the Chip.
    struct Alignment: Equatable {

        // MARK: - Methods

        /// Whether the icon and the title are displayed in reversed order (icon first).
        public func isReversed(for alignment: ChipAlignment) -> Bool {
            return switch alignment {
            case .leadingIcon: true
            case .trailingIcon: false
            }
        }
    }
}
