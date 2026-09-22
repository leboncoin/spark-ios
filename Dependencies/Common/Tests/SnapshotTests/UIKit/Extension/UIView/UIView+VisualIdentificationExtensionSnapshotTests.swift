//
//  UIView+VisualIdentificationExtensionSnapshotTests.swift
//  SparkCommon
//
//  Created by robin.lemaire on 29/07/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting

final class UIViewVisualIdentificationExtensionSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Tests

    func test_sparkVisualIdentification_when_toggle_is_true() {
        // GIVEN
        let featureTogglesService = SparkFeatureToggleServicingGeneratedMock()
        featureTogglesService.visualIdentification = true

        let view = TestView()
        view.contentStackView.sparkVisualIdentification(
            id: "1",
            featureTogglesService: featureTogglesService
        )

        // THEN
        self.assertSnapshot(
            matching: view,
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default,
            testName: #function
        )
    }

    func test_sparkVisualIdentification_when_toggle_is_false() {
        // GIVEN
        let featureTogglesService = SparkFeatureToggleServicingGeneratedMock()
        featureTogglesService.visualIdentification = false

        let view = TestView()
        view.contentStackView.sparkVisualIdentification(
            id: "2",
            featureTogglesService: featureTogglesService
        )

        // THEN
        self.assertSnapshot(
            matching: view,
            modes: ComponentSnapshotTestConstants.Modes.default,
            sizes: ComponentSnapshotTestConstants.Sizes.default,
            testName: #function
        )
    }
}

// MARK: - View

private final class TestView: UIView {

    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            UIView(),
            self.textView,
            UIView()
        ])
        stackView.axis = .horizontal
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(all: 10)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var textView: UIView = {
        let label = UILabel()
        label.backgroundColor = .yellow
        label.layer.cornerRadius = 4
        label.clipsToBounds = true
        label.text = "Hello World"
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init() {
        super.init(frame: .zero)

        self.backgroundColor = .white

        self.addSubview(self.contentStackView)

        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 120),
            self.heightAnchor.constraint(equalToConstant: 40),
        ])

        NSLayoutConstraint.center(
            from: self.contentStackView,
            to: self
        )
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
