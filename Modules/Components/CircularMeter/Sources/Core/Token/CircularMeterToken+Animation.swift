//
//  CircularMeterToken+Animation.swift
//  SparkComponentCircularMeter
//
//  Created by Robin Lemaire on 25/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - Animation

public extension CircularMeterToken {

    /// Contains the theme-independent animation values of the CircularMeter.
    struct Animation: Equatable {

        // MARK: - Properties

        /// The duration of the animation applied when the value changes is 300ms.
        public let valueDuration: TimeInterval = 0.3

        /// The animation applied when the value changes (ease out, ``valueDuration``).
        public var value: SwiftUI.Animation {
            .easeOut(duration: self.valueDuration)
        }
    }
}
