//
//  SparkUISnackbarSnapshotTests.swift
//  SparkComponentSnackbarSnapshotTests
//
//  Created by robin.lemaire on 20/05/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import UIKit
import SnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
@testable import SparkComponentSnackbar
import SparkComponentButton
import SparkTheming
import SparkTheme

final class SparkUISnackbarSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = SnackbarScenario.allCases.filter {
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

    private func component(configuration: SnackbarScenarioConfiguration) -> SparkUISnackbar {
        let snackbar = SparkUISnackbar(theme: self.theme)
        snackbar.intent = configuration.intent
        snackbar.alignment = configuration.alignment

        // Set icon
        if configuration.hasIcon {
            snackbar.icon = .mock
        }

        // Set title
        switch configuration.titleContent {
        case .none:
            break
        case .text:
            snackbar.title = .mock
        case .label:
            snackbar.attributedTitle = .mock(text: .mock)
        }

        // Set description
        switch configuration.descriptionContent {
        case .text:
            snackbar.message = .longMock
        case .label:
            snackbar.attributedMessage = .mock(text: .longMock)
        }

        // Set button
        if configuration.hasButton {
            let button = SparkUIButton(theme: self.theme)
            button.setTitle("Action", for: .normal)
            button.variant = .ghost
            snackbar.button = button
        }

        return snackbar
    }

    // MARK: - Helper Methods

    private func containerView(
        for snackbar: SparkUISnackbar,
        configuration: SnackbarScenarioConfiguration
    ) -> UIView {
        // Create container
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.widthAnchor.constraint(equalToConstant: 375).isActive = true
        container.backgroundColor = .systemBackground

        container.addSubview(snackbar)

        NSLayoutConstraint.stickEdges(
            from: snackbar,
            to: container,
            insets: .init(all: 10)
        )

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
