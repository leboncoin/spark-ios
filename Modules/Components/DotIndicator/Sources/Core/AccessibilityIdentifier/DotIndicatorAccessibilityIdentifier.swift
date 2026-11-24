//
//  DotIndicatorAccessibilityIdentifier.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

/// The accessibility identifiers for the dot indicator.
public enum DotIndicatorAccessibilityIdentifier {

    // MARK: - Properties

    /// The accessibility identifiers for the dot indicator view.
    ///
    /// The value is equals to **spark-dot-indicator-view**.
    public static let view = "spark-dot-indicator-view"

    /// The accessibility identifiers for a dot of the dot indicator.
    ///
    /// The value is equals to **spark-dot-indicator-dot-{index}**.
    public static func dot(index: Int) -> String {
        return "spark-dot-indicator-dot-\(index)"
    }
}
