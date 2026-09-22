//
//  SparkUIDividerSnapshotTests.swift
//  SparkComponentDividerSnapshotTests
//
//  Created by robin.lemaire on 18/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SparkComponentDivider
@_spi(SI_SPI) import SparkComponentDividerTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
import SparkTheme

final class SparkUIDividerSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = DividerScenarioSnapshotTests.allCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()
            for configuration in configurations {
                let view = SparkUIDivider(
                    theme: self.theme
                )
                view.alignment = configuration.alignment
                view.axis = configuration.axis
                view.intent = configuration.intent
                view.content(configuration.content)

                NSLayoutConstraint.activate([
                    view.widthAnchor.constraint(greaterThanOrEqualToConstant: configuration.axis.width),
                    view.heightAnchor.constraint(greaterThanOrEqualToConstant: configuration.axis.height)
                ])

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                backgroundView.addSubview(view)
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
}

// MARK: - Extension

extension SparkUIDivider {

    func content(_ content: DividerContent) {
        if let text = content.text {
            self.text = text
        } else if content == .other {
            self.attributedText = .init(
                string: "Welcome\non Spark's divider",
                attributes: [
                    .foregroundColor: UIColor.red,
                    .font: UIFont.italicSystemFont(ofSize: 20),
                    .underlineStyle: NSUnderlineStyle.single.rawValue
                ]
            )
        }
    }
}
