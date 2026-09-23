//
//  SparkTagSnapshotTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 07/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SparkComponentTag
import SparkTheming
import SparkTheme
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting

final class SparkTagSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = TagScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration(isSwiftUIComponent: true)
            for configuration in configurations {

                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .sparkTagIntent(configuration.intent)
                    .sparkTagSize(configuration.size)
                    .sparkTagVariant(configuration.variant)
                    .sparkTagIsHighlighted(configuration.isHighlighted)
                    .sparkFrame(width: configuration.width)
                    .fixedSize()
                    .padding(25)
                    .background(.background)

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
    func component(configuration: TagConfigurationSnapshotTests) -> some View {
        if configuration.isIcon, configuration.content == .other {
            SparkTag(
                icon: .mock,
                label: {
                    Group {
                        Text("My Tag ") +
                        Text("is amazing")
                            .foregroundColor(.blue)
                            .italic()
                    }
                }
            )

        } else if !configuration.isIcon, configuration.content == .other {
            SparkTag(
                label: {
                    Group {
                        Text("My Tag ") +
                        Text("is amazing")
                            .foregroundColor(.blue)
                            .italic()
                    }
                }
            )

        } else if configuration.isIcon, let text = configuration.content.text {
            SparkTag(
                text,
                icon: .mock
            )

        } else if configuration.isIcon {
            SparkTag(
                icon: .mock
            )

        } else {
            SparkTag(
                configuration.content.text ?? "Unknow"
            )
        }
    }
}

private extension Image {
    static let mock = Image(systemName: "person.2.circle.fill")
}
