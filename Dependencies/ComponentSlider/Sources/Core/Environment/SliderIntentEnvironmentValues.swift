//
//  SliderIntentEnvironmentValues.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var sliderIntent: SliderIntent = .default
}

public extension View {

    /// Set the **intent** on the ``SparkSlider``.
    ///
    /// The default value for this property is *SliderIntent.default*.
    func sparkSliderIntent(_ intent: SliderIntent) -> some View {
        self.environment(\.sliderIntent, intent)
    }
}
