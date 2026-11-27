//
//  DotsIndicatorToken+Animation.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 25/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - Animation

public extension DotsIndicatorToken {

    /// Contains the theme-independent animation values of the DotsIndicator.
    struct Animation: Equatable {

        // MARK: - Properties

        /// The duration of the animation applied when the active dot changes is 250ms.
        public let activeDotDuration: TimeInterval = 0.25

        /// The animation applied when the active dot changes (ease in out, ``activeDotDuration``).
        public var activeDot: SwiftUI.Animation {
            .easeInOut(duration: self.activeDotDuration)
        }
    }
}
