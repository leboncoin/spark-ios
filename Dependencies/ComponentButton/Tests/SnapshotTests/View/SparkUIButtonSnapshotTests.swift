//
//  SparkUIButtonSnapshotTests.swift
//  SparkComponentButtonSnapshotTests
//
//  Created by robin.lemaire on 19/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import UIKit
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentButton
import SparkTheming
import SparkTheme

final class SparkUIButtonSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = ButtonScenarioSnapshotTests.allCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {

                let view = self.component(configuration: configuration)

                let containerView = self.containerView(for: view, configuration: configuration)

                self.assertSnapshot(
                    matching: containerView,
                    named: configuration.name,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName
                )
            }
        }
    }

    // MARK: - Component Creation

    private func component(configuration: ButtonConfigurationSnapshotTests) -> SparkUIButton {
        let button = SparkUIButton(theme: self.theme)

        switch (configuration.titleType, configuration.iconType) {
        // Title only
        case (.native, .none):
            button.setTitle(.mock, for: .normal)

        case (.custom, .none):
            button.setAttributedTitle(.mock(text: .mock), for: .normal)

        // Icon only
        case (.none, .native), (.none, .custom):
            button.setImage(.mock, for: .normal)

        // Title and Icon - all combinations
        case (.native, .native), (.native, .custom):
            button.setTitle(.mock, for: .normal)
            button.setImage(.mock, for: .normal)

        case (.custom, .native), (.custom, .custom):
            button.setAttributedTitle(.mock(text: .mock), for: .normal)
            button.setImage(.mock, for: .normal)

        // None/None should not happen
        case (.none, .none):
            break
        }

        // Populate the button
        button.appearance = configuration.appearance
        button.intent = configuration.intent
        button.variant = configuration.variant
        button.shape = configuration.shape
        button.size = configuration.size
        button.alignment = configuration.alignment
        button.contentVisibility = configuration.contentVisibility
        button.removeStyles = configuration.removeStyles
        button.isEnabled = !configuration.isDisabled

        return button
    }

    // MARK: - Helper Methods

    private func containerView(
        for button: SparkUIButton,
        configuration: ButtonConfigurationSnapshotTests
    ) -> UIView {
        // Create container
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemBackground

        container.addSubview(button)

        NSLayoutConstraint.stickEdges(
            from: button,
            to: container,
            insets: .init(all: 10)
        )

        if configuration.isInfiniteWidth {
            container.widthAnchor.constraint(equalToConstant: 400).isActive = true
        }

        if configuration.removeStyles {
            container.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }

        return container
    }
}

// MARK: - UIImage Extension

private extension UIImage {
    static var mock: UIImage {
        UIImage(systemName: "heart.fill") ?? UIImage()
    }
}

// MARK: - NSAttributedString Extension

private extension NSAttributedString {

    static func mock(text: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.append(NSAttributedString(
            string: " (*)",
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize),
                .foregroundColor: UIColor.systemBlue
            ]
        ))
        return attributedString
    }
}
