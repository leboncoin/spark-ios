//
//  AdaptiveUIStackViewSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 28/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Testing
import UIKit
@testable import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting

@MainActor
@Suite(.sparkConfiguration)
struct AdaptiveUIStackViewSnapshotTests: UIKitComponentSnapshotTesting {

    // MARK: - Tests

    @Test("With default properties") func test_with_default_properties() async {
        let view = SparkAdaptiveUIStackView(arrangedSubviews: [
            UILabel.label1,
            UILabel.label2
        ])
        view.setStyle()

        await self.assertSnapshot(
            matching: view,
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }

    @Test("With override default properties") func test_with_override_default_properties() async {
        let view = SparkAdaptiveUIStackView(arrangedSubviews: [
            UILabel.label1,
            UILabel.label2
        ])
        view.setStyle()

        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .trailing
        view.spacing = 32

        await self.assertSnapshot(
            matching: view,
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }

    @Test("With regular and accessibilities properties") func test_with_regular_and_accessibilities_properties() async {
        let view = SparkAdaptiveUIStackView(arrangedSubviews: [
            UILabel.label1,
            UILabel.label2
        ])
        view.setStyle()

        view.regularAxis = .horizontal
        view.accessibilityAxis = .vertical

        view.regularDistribution = .fill
        view.accessibilityDistribution = .equalSpacing

        view.regularAlignment = .leading
        view.accessibilityAlignment = .trailing

        view.regularSpacing = 8
        view.accessibilitySpacing = 16

        await self.assertSnapshot(
            matching: view,
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }
}

// MARK: - Extension

private extension UILabel {

    static var label1: UILabel {
        let label = UILabel()
        label.text = "Hey"
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .yellow
        return label
    }

    static var label2: UILabel {
        let label = UILabel()
        label.text = "Bye"
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .green
        return label
    }
}

private extension UIView {

    func setStyle() {
        self.backgroundColor = .secondarySystemBackground
        self.frame.size.width = 200
        self.frame.size.height = 100
    }
}
