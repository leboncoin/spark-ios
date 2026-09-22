//
//  UIView+RadiusExtensionSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 15/10/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting

final class UIViewRadiusExtensionSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Tests

    func test_sparkBorderRadius() {
        let widths: [Int] = [0, 4]
        let isHighlighteds = [true, false]

        for width in widths {
        for isHighlighted in isHighlighteds {
            let view = UIView.view
            view.sparkBorderRadius(
                width: CGFloat(width),
                radius: 12,
                isHighlighted: isHighlighted,
                colorToken: ColorTokenGeneratedMock.blue()
            )

            self.assertSnapshot(
                matching: view,
                modes: ComponentSnapshotTestConstants.Modes.default,
                sizes: ComponentSnapshotTestConstants.Sizes.default,
                testName: #function + "widthIs\(width)_isHighlightedIs\(isHighlighted)"
            )
        }
        }
    }

    func test_sparkBorderRadius_with_dash() {
        let widths: [Int] = [0, 4]
        let dashes: [Int] = [0, 10]

        for width in widths {
            for dash in dashes {
                let view = UIView.view
                view.sparkBorderRadius(
                    width: CGFloat(width),
                    radius: 12,
                    dash: CGFloat(dash),
                    colorToken: ColorTokenGeneratedMock.blue()
                )

                self.assertSnapshot(
                    matching: view,
                    modes: ComponentSnapshotTestConstants.Modes.default,
                    sizes: ComponentSnapshotTestConstants.Sizes.default,
                    testName: #function + "at\(dash)_widthIs\(width)"
                )
            }
        }
    }

    func test_sparkCornerRadius() {
        let values: [Bool?] = [true, false, nil]

        for value in values {
            let view = UIView.view
            var name: String
            if let value {
                view.sparkCornerRadius(12, isHighlighted: value)
                name = value ? "isHighlighted" : "notHighlighted"
            } else {
                view.sparkCornerRadius(12)
                name = "defaultHighlighted"
            }

            self.assertSnapshot(
                matching: view,
                modes: ComponentSnapshotTestConstants.Modes.default,
                sizes: ComponentSnapshotTestConstants.Sizes.default,
                testName: #function + name
            )
        }
    }
}

// MARK: - Extension

private extension UIView {

    static let view: UIView = {
        let label = UIView()
        label.backgroundColor = .yellow
        label.frame.size.width = 60
        label.frame.size.height = 30
        return label
    }()
}
