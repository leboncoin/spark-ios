//
//  AvatarToken+ScaleEffect.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 22/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

// MARK: - Scale Effect

public extension AvatarToken {

    /// Contains the theme-independent scale effect values of the Avatar.
    struct ScaleEffect: Equatable {

        // MARK: - Methods

        /// The scale effect of the avatar. One when not pressed.
        public func value(for size: AvatarSize, isPressed: Bool) -> CGFloat {
            guard isPressed else {
                return 1.0
            }

            return switch size {
            case .xs, .sm, .md, .lg: 1.1
            case .xl: 1.07
            case .xxl, .xxxl: 1.05
            }
        }
    }
}
