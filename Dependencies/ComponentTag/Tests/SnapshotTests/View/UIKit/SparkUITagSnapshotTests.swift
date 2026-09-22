//
//  SparkUITagSnapshotTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 07/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
import SparkTheme

final class SparkUITagSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = TagScenarioSnapshotTests.allCases

        for scenario in scenarios {
            let configurations = scenario.configuration(isSwiftUIComponent: false)
            for configuration in configurations {

                let view: SparkUITag = .init(
                    theme: self.theme
                )
                view.intent = configuration.intent
                view.size = configuration.size
                view.variant = configuration.variant
                view.isHighlighted = configuration.isHighlighted
                view.icon = configuration.isIcon ? .mock : nil
                view.text(configuration: configuration)
                view.translatesAutoresizingMaskIntoConstraints = false
                if let width = configuration.width {
                    view.widthAnchor.constraint(equalToConstant: width).isActive = true
                }

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                backgroundView.addSubview(view)
                NSLayoutConstraint.stickEdges(
                    from: view,
                    to: backgroundView,
                    insets: .init(all: 2)
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

private extension SparkUITag {

    func text(configuration: TagConfigurationSnapshotTests) {
        switch configuration.content {
        case .other:
            let customAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.blue,
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ]

            let attributedString = NSMutableAttributedString(
                string: "Spark's Tag"
            )
            attributedString.addAttributes(
                customAttributes,
                range: .init(location: 8, length: 3)
            )

            self.attributedText = attributedString
        default:
            self.text = configuration.content.text ?? (configuration.isIcon ? nil : "Unknow")
        }
    }
}

private extension UIImage {
    static var mock = UIImage(systemName: "person.2.circle.fill") ?? UIImage()
}
