//
//  ScaledUIBorderWidth.swift
//  SparkCommon
//
//  Created by robin.lemaire on 15/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

/// A property wrapper for UIKit only that scales border width values based on the device's screen metrics
/// with also a min and max value management to limit the width.
/// This wrapper automatically adjusts the width value according to the current trait collection
/// to maintain visual consistency across different device sizes.
///
/// Example usage:
/// ```swift
/// public final class MyView: UIView {
///
///     @ScaledUIBorderWidth private var width: CGFloat = 2
///
///     public init() {
///         super.init(frame: .zero)
///
///         // Setup
///         self.layer.borderWidth = self.width
///     }
///
///     required init?(coder: NSCoder) {
///         fatalError("init(coder:) has not been implemented")
///     }
///
///     public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
///         super.traitCollectionDidChange(previousTraitCollection)
///
///         self._width.update(traitCollection: self.traitCollection)
///         self.layer.borderWidth = self.width
///     }
/// }
/// ```
@propertyWrapper public struct ScaledUIBorderWidth: ScaledUIMetricable {

    // MARK: - Public Properties

    /// The wrapped border width value that will be automatically scaled.
    /// Getting this value returns the current width.
    /// Setting this value updates the width and recalculates the scaling factors.
    public var wrappedValue: CGFloat {
        get {
            self.width
        }
        set {
            self.width = newValue
            self._width.updateRangeValues(
                minValueFactor: self.type.minValueFactor,
                maxValueFactor: self.type.maxValueFactor
            )
        }
    }

    // MARK: - Private Properties

    private let type: ScaledBorderType = .width
    @LimitedScaledUIMetric private var width: CGFloat

    // MARK: - Initialization

    /// Initializes a new `ScaledUIBorderWidth` with the specified base value.
    /// The base value will be scaled according to the device's screen metrics.
    ///
    /// - Parameters:
    ///   - baseValue: The base border width value to be scaled
    ///   - traitCollection: Optional trait collection to use for scaling (defaults to current if nil)
    public init(
        wrappedValue baseValue: CGFloat,
        traitCollection: UITraitCollection? = nil
    ) {
        self._width = .init(
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
        self._width.update(traitCollection: traitCollection)
    }

    /// Returns the scaled width value for the specified trait collection without modifying the stored value.
    ///
    /// - Parameter traitCollection: The trait collection to use for scaling calculations
    /// - Returns: The scaled width value appropriate for the provided trait collection
    public func scaledValue(for traitCollection: UITraitCollection?) -> CGFloat {
        return self._width.scaledValue(for: traitCollection)
    }
}
