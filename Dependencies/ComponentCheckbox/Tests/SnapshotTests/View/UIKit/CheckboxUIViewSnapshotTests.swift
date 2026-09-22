//
//  CheckboxUIViewSnapshotTests.swift
//  SparkComponentCheckboxSnapshotTests
//
//  Created by alican.aycil on 12.01.24.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit

@testable import SparkComponentCheckbox
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheming
import SparkTheme

final class CheckboxUIViewSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = CheckboxScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {

                let view = CheckboxUIView(
                    theme: self.theme,
                    intent: configuration.intent,
                    text: configuration.textType.value,
                    checkedImage: configuration.image,
                    isEnabled: configuration.state == .disabled ? false : true,
                    selectionState: configuration.selectionState,
                    alignment: configuration.alignment
                )
                view.backgroundColor = UIColor.systemBackground

                NSLayoutConstraint.activate([
                    view.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.size.width)
                ])

                if configuration.state == .pressed {
                    view.isHighlighted = true

                    let containerView = UIView()
                    containerView.translatesAutoresizingMaskIntoConstraints = false
                    containerView.addSubview(view)

                    NSLayoutConstraint.activate([
                        view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
                        view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
                        view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
                        view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5)
                    ])

                    self.assertSnapshot(
                        matching: containerView,
                        modes: configuration.modes,
                        sizes: configuration.sizes,
                        testName: configuration.testName()
                    )
                } else {
                    self.assertSnapshot(
                        matching: view,
                        modes: configuration.modes,
                        sizes: configuration.sizes,
                        testName: configuration.testName()
                    )
                }
            }
        }
    }
}
