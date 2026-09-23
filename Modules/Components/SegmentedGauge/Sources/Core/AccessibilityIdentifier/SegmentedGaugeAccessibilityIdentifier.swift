//
//  SegmentedGaugeAccessibilityIdentifier.swift
//  SparkComponentSegmentedGauge
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

/// The accessibility identifiers for the segmented gauge.
public enum SegmentedGaugeAccessibilityIdentifier {

    /// The accessibility identifiers for the segmented gauge view.
    ///
    /// The value is equals to **spark-segmentedgauge-view**.
    public static let view = "spark-segmentedgauge-view"

    internal static let markerOuterView = "marker-outer-view"
    internal static let markerInnerView = "marker-inner-view"

    internal static func segmentView(for index: Int) -> String {
        return "segment-view-\(index)"
    }
}
