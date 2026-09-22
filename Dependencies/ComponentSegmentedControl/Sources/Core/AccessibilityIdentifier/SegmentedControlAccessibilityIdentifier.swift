//
//  SegmentedControlAccessibilityIdentifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 23/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

/// The accessibility identifiers for the segmentedcontrol.
public enum SegmentedControlAccessibilityIdentifier {

    /// The accessibility identifiers for the segmentedcontrol view.
    ///
    /// The value is equals to **spark-segmentedcontrol-view**.
    public static let view = "spark-segmentedcontrol-view"

    /// The accessibility identifier for a specific segmentedcontrol item.
    ///
    /// The value is equals to **spark-segmentedcontrol-item-{index}**.
    ///
    /// - Parameters:
    ///   - index: The index of the item.
    ///
    /// - Returns: The accessibility identifier string for the item at the specified index.
    public static func item(at index: Int) -> String {
        "spark-segmentedcontrol-item-\(index)"
    }
}
