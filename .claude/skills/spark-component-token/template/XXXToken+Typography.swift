//
//  XXXToken+Typography.swift
//  SparkComponentXXX
//
//  Created by {Firstname Lastname} on DD/MM/YYYY.
//  Copyright © YYYY Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Typography

public extension XXXToken {

    /// Contains the typography token values of the XXX.
    struct Typography: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The font token of the title.
        public var title: any TypographyFontToken {
            return self.theme.typography.body1
        }

        // MARK: - Equatable

        public static func == (lhs: Typography, rhs: Typography) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
