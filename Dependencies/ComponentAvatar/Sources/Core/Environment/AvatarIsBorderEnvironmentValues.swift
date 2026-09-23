//
//  AvatarIsBorderEnvironmentValues.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var avatarIsBorder: Bool = false
}

public extension View {

    /// Set the **is border** on the ``SparkCompanyAvatar`` or  ``SparkUserAvatar``.
    ///
    /// The default value for this property is *false*.
    func sparkAvatarIsBorder(_ isBorder: Bool) -> some View {
        self.environment(\.avatarIsBorder, isBorder)
    }
}
