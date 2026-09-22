//
//  TextLinkIntentEnvironmentValues.swift
//  SparkComponentTextLink
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var textLinkIntent: TextLinkIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkTextLink``.
    ///
    /// The default value for this property is *TextLinkIntent.default*.
    func sparkTextLinkIntent(_ intent: TextLinkIntent) -> some View {
        self.environment(\.textLinkIntent, intent)
    }
}
