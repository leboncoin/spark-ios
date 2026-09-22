//
//  SegmentedGaugeCodeSyntaxes.swift
//  SparkDemo
//
//  Created by robin.lemaire on 22/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Foundation

struct SegmentedGaugeCodeSyntaxes {

    // MARK: - Properties

    static var content: [CodeSyntax] = {
        return [
            .init(title: "Description Only - String", code: Self.descriptionString),
            .init(title: "Description Only - LocalizedStringKey", code: Self.descriptionLocalizedKey),
            .init(title: "Description Only - Custom Label", code: Self.descriptionCustomLabel),
            .init(title: "Title & Description - Strings", code: Self.titleDescriptionStrings),
            .init(title: "Title & Description - LocalizedStringKeys", code: Self.titleDescriptionLocalizedKeys),
            .init(title: "Title & Description - Custom Labels", code: Self.titleDescriptionCustomLabels),
            .init(title: "Title String & Description Custom Label", code: Self.titleStringDescriptionLabel),
            .init(title: "Title LocalizedKey & Description Custom Label", code: Self.titleKeyDescriptionLabel),
            .init(title: "Title Custom Label & Description String", code: Self.titleLabelDescriptionString),
            .init(title: "Title Custom Label & Description LocalizedKey", code: Self.titleLabelDescriptionKey),
            .init(title: "Full Configuration", code: Self.fullConfiguration)
        ]
    }()

    // MARK: - Private Properties

    private static var descriptionString: String {
        """
        SparkSegmentedGauge("My description")
            .sparkTheme(theme)
            .sparkSegmentedGaugeAlignment(.horizontal)
            .sparkSegmentedGaugeWithMarker(true)
            .sparkSegmentedGaugeSegments(.five)
            .sparkSegmentedGaugeSize(.small)
            .sparkSegmentedGaugeType(.high)
        """
    }

    private static var descriptionLocalizedKey: String {
        """
        SparkSegmentedGauge("description_key")
            .sparkTheme(theme)
            .sparkSegmentedGaugeAlignment(.horizontal)
            .sparkSegmentedGaugeWithMarker(true)
            .sparkSegmentedGaugeSegments(.five)
            .sparkSegmentedGaugeSize(.small)
            .sparkSegmentedGaugeType(.high)
        """
    }

    private static var descriptionCustomLabel: String {
        """
        SparkSegmentedGauge(
            descriptionLabel: {
                HStack {
                    Text("My")
                    Text("description")
                        .foregroundColor(.blue)
                }
            }
        )
        .sparkTheme(theme)
        .sparkSegmentedGaugeAlignment(.horizontal)
        .sparkSegmentedGaugeWithMarker(true)
        .sparkSegmentedGaugeSegments(.five)
        .sparkSegmentedGaugeSize(.small)
        .sparkSegmentedGaugeType(.high)
        """
    }

    private static var titleDescriptionStrings: String {
        """
        SparkSegmentedGauge(
            "My title",
            description: "My description"
        )
        .sparkTheme(theme)
        .sparkSegmentedGaugeAlignment(.horizontal)
        .sparkSegmentedGaugeWithMarker(true)
        .sparkSegmentedGaugeSegments(.five)
        .sparkSegmentedGaugeSize(.small)
        .sparkSegmentedGaugeType(.high)
        """
    }

    private static var titleDescriptionLocalizedKeys: String {
        """
        SparkSegmentedGauge(
            "title_key",
            descriptionKey: "description_key"
        )
        .sparkTheme(theme)
        .sparkSegmentedGaugeAlignment(.horizontal)
        .sparkSegmentedGaugeWithMarker(true)
        .sparkSegmentedGaugeSegments(.five)
        .sparkSegmentedGaugeSize(.small)
        .sparkSegmentedGaugeType(.high)
        """
    }

    private static var titleDescriptionCustomLabels: String {
        """
        SparkSegmentedGauge(
            titleLabel: {
                HStack {
                    Text("My")
                    Text("title")
                        .foregroundColor(.blue)
                }
            },
            descriptionLabel: {
                HStack {
                    Text("My")
                    Text("description")
                        .foregroundColor(.blue)
                }
            }
        )
        .sparkTheme(theme)
        .sparkSegmentedGaugeAlignment(.horizontal)
        .sparkSegmentedGaugeWithMarker(true)
        .sparkSegmentedGaugeSegments(.five)
        .sparkSegmentedGaugeSize(.small)
        .sparkSegmentedGaugeType(.high)
        """
    }

    private static var titleStringDescriptionLabel: String {
        """
        SparkSegmentedGauge(
            "My title",
            descriptionLabel: {
                HStack {
                    Text("My")
                    Text("description")
                        .foregroundColor(.blue)
                }
            }
        )
        .sparkTheme(theme)
        .sparkSegmentedGaugeAlignment(.horizontal)
        .sparkSegmentedGaugeWithMarker(true)
        .sparkSegmentedGaugeSegments(.five)
        .sparkSegmentedGaugeSize(.small)
        .sparkSegmentedGaugeType(.high)
        """
    }

    private static var titleKeyDescriptionLabel: String {
        """
        SparkSegmentedGauge(
            "title_key",
            descriptionLabel: {
                HStack {
                    Text("My")
                    Text("description")
                        .foregroundColor(.blue)
                }
            }
        )
        .sparkTheme(theme)
        .sparkSegmentedGaugeAlignment(.horizontal)
        .sparkSegmentedGaugeWithMarker(true)
        .sparkSegmentedGaugeSegments(.five)
        .sparkSegmentedGaugeSize(.small)
        .sparkSegmentedGaugeType(.high)
        """
    }

    private static var titleLabelDescriptionString: String {
        """
        SparkSegmentedGauge(
            "My description",
            titleLabel: {
                HStack {
                    Text("My")
                    Text("title")
                        .foregroundColor(.blue)
                }
            }
        )
        .sparkTheme(theme)
        .sparkSegmentedGaugeAlignment(.horizontal)
        .sparkSegmentedGaugeWithMarker(true)
        .sparkSegmentedGaugeSegments(.five)
        .sparkSegmentedGaugeSize(.small)
        .sparkSegmentedGaugeType(.high)
        """
    }

    private static var titleLabelDescriptionKey: String {
        """
        SparkSegmentedGauge(
            "description_key",
            titleLabel: {
                HStack {
                    Text("My")
                    Text("title")
                        .foregroundColor(.blue)
                }
            }
        )
        .sparkTheme(theme)
        .sparkSegmentedGaugeAlignment(.horizontal)
        .sparkSegmentedGaugeWithMarker(true)
        .sparkSegmentedGaugeSegments(.five)
        .sparkSegmentedGaugeSize(.small)
        .sparkSegmentedGaugeType(.high)
        """
    }

    private static var fullConfiguration: String {
        """
        SparkSegmentedGauge(
            "My title",
            description: "My description"
        )
        .sparkTheme(theme)
        .sparkSegmentedGaugeAlignment(.horizontal)
        .sparkSegmentedGaugeWithMarker(true)
        .sparkSegmentedGaugeSegments(.five)
        .sparkSegmentedGaugeSize(.medium)
        .sparkSegmentedGaugeType(.high)
        .accessibilityLabel("Custom accessibility label")
        """
    }
}
