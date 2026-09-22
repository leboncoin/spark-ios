//
//  IconSizeEnvironmentValues.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var iconSize: IconSize = .default
}

public extension View {

    /// Set the **size** on the ``SparkIcon``.
    ///
    /// The default value for this property is *IconSize.default*.
    func sparkIconSize(_ size: IconSize) -> some View {
        self.environment(\.iconSize, size)
    }
}
