//
//  InputOTPToken+Animation.swift
//  SparkComponentInputOTP
//
//  Created by Robin Lemaire on 25/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - Animation

public extension InputOTPToken {

    /// Contains the theme-independent animation values of the InputOTP.
    struct Animation: Equatable {

        // MARK: - Properties

        /// The duration of the animation of the cursor blink on the focused slot is 500ms.
        public let cursorBlinkDuration: TimeInterval = 0.5
    }
}
