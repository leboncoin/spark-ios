//
//  SparkUISegmentedGaugeSnapshotTests.swift
//  SparkComponentSegmentedGaugeSnapshotTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkComponentSegmentedGaugeTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
import SparkTheme

final class SparkUISegmentedGaugeSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = SegmentedGaugeScenarioSnapshotTests.allCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()
            for configuration in configurations {
                let segmentedGauge = SparkUISegmentedGauge(theme: self.theme)
                segmentedGauge.alignment = configuration.alignment
                segmentedGauge.withMarker = configuration.withMarker
                segmentedGauge.segments = configuration.segments
                segmentedGauge.size = configuration.size
                segmentedGauge.type = configuration.type.toType(self.theme)
                segmentedGauge.title(configuration.title)
                segmentedGauge.description(configuration.description)

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                backgroundView.addSubview(segmentedGauge)

                NSLayoutConstraint.stickEdges(
                    from: segmentedGauge,
                    to: backgroundView,
                    insets: .init(all: 20)
                )

                self.assertSnapshot(
                    matching: backgroundView,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName
                )
            }
        }
    }
}

// MARK: - Extension

private extension SparkUISegmentedGauge {

    func title(_ title: SegmentedGaugeTitle) {
        if let text = title.text {
            self.title = text
        } else if title == .other {
            self.attributedTitle = .init(
                string: "Welcome\non Spark's segmented gauge",
                attributes: [
                    .foregroundColor: UIColor.red,
                    .font: UIFont.italicSystemFont(ofSize: 20),
                    .underlineStyle: NSUnderlineStyle.single.rawValue
                ]
            )
        }
    }

    func description(_ description: SegmentedGaugeDescription) {
        if let text = description.text {
            self.descriptionString = text
        } else if description == .other {
            self.attributedDescription = .init(
                string: "This is\na description",
                attributes: [
                    .foregroundColor: UIColor.green,
                    .font: UIFont.italicSystemFont(ofSize: 14),
                    .underlineStyle: NSUnderlineStyle.single.rawValue
                ]
            )
        }
    }
}
