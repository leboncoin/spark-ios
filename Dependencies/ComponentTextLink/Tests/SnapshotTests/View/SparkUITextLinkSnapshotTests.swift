//
//  SparkUITextLinkSnapshotTests.swift
//  SparkComponentTextLinkSnapshotTests
//
//  Created by robin.lemaire on 28/11/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SparkComponentTextLink
@_spi(SI_SPI) import SparkComponentTextLinkTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
import SparkTheme

final class SparkUITextLinkSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = TextLinkScenarioSnapshotTests.allCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()
            for configuration in configurations {
                let view = SparkUITextLink(
                    theme: self.theme
                )
                view.text = configuration.text.value
                view.image = configuration.isImage ? .icon : nil
                view.alignment = configuration.alignment
                view.textHighlightRange = configuration.text.highlightRange(isRange: configuration.isRange)
                view.intent = configuration.intent.toType(self.theme)
                view.typography = configuration.typography
                view.variant = configuration.variant
                view.textLabel.textAlignment = configuration.textAlignment.toRealType
                view.textLabel.numberOfLines = configuration.singleLine ? 1 : 0

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

private extension UIImage {
    static let icon = IconographyTests.shared.checkmark
}

private extension TextLinkTextAlignment {

    var toRealType: NSTextAlignment {
        switch self {
        case .leading: .left
        case .trailing: .right
        case .center, .default: .center
        }
    }
}

