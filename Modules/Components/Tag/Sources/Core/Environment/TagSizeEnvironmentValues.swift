//
//  TagSizeEnvironmentValues.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tagSize: TagSize = .default
}

public extension View {

    /// Set the **size** on the ``SparkTag``.
    ///
    /// The default value for this property is *TagSize.medium*.
    func sparkTagSize(_ size: TagSize) -> some View {
        self.environment(\.tagSize, size)
    }
}
