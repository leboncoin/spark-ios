//
//  SparkUIProgressBarSnapshotTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 18/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentProgressBar
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
import SparkTheme

final class SparkUIProgressBarSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = ProgressBarScenarioSnapshotTests.allCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view: SparkUIProgressBar = .init(
                    theme: self.theme
                )
                view.value = configuration.value
                view.intent = configuration.intent
                view.shape = configuration.shape

                view.translatesAutoresizingMaskIntoConstraints = false
                view.widthAnchor.constraint(equalToConstant: configuration.width).isActive = true

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                backgroundView.addSubview(view)
                NSLayoutConstraint.stickEdges(
                    from: view,
                    to: backgroundView,
                    insets: .init(all: 4)
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
