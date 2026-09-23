//
//  SliderAccessibilityRangeValuesEnvironmentValues.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 10/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var sliderAccessibilityRangeValuesLabel: String?
}

public extension View {

    /// Set the accessibility label for range values content on the ``SparkSlider``.
    ///
    /// The default value for this property is *nil*.
    /// If no min and max range values are setted, this value is ignored.
    func sparkSliderAccessibilityRangeValuesLabel(_ min: String, max: String) -> some View {
        let label = String.accessibilityLabel(min: min, max: max)
        return self.environment(\.sliderAccessibilityRangeValuesLabel, label)
    }
}
