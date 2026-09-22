//
//  TabIntentEnvironmentValues.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 23/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var tabIntent: TabIntent = .default
}

public extension View {

    /// Set the **intent** on the Tab.
    ///
    /// The default value for this property is *TabIntent.default*.
    func sparkTabIntent(_ intent: TabIntent) -> some View {
        self.environment(\.tabIntent, intent)
    }
}
