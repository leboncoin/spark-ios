//
//  SparkProgressBarSnapshotTests.swift
//  SparkComponentProgressBarTests
//
//  Created by robin.lemaire on 18/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentProgressBar
@_spi(SI_SPI) import SparkCommonSnapshotTesting
import SparkTheming
import SparkTheme
import SwiftUI

final class SparkProgressBarSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = ProgressBarScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = SparkProgressBar(
                    value: configuration.value
                )
                    .sparkTheme(self.theme)
                    .sparkProgressBarIntent(configuration.intent)
                    .sparkProgressBarShape(configuration.shape)
                    .frame(width: configuration.width)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 4)
                    .background(.background)
                    .fixedSize()

                self.assertSnapshot(
                    matching: view,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName,
                    forDocumentation: scenario.isDocumentation
                )
            }
        }
    }
}
