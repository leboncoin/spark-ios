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

    /// Contains the opacity token values of the Chip.
    struct Opacity: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The opacity of the chip.
        public func value(isEnabled: Bool) -> CGFloat {
            let dims = self.theme.dims

            return isEnabled ? dims.none : dims.dim3
        }

        // MARK: - Equatable

        public static func == (lhs: Opacity, rhs: Opacity) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
