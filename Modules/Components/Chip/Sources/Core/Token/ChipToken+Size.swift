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

    /// Contains size-related constants for the Chip component.
    struct Size: Equatable {

        // MARK: - Properties

        /// The height for a medium-sized chip.
        public let mediumHeight: CGFloat = 32

        /// The height for a large-sized chip.
        public let largeHeight: CGFloat = 40

        /// The size of the icon within the chip.
        public let iconSize: CGFloat = 16

        // MARK: - Initialization

        /// Creates a Size token.
        public init() {}
    }
}
