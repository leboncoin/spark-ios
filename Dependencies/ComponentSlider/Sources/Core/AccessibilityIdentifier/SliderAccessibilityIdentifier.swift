//
//  SliderAccessibilityIdentifier.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// The accessibility identifiers for the slider.
public enum SliderAccessibilityIdentifier {

    // MARK: - Properties

    /// The slider accessibility identifier.
    public static let view = "spark-slider"

    @available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
    /// The slider accessibility identifier.
    public static let slider = "spark-slider"

    /// The native slider inside the spark slider accessibility identifier.
    public static let sliderContent = "spark-slider-content"
}
