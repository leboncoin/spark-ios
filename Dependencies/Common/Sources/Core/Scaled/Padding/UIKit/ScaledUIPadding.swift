//
//  ScaledUIPadding.swift
//  SparkCommon
//
//  Created by robin.lemaire on 15/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

/// A property wrapper for UIKit only that scales padding/spacing values based on the device's screen metrics
/// with also a min and max value management to limit the padding/spacing.
/// This wrapper automatically adjusts the padding value according to the current trait collection
/// to maintain visual consistency across different device sizes.
///
/// Example usage:
/// ```swift
/// public final class MyView: UIView {
///
///     @ScaledUIPadding private var spacing: CGFloat = 12
///
///     lazy var contentStackView: UIStackView = {
///         let stackView = UIStackView()
///         stackView.axis = .vertical
///         stackView.spacing = self.spacing
///         return stackView
///     }()
///
///     public init() {
///         super.init(frame: .zero)
///
///         // Setup
///         self.addSubview(self.contentStackView)
///     }
///
///     required init?(coder: NSCoder) {
///         fatalError("init(coder:) has not been implemented")
///     }
///
///     public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
///         super.traitCollectionDidChange(previousTraitCollection)
///
///         self._spacing.update(traitCollection: self.traitCollection)
///         self.contentStackView.spacing = self.spacing
///     }
/// }
/// ```
@propertyWrapper public struct ScaledUIPadding: ScaledUIMetricable {

    // MARK: - Public Properties

    /// The wrapped padding/spacing value that will be automatically scaled.
    /// Getting this value returns the current padding/spacing.
    /// Setting this value updates the padding/spacing and recalculates the scaling factors.
    public var wrappedValue: CGFloat {
        get {
            self.radius
        }
        set {
            self.radius = newValue
            self._radius.updateRangeValues(
                minValueFactor: ScaledPaddingConstants.minValueFactor,
                maxValueFactor: ScaledPaddingConstants.maxValueFactor
            )
        }
    }

    // MARK: - Private Properties

    @LimitedScaledUIMetric private var radius: CGFloat

    // MARK: - Initialization

    /// Initializes a new `ScaledUIPadding` with the specified base value.
    /// The base value will be scaled according to the device's screen metrics.
    ///
    /// - Parameter baseValue: The base padding/spacing value to be scaled
    public init(wrappedValue baseValue: CGFloat) {
        self._radius = .init(
            wrappedValue: baseValue,
            minFactor: ScaledPaddingConstants.minValueFactor,
            maxFactor: ScaledPaddingConstants.maxValueFactor
        )
    }

    // MARK: - Methods

    /// Update the trait collection.
    ///
    /// - Parameter traitCollection: The trait collection to use for scaling calculations
    public mutating func update(traitCollection: UITraitCollection?) {
        self._radius.update(traitCollection: traitCollection)
    }

    /// Returns the scaled padding/spacing value for the specified trait collection without modifying the stored value.
    ///
    /// - Parameter traitCollection: The trait collection to use for scaling calculations
    /// - Returns: The scaled padding/spacing value appropriate for the provided trait collection
    public func scaledValue(for traitCollection: UITraitCollection?) -> CGFloat {
        self._radius.scaledValue(for: traitCollection)
    }
}
