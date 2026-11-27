//
//  DotsIndicatorAccessibilityIdentifier.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

/// The accessibility identifiers for the dots indicator.
public enum DotsIndicatorAccessibilityIdentifier {

    // MARK: - Properties

    /// The accessibility identifiers for the dots indicator view.
    ///
    /// The value is equals to **spark-dots-indicator-view**.
    public static let view = "spark-dots-indicator-view"

    /// The accessibility identifiers for a dot of the dots indicator.
    ///
    /// The value is equals to **spark-dots-indicator-dot-{index}**.
    public static func dot(index: Int) -> String {
        return "spark-dots-indicator-dot-\(index)"
    }
}
