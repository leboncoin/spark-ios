//
//  SparkTagSnapshotTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 07/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import SwiftUI
import SnapshotTesting
@testable import SparkComponentTag
import SparkTheming
import SparkTheme
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting

@MainActor
@Suite(.sparkConfiguration)
struct SparkTagSnapshotTests: SwiftUIComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test(arguments: TagScenarioSnapshotTests.allCases)
    func test(scenario: TagScenarioSnapshotTests) async {
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

            await self.assertSnapshot(
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
