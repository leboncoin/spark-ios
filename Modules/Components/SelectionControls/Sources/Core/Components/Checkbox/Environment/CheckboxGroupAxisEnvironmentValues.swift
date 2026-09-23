//
//  CheckboxGroupAxisEnvironmentValues.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 23/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var checkboxGroupAxis: CheckboxGroupAxis = .default
}

public extension View {

    /// Set the **axis** on the ``SparkCheckboxGroup``.
    ///
    /// The default value for this property is *CheckboxGroupAxis.vertical*.
    func sparkCheckboxGroupAxis(_ axis: CheckboxGroupAxis) -> some View {
        self.environment(\.checkboxGroupAxis, axis)
    }
}
