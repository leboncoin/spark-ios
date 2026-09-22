//
//  SliderIntent.swift
//  SparkComponentSlider
//
//  Created by robin.lemaire on 21/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

/// `SliderIntent` is the intent of the slider.
public enum SliderIntent: CaseIterable {
    case accent
    case main
    case support

    @available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
    case alert
    @available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
    case error
    @available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
    case info
    @available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
    case neutral
    @available(*, deprecated, message: "Not used anymore by SparkSlider or SparkUISlider")
    case success

    // MARK: - Properties

    /// The default case. Equals to **.support**.
    public static let `default`: Self = .support

    public static var allCases: [SliderIntent] = [
        .accent,
        .main,
        .support
    ]
}
