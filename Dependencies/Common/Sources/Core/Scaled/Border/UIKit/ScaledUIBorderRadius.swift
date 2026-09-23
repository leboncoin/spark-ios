//
//  ScaledUIBorderRadius.swift
//  SparkCommon
//
//  Created by robin.lemaire on 15/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

/// A property wrapper for UIKit only that scales border radius (or corner radius) values based on the device's screen metrics
/// with also a min and max value management to limit the radius. 
/// This wrapper automatically adjusts the radius value according to the current trait collection
/// to maintain visual consistency across different device sizes.
///
/// Example usage:
/// ```swift
/// public final class MyView: UIView {
///
///     @ScaledUIBorderRadius private var radius: CGFloat = 12
///
///     public init() {
///         super.init(frame: .zero)
///
///         // Setup
///         self.layer.cornerRadius = self.radius
///     }
///
///     required init?(coder: NSCoder) {
///         fatalError("init(coder:) has not been implemented")
///     }
///
///     public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
///         super.traitCollectionDidChange(previousTraitCollection)
///
///         self._radius.update(traitCollection: self.traitCollection)
///         self.layer.cornerRadius = self.radius
///     }
/// }
/// ```
@propertyWrapper public struct ScaledUIBorderRadius: ScaledUIMetricable {

    // MARK: - Public Properties

    /// The wrapped border radius value that will be automatically scaled.
    /// Getting this value returns the current radius.
    /// Setting this value updates the radius and recalculates the scaling factors.
    public var wrappedValue: CGFloat {
        get {
            self.radius
        }
        set {
            self.radius = newValue
            self._radius.updateRangeValues(
                minValueFactor: self.type.minValueFactor,
                maxValueFactor: self.type.maxValueFactor
            )
        }
    }

    // MARK: - Private Properties

    private let type: ScaledBorderType = .radius
    @LimitedScaledUIMetric private var radius: CGFloat

    // MARK: - Initialization

    /// Initializes a new `ScaledUIBorderRadius` with the specified base value.
    /// The base value will be scaled according to the device's screen metrics.
    ///
    /// - Parameters:
    ///   -  baseValue: The base border radius value to be scaled
    ///   - traitCollection: Optional trait collection to use for scaling (defaults to current if nil) 
    public init(
        wrappedValue baseValue: CGFloat,
        traitCollection: UITraitCollection? = nil
    ) {
        self._radius = .init(
            wrappedValue: baseValue,
            minFactor: self.type.minValueFactor,
            maxFactor: self.type.maxValueFactor,
            relativeTo: self.type.uiKitRelativeTo,
            traitCollection: traitCollection
        )
    }

    // MARK: - Methods

    /// Update the trait collection.
    ///
    /// - Parameter traitCollection: The trait collection to use for scaling calculations
    public mutating func update(traitCollection: UITraitCollection?) {
        self._radius.update(traitCollection: traitCollection)
    }

    /// Returns the scaled radius value for the specified trait collection without modifying the stored value.
    ///
    /// - Parameter traitCollection: The trait collection to use for scaling calculations
    /// - Returns: The scaled radius value appropriate for the provided trait collection
    public func scaledValue(for traitCollection: UITraitCollection?) -> CGFloat {
        return self._radius.scaledValue(for: traitCollection)
    }
}
