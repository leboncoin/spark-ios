//
//  ProgressBarIntentEnvironmentValues.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 17/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var progressBarIntent: ProgressBarIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkProgressBar``.
    ///
    /// The default value for this property is *ProgressBarIntent.default*.
    func sparkProgressBarIntent(_ intent: ProgressBarIntent) -> some View {
        self.environment(\.progressBarIntent, intent)
    }
}
