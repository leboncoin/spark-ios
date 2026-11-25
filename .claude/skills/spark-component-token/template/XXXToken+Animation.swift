//
//  XXXToken+Animation.swift
//  SparkComponentXXX
//
//  Created by {Firstname Lastname} on DD/MM/YYYY.
//  Copyright © YYYY Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - Animation

public extension XXXToken {

    /// Contains the theme-independent animation values of the XXX.
    ///
    /// The durations can be used by the UIKit views (`UIView.animate(withDuration:)`),
    /// the animations by the SwiftUI views (`.animation(_:value:)`, `withAnimation(_:)`).
    struct Animation: Equatable {

        // MARK: - Properties

        /// The duration of the fast animation is 100ms.
        public let fastDuration: TimeInterval = 0.1

        /// The duration of the slow animation is 300ms.
        public let slowDuration: TimeInterval = 0.3

        /// The fast animation (ease in out, ``fastDuration``).
        public var fast: SwiftUI.Animation {
            .easeInOut(duration: self.fastDuration)
        }

        /// The slow animation (ease in out, ``slowDuration``).
        public var slow: SwiftUI.Animation {
            .easeInOut(duration: self.slowDuration)
        }
    }
}
