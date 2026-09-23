//
//  AvatarActionTypeEnvironmentValues.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 02/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var avatarActionType: AvatarActionType?
}

public extension View {

    /// Set the **action type** on the ``SparkCompanyAvatar`` or  ``SparkUserAvatar``.
    ///
    /// The default value for this property is *nil*.
    func sparkAvatarActionType(_ actionType: AvatarActionType?) -> some View {
        self.environment(\.avatarActionType, actionType)
    }
}
