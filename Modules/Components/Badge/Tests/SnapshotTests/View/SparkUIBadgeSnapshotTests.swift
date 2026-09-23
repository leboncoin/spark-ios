//
//  SparkUIBadgeSnapshotTests.swift
//  SparkComponentBadgeSnapshotTests
//
//  Created by robin.lemaire on 24/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SparkComponentBadge
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
import SparkTheme

final class SparkUIBadgeSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = BadgeScenarioSnapshotTests.allCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()
            for configuration in configurations {
                let badge = SparkUIBadge(theme: self.theme)
                badge.intent = configuration.intent
                badge.size = configuration.size
                badge.value = configuration.content.value
                badge.unit = configuration.content.unit
                badge.isBorder = configuration.isBorder

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false

                if let attachPosition = configuration.attachPosition {

                    let rectangleView = UIView()
                    rectangleView.backgroundColor = .blue
                    rectangleView.translatesAutoresizingMaskIntoConstraints = false
                    NSLayoutConstraint.activate([
                        rectangleView.widthAnchor.constraint(equalToConstant: 40),
                        rectangleView.heightAnchor.constraint(equalToConstant: 40)
                    ])

                    backgroundView.addSubview(rectangleView)
                    backgroundView.addSubview(badge)

                    badge.attach(to: rectangleView, position: attachPosition)

                    NSLayoutConstraint.stickEdges(
                        from: rectangleView,
                        to: backgroundView,
                        insets: .init(vertical: 20, horizontal: 50)
                    )

                } else {
                    backgroundView.addSubview(badge)

                    NSLayoutConstraint.stickEdges(
                        from: badge,
                        to: backgroundView,
                        insets: .init(all: 20)
                    )
                }

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
