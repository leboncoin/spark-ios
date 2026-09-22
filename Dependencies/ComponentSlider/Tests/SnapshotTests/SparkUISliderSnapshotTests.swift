//
//  SparkUISliderSnapshotTests.swift
//  SparkComponentSliderSnapshotTests
//
//  Created by robin.lemaire on 29/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import UIKit
import SnapshotTesting
import Combine
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentSlider
import SparkTheming
import SparkTheme

final class SparkUISliderSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = SliderScenarioSnapshotTests.allCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view = self.component(configuration: configuration)

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                backgroundView.addSubview(view)
                backgroundView.widthAnchor.constraint(equalToConstant: 300).isActive = true
                NSLayoutConstraint.stickEdges(
                    from: view,
                    to: backgroundView,
                    insets: .init(all: 4)
                )

                self.assertSnapshot(
                    matching: backgroundView,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName
                )
            }
        }
    }

    // MARK: - Component

    private func component(configuration: SliderConfigurationSnapshotTests) -> UIView {
        let slider = SparkUISlider(theme: self.theme)
        slider.intent = configuration.intent
        slider.value = 0.5
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.step = configuration.step ? 0.25 : nil
        slider.isFloatingValueLabel = configuration.isFloatingValue

        // Configure content based on configuration
        let title = "Title"
        let valueText = "50%"
        let minText = "Min"
        let maxText = "Max"

        switch (configuration.content, configuration.contentType) {
        case (.none, _):
            break

            // Title only

        case (.title, .text):
            slider.title = title

        case (.title, .custom):
            slider.attributedTitle = .mock(title)

            // Value only

        case (.value, .text):
            slider.valueText = valueText

        case (.value, .custom):
            slider.attributedValueText = .mock(valueText)

            // Range values

        case (.rangeValues, .text):
            slider.minimumRangeValueText = minText
            slider.maximumRangeValueText = maxText

        case (.rangeValues, .custom):
            slider.attributedMinimumRangeValueText = .mock(minText)
            slider.attributedMaximumRangeValueText = .mock(maxText)

            // Title & Value

        case (.titleAndValue, .text):
            slider.title = title
            slider.valueText = valueText

        case (.titleAndValue, .custom):
            slider.attributedTitle = .mock(title)
            slider.attributedValueText = .mock(valueText)

            // Title & Range values

        case (.titleAndRangeValues, .text):
            slider.title = title
            slider.minimumRangeValueText = minText
            slider.maximumRangeValueText = maxText

        case (.titleAndRangeValues, .custom):
            slider.attributedTitle = .mock(title)
            slider.attributedMinimumRangeValueText = .mock(minText)
            slider.attributedMaximumRangeValueText = .mock(maxText)

            // Value & Range values

        case (.valueAndRangeValues, .text):
            slider.valueText = valueText
            slider.minimumRangeValueText = minText
            slider.maximumRangeValueText = maxText

        case (.valueAndRangeValues, .custom):
            slider.attributedValueText = .mock(valueText)
            slider.attributedMinimumRangeValueText = .mock(minText)
            slider.attributedMaximumRangeValueText = .mock(maxText)

            // All values

        case (.allValues, .text):
            slider.title = title
            slider.valueText = valueText
            slider.minimumRangeValueText = minText
            slider.maximumRangeValueText = maxText

        case (.allValues, .custom):
            slider.attributedTitle = .mock(title)
            slider.attributedValueText = .mock(valueText)
            slider.attributedMinimumRangeValueText = .mock(minText)
            slider.attributedMaximumRangeValueText = .mock(maxText)
        }

        return slider
    }
}

// MARK: - Extension

private extension NSAttributedString {

    static func mock(_ text: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString()

        // Add value text
        let valueString = NSAttributedString(
            string: text,
            attributes: [
                .font: UIFont.systemFont(ofSize: 14)
            ]
        )
        attributedString.append(valueString)

        // Add percent symbol in bold and blue
        let percentString = NSAttributedString(
            string: "(%)",
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 14),
                .foregroundColor: UIColor.systemBlue
            ]
        )
        attributedString.append(percentString)

        return attributedString
    }
}
