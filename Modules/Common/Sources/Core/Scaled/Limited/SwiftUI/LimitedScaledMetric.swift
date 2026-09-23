//
//  LimitedScaledMetric.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

/// A dynamic property that scales a CGFloat value but a min and max range
/// is applied to limit the increase and decrease value modification.
///
/// Example usage:
/// ```swift
/// @LimitedScaledMetric private var radius: CGFloat = 12
///
/// var body: some View {
///     Rectangle()
///         .cornerRadius(self.radius)
/// ```
/// Other example
///
/// ```swift
/// @LimitedScaledMetric private var radius: CGFloat
///
/// init() {
///     self._radius = .init(
///         value: 14,
///         minFactor: 0.9,
///         maxFactor: 1.1
///     )
/// }
///
/// var body: some View {
///     Rectangle()
///         .cornerRadius(self.radius)
/// ```
@propertyWrapper public struct LimitedScaledMetric: DynamicProperty {

    // MARK: - Public Properties

    /// The scaled value constrained between minValue and maxValue.
    /// If the scaled value is less than minValue, returns minValue.
    /// If the scaled value is greater than maxValue, returns maxValue.
    /// Otherwise, returns the scaled value.
    public var wrappedValue: CGFloat {
        get {
            if self.value < self.minValue {
                self.minValue
            } else if self.value > self.maxValue {
                self.maxValue
            } else {
                self.value
            }
        }
    }

    // MARK: - Private Properties

    @ScaledMetric private var value: CGFloat
    private let unscaledValue: CGFloat
    private let minValue: CGFloat
    private let maxValue: CGFloat

    // MARK: - Initialization

    /// Initializes a new LimitedScaledMetric with explicit min and max values.
    ///
    /// - Parameters:
    ///   - value: The base value to scale.
    ///   - minValue: The minimum allowed value after scaling.
    ///   - maxValue: The maximum allowed value after scaling.
    ///   - relativeTo: Optional text style to scale relative to. If nil, scales relative to the default text style.
    public init(
        value: CGFloat,
        minValue: CGFloat,
        maxValue: CGFloat,
        relativeTo: Font.TextStyle? = nil
    ) {
        if let relativeTo {
            self._value = .init(wrappedValue: value, relativeTo: relativeTo)
        } else {
            self._value = .init(wrappedValue: value)
        }

        self.unscaledValue = value
        self.minValue = minValue
        self.maxValue = maxValue
    }

    /// Initializes a new LimitedScaledMetric with min and max factors applied to the base value.
    ///
    /// - Parameters:
    ///   - value: The base value to scale.
    ///   - minFactor: The factor to multiply the base value by to get the minimum allowed value.
    ///   - maxFactor: The factor to multiply the base value by to get the maximum allowed value.
    ///   - relativeTo: Optional text style to scale relative to. If nil, scales relative to the default text style.
    public init(
        value: CGFloat,
        minFactor: CGFloat,
        maxFactor: CGFloat,
        relativeTo: Font.TextStyle? = nil
    ) {
        self.init(
            value: value,
            minValue: value * minFactor,
            maxValue: value * maxFactor,
            relativeTo: relativeTo
        )
    }

    /// Initializes a new LimitedScaledMetric with default min and max factors.
    ///
    /// - Parameters:
    ///   - value: The base value to scale.
    ///   - relativeTo: Optional text style to scale relative to. If nil, scales relative to the default text style.
    ///
    /// This initializer uses the default factors defined in `LimitedScaledMetricConstants.
    public init(
        value: CGFloat,
        relativeTo: Font.TextStyle? = nil
    ) {
        self.init(
            value: value,
            minValue: value * LimitedScaledMetricConstants.minValueFactor,
            maxValue: value * LimitedScaledMetricConstants.maxValueFactor,
            relativeTo: relativeTo
        )
    }

    // MARK: - Methods

    public func value(scaled: Bool) -> CGFloat {
        return scaled ? self.wrappedValue : self.unscaledValue
    }
}
