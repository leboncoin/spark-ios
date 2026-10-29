//
//  InputOTPToken+Layout.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Layout

public extension InputOTPToken {

    /// Contains the layout token values of the InputOTP.
    struct Layout: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The spacing between the slots.
        public var spacing: CGFloat {
            return self.theme.layout.spacing.medium
        }

        /// The padding around the slots.
        public var padding: CGFloat {
            return self.theme.layout.spacing.medium
        }

        // MARK: - Equatable

        public static func == (lhs: Layout, rhs: Layout) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
