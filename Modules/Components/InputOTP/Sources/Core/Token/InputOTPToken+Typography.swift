//
//  InputOTPToken+Typography.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Typography

public extension InputOTPToken {

    /// Contains the typography token values of the InputOTP.
    struct Typography: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The font token of the slot content.
        public var content: any TypographyFontToken {
            return self.theme.typography.display3
        }

        // MARK: - Equatable

        public static func == (lhs: Typography, rhs: Typography) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
