//
//  SegmentedGaugeUICodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SegmentedGaugeUICodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Basic", code: Self.basic),
            .init(title: "With Title String", code: Self.withTitleString),
            .init(title: "With Title Attributed String", code: Self.withTitleAttributedString),
            .init(title: "With Description String", code: Self.withDescriptionString),
            .init(title: "With Description Attributed String", code: Self.withDescriptionAttributedString),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var basic: String {
        """
        let segmentedGauge = SparkUISegmentedGauge(theme: theme)
        segmentedGauge.alignment = .horizontal
        segmentedGauge.withMarker = true
        segmentedGauge.segments = .five
        segmentedGauge.size = .small
        segmentedGauge.type = .high
        """
    }

    private static var withTitleString: String {
        """
        let segmentedGauge = SparkUISegmentedGauge(theme: theme)
        segmentedGauge.title = "My Segmented Gauge"
        segmentedGauge.alignment = .horizontal
        segmentedGauge.withMarker = true
        segmentedGauge.segments = .five
        segmentedGauge.size = .small
        segmentedGauge.type = .high
        """
    }

    private static var withTitleAttributedString: String {
        """
        let segmentedGauge = SparkUISegmentedGauge(theme: theme)
        let attributedTitle = NSAttributedString(
            string: "My Segmented Gauge",
            attributes: [.foregroundColor: UIColor.blue]
        )
        segmentedGauge.attributedTitle = attributedTitle
        segmentedGauge.alignment = .horizontal
        segmentedGauge.withMarker = true
        segmentedGauge.segments = .five
        segmentedGauge.size = .small
        segmentedGauge.type = .high
        """
    }

    private static var withDescriptionString: String {
        """
        let segmentedGauge = SparkUISegmentedGauge(theme: theme)
        segmentedGauge.descriptionString = "My description"
        segmentedGauge.alignment = .horizontal
        segmentedGauge.withMarker = true
        segmentedGauge.segments = .five
        segmentedGauge.size = .small
        segmentedGauge.type = .high
        """
    }

    private static var withDescriptionAttributedString: String {
        """
        let segmentedGauge = SparkUISegmentedGauge(theme: theme)
        let attributedDescription = NSAttributedString(
            string: "My description",
            attributes: [.foregroundColor: UIColor.blue]
        )
        segmentedGauge.attributedDescription = attributedDescription
        segmentedGauge.alignment = .horizontal
        segmentedGauge.withMarker = true
        segmentedGauge.segments = .five
        segmentedGauge.size = .small
        segmentedGauge.type = .high
        """
    }

    private static var fullConfiguration: String {
        """
        let segmentedGauge = SparkUISegmentedGauge(theme: theme)
        segmentedGauge.title = "My Segmented Gauge"
        segmentedGauge.descriptionString = "Progress description"
        segmentedGauge.alignment = .horizontal
        segmentedGauge.withMarker = true
        segmentedGauge.segments = .five
        segmentedGauge.size = .medium
        segmentedGauge.type = .high
        segmentedGauge.accessibilityLabel = "Custom accessibility label"
        """
    }
}
