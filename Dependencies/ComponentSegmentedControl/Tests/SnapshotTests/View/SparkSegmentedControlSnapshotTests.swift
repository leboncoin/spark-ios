//
//  SparkSegmentedControlSnapshotTests.swift
//  SparkComponentSegmentedControlSnapshotTests
//
//  Created by robin.lemaire on 25/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentSegmentedControl
import SparkResources
import SparkTheming
import SparkTheme

final class SparkSegmentedControlSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        // Remove animation
        let scenarios = SegmentedControlScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .frame(width: 300)
                    .padding(.vertical, 50)
                    .padding(.horizontal, 20)
                    .background(.background)
                    .sparkIsSnapshot(true)

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
    private func component(configuration: SegmentedControlConfigurationSnapshotTests) -> some View {
        switch configuration.contentType {
        case .icon: self.componentWithIcon(configuration: configuration)
        case .text: self.componentWithText(configuration: configuration)
        case .iconAndText: self.componentWithIconAndText(configuration: configuration)
        case .label: self.componentWithLabel(configuration: configuration)
        }
    }

    @ViewBuilder
    private func componentWithIcon(configuration: SegmentedControlConfigurationSnapshotTests) -> some View {
        @State var selection: Int = configuration.selectedIndex

        SparkSegmentedControl(selection: $selection) {
            ForEach(0..<configuration.items.count, id: \.self) { index in
                SparkSegmentedControlItem(
                    tag: index,
                    icon: self.icon(at: index)
                )
            }
        }
    }

    @ViewBuilder
    private func componentWithText(configuration: SegmentedControlConfigurationSnapshotTests) -> some View {
        @State var selection: Int = configuration.selectedIndex

        SparkSegmentedControl(selection: $selection) {
            ForEach(0..<configuration.items.count, id: \.self) { index in
                SparkSegmentedControlItem(
                    tag: index,
                    text: self.text(at: index)
                )
            }
        }
    }

    @ViewBuilder
    private func componentWithIconAndText(configuration: SegmentedControlConfigurationSnapshotTests) -> some View {
        @State var selection: Int = configuration.selectedIndex

        SparkSegmentedControl(selection: $selection) {
            ForEach(0..<configuration.items.count, id: \.self) { index in
                SparkSegmentedControlItem(
                    tag: index,
                    text: self.text(at: index),
                    icon: self.icon(at: index)
                )
            }
        }
    }

    @ViewBuilder
    private func componentWithLabel(configuration: SegmentedControlConfigurationSnapshotTests) -> some View {
        @State var selection: Int = configuration.selectedIndex

        SparkSegmentedControl(selection: $selection) {
            ForEach(0..<configuration.items.count, id: \.self) { index in
                SparkSegmentedControlItem(tag: index) {
                    VStack {
                        self.icon(at: index)
                        Text(self.text(at: index))
                        Text("subtitle")
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }

    // MARK: - Getter

    private func text(at index: Int) -> String {
        let texts = ["Day", "Week", "Month", "Year", "All", "None", "Other", "More"]
        return texts[index % texts.count]
    }

    private func icon(at index: Int) -> Image {
        let icons: [Image] = [
            Image(spark: \.addImageOutline),
            Image(spark: \.cameraOutline),
            Image(spark: \.copyOutline),
            Image(spark: \.imageOutline),
            Image(spark: \.starFill),
            Image(spark: \.warningOutline),
            Image(spark: \.export),
            Image(spark: \.check)
        ]
        return icons[index % icons.count]
    }
}
