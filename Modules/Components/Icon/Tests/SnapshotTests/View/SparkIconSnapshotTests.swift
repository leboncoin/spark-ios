//
//  SparkIconSnapshotTests.swift
//  SparkComponentIconSnapshotTests
//
//  Created by robin.lemaire on 02/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentIcon
@_spi(SI_SPI) import SparkComponentIconTesting
import SparkTheming
import SparkTheme

@MainActor
@Suite(.sparkConfiguration)
struct SparkIconSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test func test() {
        let scenarios = IconScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = SparkIcon(.icon)
                    .sparkTheme(self.theme)
                    .sparkIconSize(configuration.size.toSize)
                    .sparkIconIntent(configuration.intent.toIntent(self.theme))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 20)
                    .background(.background)
                    .fixedSize()

                self.assertSnapshot(
                    matching: view,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName,
                    addPadding: false,
                    forDocumentation: scenario.isDocumentation
                )
            }
        }
    }
}

// MARK: - Extension

extension Image {
    static let icon: Image = .init(uiImage: IconographyTests.shared.checkmark)
}
