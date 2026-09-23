//
//  SegmentedGaugeType.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming
import Foundation

/// The type of the segmented gauge.
public enum SegmentedGaugeType: Equatable {

    /// Excellent or very positive level.
    ///
    /// Segments : **5/5** or **3/3**.
    case veryHigh

    /// Good level, above average.
    ///
    /// Segments : **4/5** or **3/3**.
    case high

    /// Balanced or average level.
    ///
    /// Segments : **3/5** or **3/3**.
    case medium

    /// Low level, needs attention.
    ///
    /// Segments : **2/5** or **2/3**.
    case low

    /// Critical or poor level.
    ///
    /// Segments : **1/5** or **1/3**.
    case veryLow

    /// No available or calculated data.
    ///
    /// Segments : **0/5** or **0/3**.
    case noData

    /// Custom data with a level and a colorToken.
    /// - Parameters:
    ///   - value: The selected segments level. Relative to ``SegmentedGaugeSegments``.
    ///   If the value is out the range of segment, the limit value will be applied.
    ///   - colorToken: The spark color token.
    ///   - dim: The spark dim.
    case custom(level: Int, colorToken: any ColorToken, dim: CGFloat)

    // MARK: - Properties

    /// The default case. Equals to **.noData**.
    public static let `default`: Self = .noData

    // MARK: - Initialization

    /// Init the ``SegmentedGaugeType`` from a rawValue.
    /// - Parameters:
    ///   - rawValue: The int rawValue.
    ///   If the value is **lower than 0**, the type is equals to **.noData**.
    ///   If the value is **greater than 4**, the type is equals to **.veryHigh**.
    public init(rawValue: Int) {
        self = switch rawValue {
        case 1: .veryLow
        case 2: .low
        case 3: .medium
        case 4: .high
        case 5...: .veryHigh
        default: .noData
        }
    }

    // MARK: - Equatable

    public static func == (lhs: SegmentedGaugeType, rhs: SegmentedGaugeType) -> Bool {
        return switch (lhs, rhs) {
        case (.veryHigh, .veryHigh): true
        case (.high, .high): true
        case (.medium, .medium): true
        case (.low, .low): true
        case (.veryLow, .veryLow): true
        case (.noData, .noData): true
        case (.custom(let lhsValue, let lhsColorToken, let lhsDim), .custom(let rhsValue, let rhsColorToken, let rhsDim)):
            lhsValue == rhsValue && lhsColorToken.equals(rhsColorToken) && lhsDim == rhsDim
        default: false
        }
    }
}
