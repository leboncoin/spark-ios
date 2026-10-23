//
//  ComponentToken+Avatar.swift
//  SparkComponentAvatar
//
//  Created by Robin Lemaire on 23/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SparkTheming

public extension ComponentToken {

    /// The token values of the Avatar component derived from the theme.
    var avatar: AvatarToken {
        return .init(theme: self.theme)
    }
}
