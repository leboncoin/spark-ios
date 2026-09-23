//
//  SparkUIChipSnapshotTests.swift
//  SparkComponentChipSnapshotTests
//
//  Created by robin.lemaire on 02/09/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SparkComponentChip
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
import SparkTheme

final class SparkUIChipSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = ChipScenarioSnapshotTests.allCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()
            for configuration in configurations {
                let view = SparkUIChip(
                    theme: self.theme
                )
                view.alignment = configuration.alignment
                view.intent = configuration.intent
                view.variant = configuration.variant
                view.size = configuration.size
                view.isSelected = configuration.isSelected
                view.isEnabled = !configuration.isDisabled

                if let text = configuration.label.text {
                    view.text = text
                } else if configuration.label == .other {
                    view.attributedText = .init(
                        string: "Welcome\non Spark's chip",
                        attributes: [
                            .foregroundColor: UIColor.red,
                            .font: UIFont.italicSystemFont(ofSize: 20),
                            .underlineStyle: NSUnderlineStyle.single.rawValue
                        ]
                    )
                }

                if configuration.isIcon {
                    view.icon = IconographyTests.shared.arrow
                }

                if configuration.isBadge {
                    let extraContent = UILabel()
                    extraContent.text = "99"
                    extraContent.textColor = .blue
                    extraContent.font = .boldSystemFont(ofSize: 14)
                    extraContent.adjustsFontForContentSizeCategory = true
                    extraContent.backgroundColor = .yellow
                    extraContent.layer.cornerRadius = 4
                    extraContent.layer.masksToBounds = true

                    view.extraContent = extraContent
                }

                let backgroundView = UIView()
                backgroundView.backgroundColor = .systemBackground
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                backgroundView.addSubview(view)
                NSLayoutConstraint.stickEdges(
                    from: view,
                    to: backgroundView,
                    insets: .init(all: scenario.isDocumentation ? 4 : 20)
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
