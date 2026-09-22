//
//  SparkUIStepperSnapshotTests.swift
//  SparkComponentStepperSnapshotTests
//
//  Created by robin.lemaire on 30/11/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentStepper
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

final class SparkUIStepperSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = StepperScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations: [StepperConfigurationSnapshotTests] = try scenario.configuration()
            for configuration in configurations {
                let view: SparkUIStepper = .init(
                    theme: self.theme
                )
                view.value = configuration.state.value(from: configuration.range)
                view.minimumValue = configuration.range.lowerBound
                view.maximumValue = configuration.range.upperBound
                view.valueNumberFormatter(configuration)
                view.isEnabled = configuration.state.isEnabled()

                if let width = configuration.width {
                    NSLayoutConstraint.activate([
                        view.widthAnchor.constraint(equalToConstant: width)
                    ])
                }

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                backgroundView.addSubview(view)

                NSLayoutConstraint.stickEdges(from: view, to: backgroundView, insets: .init(all: 1))

                self.assertSnapshot(
                    matching: backgroundView,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }
}

// MARK: - Extension

private extension SparkUIStepper {

    func valueNumberFormatter(_ configuration: StepperConfigurationSnapshotTests) {
        switch configuration.contentResilience {
        case .currency:
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.currencyCode = "EUR"
            formatter.locale = Locale(identifier: "fr_FR")
            self.valueNumberFormatter = formatter

        case .percentage:
            let formatter = NumberFormatter()
            formatter.numberStyle = .percent
            formatter.locale = Locale(identifier: "en_US")
            self.valueNumberFormatter = formatter

        case .numberOnly:
            break
        }
    }
}
