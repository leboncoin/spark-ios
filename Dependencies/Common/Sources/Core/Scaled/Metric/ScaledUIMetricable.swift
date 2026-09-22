//
//  ScaledUIMetricable.swift
//  SparkCommon
//
//  Created by robin.lemaire on 22/04/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

/// A protocol for UIKit only that defines a value that can be scaled according to the current UI metrics
/// (such as Dynamic Type or other accessibility settings).
/// It is implement by the `ScaledUIBorderRadius`, `ScaledUIBorderWidth` and  `ScaledUIPadding` on this package.
public protocol ScaledUIMetricable {
    /// The numeric type used for the scaled value, must conform to BinaryFloatingPoint
    associatedtype Value: BinaryFloatingPoint

    /// Set a unscaled value and get the scaled value.
    var wrappedValue: Value { get set }

    /// Updates the internal state based on the provided trait collection
    /// - Parameter traitCollection: The UITraitCollection to use for scaling calculations, or nil to use the current trait collection
    mutating func update(traitCollection: UITraitCollection?)

    /// Calculates the scaled value based on the provided trait collection
    /// - Parameter traitCollection: The UITraitCollection to use for scaling calculations, or nil to use the current trait collection
    /// - Returns: The scaled value adjusted according to the trait collection
    func scaledValue(for traitCollection: UITraitCollection?) -> Value
}
