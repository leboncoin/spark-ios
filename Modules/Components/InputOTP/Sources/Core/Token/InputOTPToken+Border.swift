//
//  InputOTPToken+Border.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Border

public extension InputOTPToken {

    /// Contains the border token values of the InputOTP.
    struct Border: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The border radius of the slot.
        public var slotRadius: CGFloat {
            return self.theme.border.radius.medium
        }

        // MARK: - Methods

        /// The border width of the slot.
        public func slotWidth(onError: Bool, isFocus: Bool) -> CGFloat {
            let width = self.theme.border.width

            return onError || isFocus ? width.medium : width.small
        }

        // MARK: - Equatable

        public static func == (lhs: Border, rhs: Border) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
