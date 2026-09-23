//
//  AdaptiveUIStackViewSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 28/05/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting

final class AdaptiveUIStackViewSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Tests

    func test_with_default_properties() {
        let view = SparkAdaptiveUIStackView(arrangedSubviews: [
            UILabel.label1,
            UILabel.label2
        ])
        view.setStyle()

        self.assertSnapshot(
            matching: view,
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }

    func test_with_override_default_properties() {
        let view = SparkAdaptiveUIStackView(arrangedSubviews: [
            UILabel.label1,
            UILabel.label2
        ])
        view.setStyle()

        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .trailing
        view.spacing = 32

        self.assertSnapshot(
            matching: view,
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }

    func test_with_regular_and_accessibilities_properties() {
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

        self.assertSnapshot(
            matching: view,
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.all
        )
    }
}

// MARK: - Extension

private extension UILabel {

    static let label1: UILabel = {
        let label = UILabel()
        label.text = "Hey"
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .yellow
        return label
    }()

    static let label2: UILabel = {
        let label = UILabel()
        label.text = "Bye"
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .green
        return label
    }()
}

private extension UIView {

    func setStyle() {
        self.backgroundColor = .secondarySystemBackground
        self.frame.size.width = 200
        self.frame.size.height = 100
    }
}
