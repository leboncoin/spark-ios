//
//  InputOTPToken+Size.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Size

public extension InputOTPToken {

    /// Contains the theme-independent size values of the InputOTP.
    struct Size: Equatable {

        // MARK: - Properties

        /// The width of the slot.
        public let slotWidth: CGFloat = 40

        /// The height of the slot.
        public let slotHeight: CGFloat = 50

        /// The width of the separator.
        public let separatorWidth: CGFloat = 8

        /// The height of the separator.
        public let separatorHeight: CGFloat = 4
    }
}
