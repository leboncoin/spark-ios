//
//  ScaledUIFrame.swift
//  SparkCommon
//
//  Created by robin.lemaire on 15/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

/// A property wrapper for UIKit only that scales frame values based on the device's screen metrics
/// with also a min and max value management to limit the frame.
/// This wrapper automatically adjusts the frame value according to the current trait collection
/// to maintain visual consistency across different device sizes.
///
/// Example usage:
/// ```swift
/// public final class MyView: UIView {
///
///     @ScaledUIFrame private var height: CGFloat = 44
///
///     public init() {
///         super.init(frame: .zero)
///
///         // Setup
///         self.frame.size.height = self.height
///     }
///
///     required init?(coder: NSCoder) {
///         fatalError("init(coder:) has not been implemented")
///     }
///
///     public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
///         super.traitCollectionDidChange(previousTraitCollection)
///
///         self._height.update(traitCollection: self.traitCollection)
///         self.frame.size.height = self.height
///     }
/// }
/// ```
@propertyWrapper public struct ScaledUIFrame: ScaledUIMetricable {

    // MARK: - Public Properties

    /// The wrapped frame value that will be automatically scaled.
    /// Getting this value returns the current scaled frame.
    /// Setting this value updates the scaled frame.
    public var wrappedValue: CGFloat {
        get {
            self.frame
        }
        set {
            self.frame = newValue
        }
    }

    // MARK: - Private Properties

    @ScaledUIMetric private var frame: CGFloat

    // MARK: - Initialization

    /// Initializes a new `ScaledUIFrame` with the specified base value.
    /// The base value will be scaled according to the device's screen metrics.
    ///
    /// - Parameters:
    ///   - baseValue: The base value to scale
    ///   - textStyle: The text style to create font metrics from (defaults to .body)
    ///   - traitCollection: Optional trait collection to use for scaling (defaults to current if nil)
    public init(
        wrappedValue baseValue: CGFloat,
        relativeTo textStyle: UIFont.TextStyle = .largeTitle,
        traitCollection: UITraitCollection? = nil
    ) {
        self._frame = .init(
            wrappedValue: baseValue,
            relativeTo: textStyle,
            traitCollection: traitCollection
        )
    }

    // MARK: - Methods

    /// Updates the scaled frame value based on the provided trait collection.
    ///
    /// - Parameter traitCollection: The trait collection to use for scaling calculations
    public mutating func update(traitCollection: UITraitCollection?) {
        self._frame.update(traitCollection: traitCollection)
    }

    /// Returns the scaled frame value for the specified trait collection without modifying the stored value.
    ///
    /// - Parameter traitCollection: The trait collection to use for scaling calculations
    /// - Returns: The scaled frame value appropriate for the provided trait collection
    public func scaledValue(for traitCollection: UITraitCollection?) -> CGFloat {
        self._frame.scaledValue(for: traitCollection)
    }
}
