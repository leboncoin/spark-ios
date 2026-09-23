//
//  SliderIsFloatingValueLabelEnvironmentValues.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 06/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var sliderIsFloatingValueLabel: Bool = false
}

public extension View {

    /// Set the **isFloatingValueLabel** on the ``SparkSlider``.
    ///
    /// The default value for this property is *false*.
    ///
    /// If **true** and if the **ValueLabel** is not an EmptyView, the label will be displayed always above the thumb.
    func sparkSliderIsFloatingValueLabel(_ isFloatingValueLabel: Bool) -> some View {
        self.environment(\.sliderIsFloatingValueLabel, isFloatingValueLabel)
    }
}
