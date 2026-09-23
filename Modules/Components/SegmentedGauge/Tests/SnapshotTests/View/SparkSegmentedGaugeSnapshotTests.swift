//
//  SparkSegmentedGaugeSnapshotTests.swift
//  SparkComponentSegmentedGaugeSnapshotTests
//
//  Created by robin.lemaire on 29/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentSegmentedGauge
@_spi(SI_SPI) import SparkComponentSegmentedGaugeTesting
import SparkTheming
import SparkTheme

final class SparkSegmentedGaugeSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = SegmentedGaugeScenarioSnapshotTests.allCases
        self.loadScenarios(scenarios)
    }

    // MARK: - Scenarios

    private func loadScenarios(_ scenarios: [SegmentedGaugeScenarioSnapshotTests]) {
        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration, scenario: scenario)
                    .sparkTheme(self.theme)
                    .sparkSegmentedGaugeAlignment(configuration.alignment)
                    .sparkSegmentedGaugeSegments(configuration.segments)
                    .sparkSegmentedGaugeSize(configuration.size)
                    .sparkSegmentedGaugeWithMarker(configuration.withMarker)
                    .segmentedGaugeType(configuration.type, theme: self.theme)
                    .frame(width: 300)
                    .padding(.horizontal, scenario.isDocumentation ? 14 : 50)
                    .padding(.vertical, scenario.isDocumentation ? 4 : 20)
                    .background(.background)
                    .fixedSize(horizontal: false, vertical: true)

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
    func component(
        _ configuration: SegmentedGaugeConfigurationSnapshotTests,
        scenario: SegmentedGaugeScenarioSnapshotTests
    ) -> some View {
        if configuration.title == .other,
           configuration.description == .other {
            SparkSegmentedGauge(
                titleLabel: {
                    self.customLabel(
                        forTitle: true,
                        scenario: scenario
                    )
                },
                descriptionLabel: {
                    self.customLabel(
                        forTitle: false,
                        scenario: scenario
                    )
                }
            )

        } else if let description = configuration.description.text,
                  configuration.title == .other {
            SparkSegmentedGauge(
                description,
                titleLabel: {
                    self.customLabel(
                        forTitle: true,
                        scenario: scenario
                    )
                }
            )
        } else if let title = configuration.title.text,
                  configuration.description == .other {
            SparkSegmentedGauge(
                title,
                descriptionLabel: {
                    self.customLabel(
                        forTitle: false,
                        scenario: scenario
                    )
                }
            )
        } else if configuration.title.text == nil,
                  configuration.description == .other {
            SparkSegmentedGauge(
                descriptionLabel: {
                    self.customLabel(
                        forTitle: false,
                        scenario: scenario
                    )
                }
            )
        } else if let title = configuration.title.text,
                  let description = configuration.description.text {
            SparkSegmentedGauge(
                title,
                description: description
            )

        } else if let description = configuration.description.text {
            SparkSegmentedGauge(
                description
            )
        } else {
            SparkSegmentedGauge(
                "Bad parameters"
            )
        }
    }

    // MARK: - Custom Content

    func customLabel(
        forTitle: Bool,
        scenario: SegmentedGaugeScenarioSnapshotTests
    ) -> some View {
        self.customLabelStack(scenario: scenario) {
            Text(forTitle ? "Welcome" : "The")

            Text(forTitle ? "on gauge" : "description")
                .font(forTitle ? .body : .footnote)
                .foregroundStyle(forTitle ? .red : .blue)
        }
    }

    @ViewBuilder
    func customLabelStack<Content>(
        scenario: SegmentedGaugeScenarioSnapshotTests,
        @ViewBuilder content: () -> Content
    ) -> some View where Content: View {
        if scenario.isDocumentation {
            HStack(
                alignment: .center,
                content: content
            )
        } else {
            VStack(
                alignment: .leading,
                content: content
            )
        }
    }
}

// MARK: - Extension

private extension View {

    func segmentedGaugeType(
        _ type: SegmentedGaugeTestingType,
        theme: any Theme
    ) -> some View {
        self.sparkSegmentedGaugeType(type.toType(theme))
    }
}
