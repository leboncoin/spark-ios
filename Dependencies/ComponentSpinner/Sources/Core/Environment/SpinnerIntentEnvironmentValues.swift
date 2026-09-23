//
//  SpinnerIntentEnvironmentValues.swift
//  SparkComponentSpinner
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var spinnerIntent: SpinnerIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkSpinner``.
    ///
    /// The default value for this property is *SpinnerIntent.default*.
    func sparkSpinnerIntent(_ intent: SpinnerIntent) -> some View {
        self.environment(\.spinnerIntent, intent)
    }
}
