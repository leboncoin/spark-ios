//
//  AvatarToken+Dims.swift
//  SparkComponentAvatar
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming

// MARK: - Dims

public extension AvatarToken {

    /// Contains the dim token values of the Avatar.
    struct Dims: Equatable {

        // MARK: - Properties

        let theme: any Theme

        // MARK: - Methods

        /// The opacity of the avatar.
        public func opacity(isEnabled: Bool) -> CGFloat {
            let dims = self.theme.dims

            return isEnabled ? dims.none : dims.dim3
        }

        // MARK: - Equatable

        public static func == (lhs: Dims, rhs: Dims) -> Bool {
            return lhs.theme.equals(rhs.theme)
        }
    }
}
