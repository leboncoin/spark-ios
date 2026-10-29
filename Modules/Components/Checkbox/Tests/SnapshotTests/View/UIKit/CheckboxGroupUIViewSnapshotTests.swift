//
//  CheckboxGroupUIViewSnapshotTests.swift
//  SparkComponentCheckboxSnapshotTests
//
//  Created by alican.aycil on 16.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import Testing
import UIKit

@testable import SparkComponentCheckbox
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

@MainActor
@Suite(.sparkConfiguration)
struct CheckboxGroupUIViewSnapshotTests: UIKitComponentSnapshotTesting {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    @Test("Checkbox group UIView snapshot", arguments: CheckboxGroupScenarioSnapshotTests.allCases)
    func test(scenario: CheckboxGroupScenarioSnapshotTests) async {
        let configurations = scenario.configuration()

        for (index, configuration) in configurations.enumerated() {

            let view = CheckboxGroupUIView(
                checkedImage: configuration.image,
                items: configuration.items,
                layout: configuration.axis,
                alignment: configuration.alignment,
                theme: self.theme,
                intent: configuration.intent,
                accessibilityIdentifierPrefix: "\(index)"
            )
            view.translatesAutoresizingMaskIntoConstraints = false

            let containerView = UIView()
            containerView.backgroundColor = UIColor.systemBackground
            containerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(view)

            NSLayoutConstraint.stickEdges(from: view, to: containerView)

            if configuration.axis == .vertical {
                containerView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width).isActive = true
            } else {
                containerView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.size.width).isActive = true
            }

            await self.assertSnapshot(
                matching: containerView,
                modes: configuration.modes,
                sizes: configuration.sizes,
                testName: configuration.testName()
            )
        }
    }
}
