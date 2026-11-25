//
//  AvatarToken+Animation.swift
//  SparkComponentAvatar
//
//  Created by Robin Lemaire on 25/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - Animation

public extension AvatarToken {

    /// Contains the theme-independent animation values of the Avatar.
    struct Animation: Equatable {

        // MARK: - Properties

        /// The duration of the animation applied when the avatar is pressed is 150ms.
        public let pressedDuration: TimeInterval = 0.15

        /// The animation applied when the avatar is pressed (ease in out, ``pressedDuration``).
        public var pressed: SwiftUI.Animation {
            .easeInOut(duration: self.pressedDuration)
        }
    }
}
