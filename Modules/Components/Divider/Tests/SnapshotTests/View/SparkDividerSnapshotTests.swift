//
//  SparkDividerSnapshotTests.swift
//  SparkComponentDividerSnapshotTests
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentDivider
@_spi(SI_SPI) import SparkComponentDividerTesting
import SparkTheming
import SparkTheme

final class SparkDividerSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = DividerScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .sparkDividerAlignment(configuration.alignment)
                    .sparkDividerAxis(configuration.axis)
                    .sparkDividerIntent(configuration.intent)
                    .frame(
                        minWidth: configuration.axis.width,
                        minHeight: configuration.axis.height
                    )
                    .padding(.horizontal, 10)
                    .padding(.vertical, 10)
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

    @ViewBuilder
    private func component(configuration: DividerConfigurationSnapshotTests) -> some View {
        if let text = configuration.content.text {
            SparkDivider(text)
        } else if configuration.content == .other {
            SparkDivider {
                VStack {
                    Text("Welcome")
                    Text("on Spark's Divider")
                        .foregroundColor(.blue)
                }
            }
        } else {
            SparkDivider()
        }
    }
}
