//
//  DotIndicatorToken+Opacity.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Opacity

public extension DotIndicatorToken {

    /// Contains the opacity token values of the DotIndicator.
    struct Opacity: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The opacity of the dot indicator.
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
