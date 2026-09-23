//
//  SparkCardSnapshotTests.swift
//  SparkComponentCardSnapshotTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentCard
import SparkTheming
import SparkTheme

final class SparkCardSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = CardScenarioSnapshotTests.allCases
        self.loadScenarios(scenarios)
    }

    // MARK: - Scenarios

    private func loadScenarios(_ scenarios: [CardScenarioSnapshotTests]) {
        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(
                    configuration: configuration,
                    content: {
                        Content()
                    })
                    .sparkTheme(self.theme)
                    .sparkCardIntent(configuration.intent)
                    .sparkCardIsHighlighted(configuration.isHighlighted)
                    .sparkCardPadding(configuration.padding)
                    .sparkCardVariant(configuration.variant)
                    .sparkCardHeaderPosition(configuration.headerPosition)
                    .shadow(configuration, theme: self.theme)
                    .disabled(configuration.isDisabled)
                    .frame(
                        width: CardConstantsSnapshotsTests.size.width,
                        height: CardConstantsSnapshotsTests.size.height
                    )
                    .padding(20)
                    .background(.gray)
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

    // MARK: - Component

    @ViewBuilder
    private func component<Content>(
        configuration: CardConfigurationSnapshotTests,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View where Content: View {
        switch configuration.headerContentType {
        case .native:
            SparkCard(
                header: "New !",
                content: {
                    content()
                }
            )
        case .custom:
            SparkCard(header: {
                VStack {
                    Text("New !")
                    Text("Ad")
                        .foregroundColor(.green)
                        .bold()
                }
            }, content: {
                content()
            })

        case .none:
            SparkCard(content: {
                content()
            })
        }
    }
}

private struct Content: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "internaldrive")

                    Text("A new carrier is arriving!")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                Text("Have your parcels delivered to one of the 16,000 collection points.")
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Spacer()

            Button("Learn more") {
            }
        }
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func shadow(
        _ configuration: CardConfigurationSnapshotTests,
        theme: any Theme
    ) -> some View {
        if configuration.isElevation {
            self.shadow(theme.elevation.dropShadow.medium)
        } else {
            self
        }
    }
}
