//
//  ChipToken+Size.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Size

public extension ChipToken {

    /// Contains the theme-independent size values of the Chip.
    struct Size: Equatable {

        // MARK: - Properties

        /// The width and height of the icon.
        public var icon: CGFloat {
            return 16
        }

        // MARK: - Methods

        /// The height of the chip.
        public func height(for size: ChipSize) -> CGFloat {
            return switch size {
            case .medium: 32
            case .large: 40
            }
        }
    }
}
