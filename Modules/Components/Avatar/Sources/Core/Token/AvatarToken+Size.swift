//
//  AvatarToken+Size.swift
//  SparkComponentAvatar
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkComponentBadge

// MARK: - Size

public extension AvatarToken {

    /// Contains the theme-independent size values of the Avatar.
    struct Size: Equatable {

        // MARK: - Methods

        /// The width and height of the avatar.
        public func value(for size: AvatarSize) -> CGFloat {
            return switch size {
            case .xs: 24
            case .sm: 32
            case .md: 40
            case .lg: 56
            case .xl: 64
            case .xxl: 96
            case .xxxl: 128
            }
        }

        /// The width and height of the placeholder.
        public func placeholder(for size: AvatarSize) -> CGFloat {
            return switch size {
            case .xs: 16
            case .sm: 24
            case .md: 32
            case .lg: 48
            case .xl: 56
            case .xxl: 88
            case .xxxl: 120
            }
        }

        /// The width and height of the action. Zero when the size doesn't support an action.
        public func action(for size: AvatarSize) -> CGFloat {
            return switch size {
            case .xxl, .xxxl: 32
            default: .zero
            }
        }

        /// The size of the corner badge.
        public func badge(for size: AvatarSize) -> BadgeSize {
            return switch size {
            case .xs, .sm, .md: .small
            case .lg, .xl, .xxl, .xxxl: .medium
            }
        }
    }
}
