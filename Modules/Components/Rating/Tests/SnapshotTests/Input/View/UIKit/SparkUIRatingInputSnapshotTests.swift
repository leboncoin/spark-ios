//
//  SparkUIRatingInputSnapshotTests.swift
//  SparkComponentRatingInputTests
//
//  Created by robin.lemaire on 12/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import Testing
import UIKit
import SnapshotTesting
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
import SparkTheme

@MainActor
@Suite(.sparkConfiguration)
struct SparkUIRatingInputSnapshotTests: UIKitComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test(arguments: RatingInputScenarioSnapshotTests.allCases.filter { $0 != .documentation })
    func test(scenario: RatingInputScenarioSnapshotTests) async throws {
        let configurations = scenario.configuration()

        for configuration in configurations {
            let view: SparkUIRatingInput = .init(
                theme: self.theme
            )
            view.value = configuration.value.rawValue

            let backgroundView = UIView()
            backgroundView.backgroundColor = .systemBackground
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            backgroundView.addSubview(view)
            NSLayoutConstraint.stickEdges(
                from: view,
                to: backgroundView,
                insets: .init(all: 4)
            )

            await self.assertSnapshot(
                matching: backgroundView,
                named: configuration.name,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName
            )
        }
    }
}
