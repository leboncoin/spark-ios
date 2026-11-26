//
//  DotsIndicatorToken+Size.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Size

public extension DotsIndicatorToken {

    /// Contains the theme-independent size values of the DotsIndicator.
    struct Size: Equatable {

        // MARK: - Properties

        /// The ratio between the width of the active dot and its height.
        public let activeDotWidthRatio: CGFloat = 4

        // MARK: - Methods

        /// The height of the dots (active and inactive).
        public func dotHeight(size: DotsIndicatorSize) -> CGFloat {
            return switch size {
            case .small: 4
            case .medium: 8
            case .large: 16
            }
        }

        /// The width of a dot.
        ///
        /// The inactive dot is a circle, the active dot width is its height multiplied by ``activeDotWidthRatio``.
        public func dotWidth(size: DotsIndicatorSize, isActive: Bool) -> CGFloat {
            let height = self.dotHeight(size: size)

            return isActive ? height * self.activeDotWidthRatio : height
        }
    }
}
