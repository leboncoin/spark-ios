//
//  AvatarToken+Layout.swift
//  SparkComponentAvatar
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Layout

public extension AvatarToken {

    /// Contains the layout token values of the Avatar.
    struct Layout: Equatable {

        // MARK: - Properties

        let theme: any Theme

        /// The padding of the action.
        public var actionPadding: CGFloat {
            return self.theme.layout.spacing.medium
        }

        // MARK: - Equatable

        public static func == (lhs: Layout, rhs: Layout) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
