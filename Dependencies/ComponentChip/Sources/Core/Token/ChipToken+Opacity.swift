//
//  ChipToken+Opacity.swift
//  SparkComponentChip
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Opacity

public extension ChipToken {

    /// Contains opacity values based on the chip's state.
    struct Opacity: Equatable {

        // MARK: - Properties

        /// The opacity value when the chip is enabled.
        public let whenEnabled: CGFloat

        /// The opacity value when the chip is disabled.
        public let whenDisabled: CGFloat

        // MARK: - Initialization

        /// Creates an Opacity token with the given theme.
        ///
        /// - Parameter theme: The theme to use for opacity values.
        public init(theme: any Theme) {
            self.whenEnabled = theme.dims.none
            self.whenDisabled = theme.dims.dim3
        }
    }
}
