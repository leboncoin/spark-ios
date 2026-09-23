//
//  RadioButtonIntentEnvironmentValues.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 23/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var radioButtonIntent: RadioButtonIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkRadioButton``.
    ///
    /// The default value for this property is *RadioButtonIntent.support*.
    func sparkRadioButtonIntent(_ intent: RadioButtonIntent) -> some View {
        self.environment(\.radioButtonIntent, intent)
    }
}
