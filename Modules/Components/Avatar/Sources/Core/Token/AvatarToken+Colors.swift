//
//  AvatarToken+Colors.swift
//  SparkComponentAvatar
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

// MARK: - Colors

public extension AvatarToken {

    /// Contains the color token values of the Avatar.
    struct Colors: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The border color of the avatar.
        public var border: any ColorToken {
            return self.theme.colors.base.outline
        }

        // MARK: - Methods

        /// The background color of the action.
        public func actionBackground(isPressed: Bool) -> any ColorToken {
            let colors = self.theme.colors

            return isPressed ? colors.states.surfacePressed : colors.base.surface
        }

        /// The tint color of the action.
        public func actionTint(isPressed: Bool) -> any ColorToken {
            let colors = self.theme.colors

            return isPressed ? colors.states.neutralPressed : colors.feedback.neutral
        }

        func background(contentType: AvatarContentType) -> any ColorToken {
            let colors = self.theme.colors

            return switch contentType {
            case .user: colors.base.surfaceInverse
            case .company: colors.feedback.neutralContainer
            }
        }

        func placeholderTint(contentType: AvatarContentType) -> any ColorToken {
            let colors = self.theme.colors

            return switch contentType {
            case .user: colors.base.onSurfaceInverse
            case .company: colors.feedback.onNeutralContainer
            }
        }

        // MARK: - Equatable

        public static func == (lhs: Colors, rhs: Colors) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
