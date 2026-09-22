//
//  IconIntentEnvironmentValues.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 06/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var iconIntent: IconIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkIcon``.
    ///
    /// The default value for this property is *IconIntent.default*.
    func sparkIconIntent(_ intent: IconIntent) -> some View {
        self.environment(\.iconIntent, intent)
    }
}
