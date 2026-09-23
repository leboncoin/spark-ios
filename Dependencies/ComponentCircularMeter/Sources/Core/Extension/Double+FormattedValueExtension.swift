//
//  Double+FormattedValueExtension.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 01/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

extension Double {

    // MARK: - Properties

    /// Validates and clamps the Double value to be within the valid range [0.0, 1.0].
    ///
    /// This property ensures the value is suitable for use in a circular meter component,
    /// where values represent progress from 0% (0.0) to 100% (1.0).
    ///
    /// - Returns: A clamped value between 0.0 and 1.0 inclusive.
    ///   - If the value is negative, returns 0.0
    ///   - If the value is greater than 1.0, returns 1.0
    ///   - Otherwise, returns the original value
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// let normalValue: Double = 0.70
    /// let validated1 = normalValue.validatedValue // 0.70
    ///
    /// let negativeValue: Double = -0.5
    /// let validated2 = negativeValue.validatedValue // 0.0
    ///
    /// let excessiveValue: Double = 1.5
    /// let validated3 = excessiveValue.validatedValue // 1.0
    /// ```
    var validatedValue: Self {
        return min(max(0, self), 1)
    }

    // MARK: - Methods

    /// Converts the Double value to a percentage string.
    ///
    /// This method assumes the Double value is a decimal representation (0.0 to 1.0)
    /// and converts it to a percentage string (e.g., 0.70 becomes "70%").
    ///
    /// - Parameter maximumFractionDigits: The maximum number of decimal places to display. Defaults to 0.
    /// - Returns: A localized percentage string representation of the value.
    ///
    /// ## Example of usage
    ///
    /// ```swift
    /// let value: Double = 0.70
    /// let percentage = value.toPercentageString() // "70%"
    ///
    /// let preciseValue: Double = 0.7534
    /// let precisePercentage = preciseValue.toPercentageString(maximumFractionDigits: 1) // "75.3%"
    /// ```
    func toPercentageString(maximumFractionDigits: Int = 0) -> String {
        let formatter = NumberFormatter.shared
        return formatter.string(for: self) ?? ""
    }
}
