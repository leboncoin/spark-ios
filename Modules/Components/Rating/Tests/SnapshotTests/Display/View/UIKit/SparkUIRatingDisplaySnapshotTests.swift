//
//  SparkUIRatingDisplaySnapshotTests.swift
//  SparkComponentRatingDisplayTests
//
//  Created by robin.lemaire on 12/01/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import SparkComponentRating
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
import SparkTheme

final class SparkUIRatingDisplaySnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() throws {
        let scenarios = RatingDisplayScenarioSnapshotTests.allCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()

            for configuration in configurations {
                let view: SparkUIRatingDisplay = .init(
                    theme: self.theme
                )
                view.value = configuration.value.rawValue
                view.size = configuration.size
                view.stars = configuration.stars
                view.text(configuration: configuration)

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

private extension SparkUIRatingDisplay {

    func text(configuration: RatingDisplayConfigurationSnapshotTests) {

        // Configure content based on configuration
        let value = configuration.value.formattedValue
        let count = "50"
        let additional = "Excellent"

        switch (configuration.content, configuration.contentType) {

            // Without values

        case (.none, _):
            break

            // Value only

        case (.value, .text):
            self.text = value

        case (.value, .custom):
            self.attributedText = .mock(value)

            // Value & Count

        case (.valueAndCount, .text):
            self.text = value
            self.countText = count

        case (.valueAndCount, .custom):
            self.attributedText = .mock(value)
            self.attributedCountText = .mock(count)

            // Value & Additional

        case (.valueAndAdditional, .text):
            self.text = value
            self.additionalText = additional

        case (.valueAndAdditional, .custom):
            self.attributedText = .mock(value)
            self.attributedAdditionalText = .mock(additional)

            // All Values

        case (.allValues, .text):
            self.text = value
            self.countText = count
            self.additionalText = additional

        case (.allValues, .custom):
            self.attributedText = .mock(value)
            self.attributedCountText = .mock(count)
            self.attributedAdditionalText = .mock(additional)
        }
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

        // Add a symbol in bold and blue
        let percentString = NSAttributedString(
            string: "!",
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 14),
                .foregroundColor: UIColor.systemBlue
            ]
        )
        attributedString.append(percentString)

        return attributedString
    }
}
