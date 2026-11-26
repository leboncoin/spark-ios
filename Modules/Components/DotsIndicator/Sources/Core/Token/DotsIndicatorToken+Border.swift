//
//  DotsIndicatorToken+Border.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Border

public extension DotsIndicatorToken {

    /// Contains the border token values of the DotsIndicator.
    struct Border: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The radius of the dots (active and inactive).
        public var radius: CGFloat {
            return self.theme.border.radius.full
        }

        // MARK: - Equatable

        public static func == (lhs: Border, rhs: Border) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
