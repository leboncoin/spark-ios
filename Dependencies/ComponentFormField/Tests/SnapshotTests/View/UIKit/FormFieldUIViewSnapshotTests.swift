//
//  FormFieldUIViewSnapshotTests.swift
//  SparkComponentFormFieldSnapshotTests
//
//  Created by robin.lemaire on 06/05/25.
//  Copyright © 2024 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentFormField
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SparkTheme

final class FormFieldUIViewSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Type Alias

    private typealias Constants = FormFieldSnapshotConstants

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = FormFieldScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {

                let component = UITextField()
                component.borderStyle = .roundedRect
                component.text = "Your username"

                let view = FormFieldUIView(
                    theme: self.theme,
                    component: component,
                    feedbackState: configuration.feedbackState,
                    title: configuration.titleType.value(from: .title),
                    helper: configuration.helperType.value(from: .helper),
                    isRequired: configuration.isRequired
                )

                view.clearButtonImage = .init(configuration.clearButtonImageName)
                view.helperImage = .init(configuration.helperImageName)

                if configuration.isCounter {
                    view.setCounter(
                        on: FormFieldSnapshotConstants.Counter.text,
                        limit: FormFieldSnapshotConstants.Counter.limit
                    )
                }

                view.backgroundColor = .systemBackground

                let backgroundView = UIView()
                backgroundView.backgroundColor = .secondarySystemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    backgroundView.widthAnchor.constraint(equalToConstant: Constants.maxWidth)
                ])
                backgroundView.addSubview(view)
                NSLayoutConstraint.stickEdges(
                    from: view,
                    to: backgroundView,
                    insets: .init(all: Constants.padding)
                )

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

private extension UIImage {

    convenience init?(_ imageName: String?) {
        guard let imageName else {
            return nil
        }

        self.init(systemName: imageName)
    }
}
