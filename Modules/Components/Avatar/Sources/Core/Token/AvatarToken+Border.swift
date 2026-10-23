//
//  AvatarToken+Border.swift
//  SparkComponentAvatar
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Border

public extension AvatarToken {

    /// Contains the border token values of the Avatar.
    struct Border: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The border width of the avatar.
        public func width(isBorder: Bool, size: AvatarSize) -> CGFloat {
            let width = self.theme.border.width

            guard isBorder else {
                return width.none
            }

            return switch size {
            case .xs, .sm, .md: width.small
            case .lg, .xl, .xxl, .xxxl: width.medium
            }
        }

        func radius(contentType: AvatarContentType) -> CGFloat {
            let radius = self.theme.border.radius

            return switch contentType {
            case .user: radius.full
            case .company: radius.medium
            }
        }

        // MARK: - Equatable

        public static func == (lhs: Border, rhs: Border) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
