//
//  SegmentedControlToken+Animation.swift
//  SparkComponentSegmentedControl
//
//  Created by Robin Lemaire on 25/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - Animation

public extension SegmentedControlToken {

    /// Contains the theme-independent animation values of the SegmentedControl.
    struct Animation: Equatable {

        // MARK: - Properties

        /// The duration of the animation applied when the selection or the pressed state changes is 150ms.
        public let selectionDuration: TimeInterval = 0.15

        /// The animation applied when the selection or the pressed state changes (ease in out, ``selectionDuration``).
        public var selection: SwiftUI.Animation {
            .easeInOut(duration: self.selectionDuration)
        }
    }
}
