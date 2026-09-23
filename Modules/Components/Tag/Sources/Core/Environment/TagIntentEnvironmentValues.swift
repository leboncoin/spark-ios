//
//  TagIntentEnvironmentValues.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tagIntent: TagIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkTag``.
    ///
    /// The default value for this property is *TagIntent.main*.
    func sparkTagIntent(_ intent: TagIntent) -> some View {
        self.environment(\.tagIntent, intent)
    }
}
