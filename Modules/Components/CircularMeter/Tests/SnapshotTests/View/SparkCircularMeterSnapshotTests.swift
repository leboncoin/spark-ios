//
//  SparkCircularMeterSnapshotTests.swift
//  SparkComponentCircularMeterSnapshotTests
//
//  Created by robin.lemaire on 27/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentCircularMeter
import SparkResources
import SparkTheming
import SparkTheme

final class SparkCircularMeterSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = CircularMeterScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTheme(self.theme)
                    .sparkCircularMeterIntent(configuration.intent)
                    .sparkCircularMeterSize(configuration.size)
                    .frame(height: configuration.size.size)
                    .frame(minWidth: configuration.size.size)
                    .padding(20)
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

    // MARK: - Component

    @ViewBuilder
    private func component(configuration: CircularMeterConfigurationSnapshotTests) -> some View {
        switch configuration.displayType {
        case .text:
            self.componentWithText(configuration: configuration)

        case .icon:
            self.componentWithIcon(configuration: configuration)

        case .image:
            self.componentWithImage(configuration: configuration)
        }
    }

    @ViewBuilder
    private func componentWithText(configuration: CircularMeterConfigurationSnapshotTests) -> some View {
        switch (configuration.isText, configuration.isContent, configuration.labelsType) {
        case (true, true, .native):
            SparkCircularMeter(
                value: configuration.value,
                valueText: configuration.value.stringMock,
                contentText: .contentMock
            )

        case (true, true, .custom):
            SparkCircularMeter(
                value: configuration.value,
                valueLabel: {
                    CustomLabelView(text: configuration.value.stringMock)
                },
                contentLabel: {
                    CustomLabelView(text: .contentMock)
                }
            )

        case (true, false, .native):
            SparkCircularMeter(
                value: configuration.value,
                valueText: configuration.value.stringMock
            )

        case (true, false, .custom):
            SparkCircularMeter(
                value: configuration.value,
                valueLabel: {
                    CustomLabelView(text: configuration.value.stringMock)
                }
            )

        case (false, _, _):
            SparkCircularMeter(value: configuration.value)
        }
    }

    @ViewBuilder
    private func componentWithIcon(configuration: CircularMeterConfigurationSnapshotTests) -> some View {
        switch (configuration.isContent, configuration.labelsType) {
        case (true, .native):
            SparkCircularMeter(
                value: configuration.value,
                icon: .mock,
                contentText: .contentMock
            )

        case (true, .custom):
            SparkCircularMeter(
                value: configuration.value,
                icon: .mock,
                contentLabel: {
                    CustomLabelView(text: .contentMock)
                }
            )

        case (false, _):
            SparkCircularMeter(
                value: configuration.value,
                icon: .mock
            )
        }
    }

    @ViewBuilder
    private func componentWithImage(configuration: CircularMeterConfigurationSnapshotTests) -> some View {
        SparkCircularMeter(
            value: configuration.value,
            image: .mockImage
        )
    }
}

// MARK: - Extension

private extension CircularMeterSize {

    var size: CGFloat {
        switch self {
        case .small: 50
        case .medium: 50
        case .large: 80
        case .xLarge: 200
        }
    }
}

private extension String {

    static var contentMock: String {
        return "Label"
    }
}

private extension Double {

    var stringMock: String {
        return "\(Int(self * 100))%"
    }
}

private extension Image {
    static var mock: Image {
        Image(spark: \.playOutline)
    }

    static var mockImage: Image {
        Image(.mock)
    }
}

private struct CustomLabelView: View {
    let text: String

    var body: some View {
        HStack {
            Text(self.text)
            Text("*")
                .bold()
                .foregroundColor(.blue)
        }
    }
}
