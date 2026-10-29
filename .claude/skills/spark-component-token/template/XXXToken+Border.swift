//
//  XXXToken+Border.swift
//  SparkComponentXXX
//
//  Created by {Firstname Lastname} on DD/MM/YYYY.
//  Copyright © YYYY Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Border

public extension XXXToken {

    /// Contains the border token values of the XXX.
    struct Border: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The border radius of the XXX.
        public var radius: CGFloat {
            return self.theme.border.radius.full
        }

        // MARK: - Methods

        /// The border width of the XXX.
        public func width(isSelected: Bool) -> CGFloat {
            let width = self.theme.border.width

            return isSelected ? width.medium : width.small
        }

        // MARK: - Equatable

        public static func == (lhs: Border, rhs: Border) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
