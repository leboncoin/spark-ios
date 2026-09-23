//
//  InputOTPConstants.swift
//  SparkComponentInputOTP
//
//  Created by robin.lemaire on 03/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

enum InputOTPConstants {

    // MARK: - Size

    enum Size {
        /// Slot width is 40px
        static let width: CGFloat = 40
        /// Slot height is 50px
        static let height: CGFloat = 50
    }

    // MARK: - Separator Size

    enum SeparatorSize {
        /// Separator width is 40px
        static let width: CGFloat = 8
        /// Separator height is 50px
        static let height: CGFloat = 4
    }

    // MARK: - Content

    enum Content {
        /// Empty slot content
        static let empty = "-"
        /// Focus slot content
        static let focus = "|"
    }
}
