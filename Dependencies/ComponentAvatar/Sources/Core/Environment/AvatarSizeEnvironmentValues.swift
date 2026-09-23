//
//  AvatarSizeEnvironmentValues.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var avatarSize: AvatarSize = .default
}

public extension View {

    /// Set the **size** on the ``SparkCompanyAvatar`` or  ``SparkUserAvatar``.
    ///
    /// The default value for this property is *AvatarSize.default*.
    func sparkAvatarSize(_ size: AvatarSize) -> some View {
        self.environment(\.avatarSize, size)
    }
}
