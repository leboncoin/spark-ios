//
//  CheckboxIntentEnvironmentValues.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 23/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var checkboxIntent: CheckboxIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkCheckbox``.
    ///
    /// The default value for this property is *CheckboxIntent.support*.
    func sparkCheckboxIntent(_ intent: CheckboxIntent) -> some View {
        self.environment(\.checkboxIntent, intent)
    }
}
