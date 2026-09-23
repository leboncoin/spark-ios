//
//  ProgressBarAccessibilityIdentifier.swift
//  SparkComponentProgressBar
//
//  Created by robin.lemaire on 20/09/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

/// The accessibility identifiers for the progressBar.
public enum ProgressBarAccessibilityIdentifier {

    // MARK: - Properties

    /// The content view accessibility identifier.
    public static let view = "spark-progress-bar"

    /// The content view accessibility identifier.
    public static let contentView = "spark-progressBar-contentView"

    /// The progress bar accessibility identifier.
    @available(*, deprecated, message: "Not used anymore by the new SparkProgressBar or SparkUIProgressBar")
    public static let progressBar = "spark-progress-bar"

    /// The indicator view accessibility identifier.
    public static let indicatorView = "spark-progressBar-indicatorView"
    /// The bottom indicator view accessibility identifier. Only used with progress bar double
    public static let bottomIndicatorView = "spark-progressBar-bottomIndicatorView"
}
