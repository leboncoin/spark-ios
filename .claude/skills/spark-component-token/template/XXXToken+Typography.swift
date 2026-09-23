//
//  XXXToken+Typography.swift
//  SparkComponentXXX
//
//  Created by robin.lemaire on 09/09/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Typography

public extension XXXToken {

    /// Contains typography token for the XXX component.
    ///
    /// This category holds an `any TypographyFontToken` existential, which is not
    /// natively `Equatable`, so it requires a manual `==` implementation using `.equals()`.
    struct Typography: Equatable {

        // MARK: - Properties

        /// The font token for the XXX title.
        public let titleFont: any TypographyFontToken

        // MARK: - Initialization

        /// Creates a Typography token with the given theme.
        ///
        /// - Parameter theme: The theme to use for typography values.
        public init(theme: any Theme) {
            self.titleFont = theme.typography.body1
        }

        // MARK: - Equatable

        public static func == (lhs: Typography, rhs: Typography) -> Bool {
            return lhs.titleFont.equals(rhs.titleFont)
        }
    }
}
