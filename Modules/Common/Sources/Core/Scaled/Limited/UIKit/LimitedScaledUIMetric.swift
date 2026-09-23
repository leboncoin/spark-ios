//
//  LimitedScaledUIMetric.swift
//  SparkCommon
//
//  Created by robin.lemaire on 11/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

/// LimitedScaledUIMetric is a property wrapper for UIKit. It scales values according
/// to the current trait collection content size with also a min and max value
/// management to limits the frame.
/// This property wrapper is used by others in this package : `ScaledUIBorderRadius`, `ScaledUIBorderWidth` and `ScaledUIPadding`
@propertyWrapper public struct LimitedScaledUIMetric: ScaledUIMetricable {

    // MARK: - Public Properties

    /// Returns the scaled value for the `baseValue` according to the trait collection. When setting this property a new baseValue is set.
    public var wrappedValue: CGFloat {
        get {
            return self.scaledValue(for: self.traitCollection)
        }
        set {
            self.baseValue = newValue
        }
    }

    // MARK: - Private/Internal Properties

    private var baseValue: CGFloat
    private var minValue: CGFloat
    private var maxValue: CGFloat

    /// The font metrics the scaling is based on.
    private let metrics: UIFontMetrics

    /// The trait collection used for the scaling operation. The default value is nil, which means the current trait collection will be used (`UITraitCollection.current`).
    private var traitCollection: UITraitCollection?

    // MARK: - Initialization

    /// Initializes a new LimitedScaledUIMetric with specific min and max limits values.
    /// - Parameters:
    ///   - baseValue: The base value to scale
    ///   - minValue: The minimum allowed value after scaling
    ///   - maxValue: The maximum allowed value after scaling
    ///   - metrics: The font metrics to use for scaling
    ///   - traitCollection: Optional trait collection to use for scaling (defaults to current if nil)
    public init(
        wrappedValue baseValue: CGFloat,
        minValue: CGFloat,
        maxValue: CGFloat,
        relativeTo metrics: UIFontMetrics,
        traitCollection: UITraitCollection? = nil
    ) {
        self.baseValue = baseValue
        self.minValue = minValue
        self.maxValue = maxValue
        self.metrics = metrics
        self.traitCollection = traitCollection
    }

    /// Initializes a new LimitedScaledUIMetric with specific min and max limits values.
    /// - Parameters:
    ///   - baseValue: The base value to scale
    ///   - minValue: The minimum allowed value after scaling
    ///   - maxValue: The maximum allowed value after scaling
    ///   - textStyle: The text style to create font metrics from (defaults to .body)
    ///   - traitCollection: Optional trait collection to use for scaling (defaults to current if nil)
    public init(
        wrappedValue baseValue: CGFloat,
        minValue: CGFloat,
        maxValue: CGFloat,
        relativeTo textStyle: UIFont.TextStyle = .body,
        traitCollection: UITraitCollection? = nil
    ) {
        self.init(
            wrappedValue: baseValue,
            minValue: minValue,
            maxValue: maxValue,
            relativeTo: UIFontMetrics(forTextStyle: textStyle),
            traitCollection: traitCollection
        )
    }

    /// Initializes a new LimitedScaledUIMetric with min and max limits values calculated from factors.
    /// - Parameters:
    ///   - baseValue: The base value to scale
    ///   - minFactor: Factor to multiply baseValue by to get minimum allowed value
    ///   - maxFactor: Factor to multiply baseValue by to get maximum allowed value
    ///   - metrics: The font metrics to use for scaling
    ///   - traitCollection: Optional trait collection to use for scaling (defaults to current if nil)
    public init(
        wrappedValue baseValue: CGFloat,
        minFactor: CGFloat,
        maxFactor: CGFloat,
        relativeTo metrics: UIFontMetrics,
        traitCollection: UITraitCollection? = nil
    ) {
        self.init(
            wrappedValue: baseValue,
            minValue: baseValue * minFactor,
            maxValue: baseValue * maxFactor,
            relativeTo: metrics,
            traitCollection: traitCollection
        )
    }

    /// Initializes a new LimitedScaledUIMetric with min and max limits values calculated from factors.
    /// - Parameters:
    ///   - baseValue: The base value to scale
    ///   - minFactor: Factor to multiply baseValue by to get minimum allowed value
    ///   - maxFactor: Factor to multiply baseValue by to get maximum allowed value
    ///   - textStyle: The text style to create font metrics from (defaults to .body)
    ///   - traitCollection: Optional trait collection to use for scaling (defaults to current if nil)
    public init(
        wrappedValue baseValue: CGFloat,
        minFactor: CGFloat,
        maxFactor: CGFloat,
        relativeTo textStyle: UIFont.TextStyle = .body,
        traitCollection: UITraitCollection? = nil
    ) {
        self.init(
            wrappedValue: baseValue,
            minFactor: minFactor,
            maxFactor: maxFactor,
            relativeTo: UIFontMetrics(forTextStyle: textStyle),
            traitCollection: traitCollection
        )
    }

    /// Initializes a new LimitedScaledUIMetric with default min and max limits factors.
    /// - Parameters:
    ///   - baseValue: The base value to scale
    ///   - metrics: The font metrics to use for scaling
    ///   - traitCollection: Optional trait collection to use for scaling (defaults to current if nil)
    public init(
        wrappedValue baseValue: CGFloat,
        relativeTo metrics: UIFontMetrics,
        traitCollection: UITraitCollection? = nil
    ) {
        self.init(
            wrappedValue: baseValue,
            minValue: baseValue * LimitedScaledMetricConstants.minValueFactor,
            maxValue: baseValue * LimitedScaledMetricConstants.maxValueFactor,
            relativeTo: metrics,
            traitCollection: traitCollection
        )
    }

    /// Initializes a new LimitedScaledUIMetric with default min and max limits factors.
    /// - Parameters:
    ///   - baseValue: The base value to scale
    ///   - textStyle: The text style to create font metrics from (defaults to .body)
    ///   - traitCollection: Optional trait collection to use for scaling (defaults to current if nil)
    public init(
        wrappedValue baseValue: CGFloat,
        relativeTo textStyle: UIFont.TextStyle = .body,
        traitCollection: UITraitCollection? = nil
    ) {
        self.init(
            wrappedValue: baseValue,
            relativeTo: UIFontMetrics(forTextStyle: textStyle),
            traitCollection: traitCollection
        )
    }

    // MARK: - Methods

    internal mutating func updateRangeValues(minValueFactor: CGFloat, maxValueFactor: CGFloat) {
        self.minValue = self.baseValue * minValueFactor
        self.maxValue = self.baseValue * maxValueFactor
    }

    /// Update the trait collection.
    /// - Parameter traitCollection: a new trait collection.
    public mutating func update(traitCollection: UITraitCollection?) {
        self.traitCollection = traitCollection
    }

    /// Returns a scaled value for the given trait collection.
    /// - Parameter traitCollection: The trait collection to use for scaling calculations
    /// - Returns: A scaled value constrained between the minimum and maximum limits
    public func scaledValue(for traitCollection: UITraitCollection?) -> CGFloat {
        let scaledValue = self.metrics.scaledValue(
            for: self.baseValue,
            compatibleWith: traitCollection ?? .current
        )

        return if scaledValue < self.minValue {
            self.minValue
        } else if scaledValue > self.maxValue {
            self.maxValue
        } else {
            scaledValue
        }
    }
}
