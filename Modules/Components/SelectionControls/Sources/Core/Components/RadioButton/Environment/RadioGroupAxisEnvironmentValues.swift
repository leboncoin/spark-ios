//
//  RadioGroupAxisEnvironmentValues.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 23/07/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var radioGroupAxis: RadioGroupAxis = .default
}

public extension View {

    /// Set the **axis** on the ``SparkRadioGroup``.
    ///
    /// The default value for this property is *RadioGroupAxis.vertical*.
    func sparkRadioGroupAxis(_ axis: RadioGroupAxis) -> some View {
        self.environment(\.radioGroupAxis, axis)
    }
}
