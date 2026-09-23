//
//  SparkUICardSnapshotTests.swift
//  SparkComponentCardSnapshotTests
//
//  Created by robin.lemaire on 01/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SparkComponentCard
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting
import SparkTheming
import SparkTheme

final class SparkUICardSnapshotTests: UIKitComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let scenarios = CardScenarioSnapshotTests.uiKitAllCases.filter {
            $0 != .documentation
        }

        for scenario in scenarios {
            let configurations = scenario.configuration()
            for configuration in configurations {
                let card = SparkUICard(
                    theme: self.theme,
                    contentView: ContentView(theme: self.theme)
                )
                card.intent = configuration.intent
                card.isHighlightedStyle = configuration.isHighlighted
                card.isPadding = configuration.padding.isPadding
                card.variant = configuration.variant
                card.isEnabled = !configuration.isDisabled

                let backgroundView = UIView()
                backgroundView.backgroundColor = .gray
                backgroundView.translatesAutoresizingMaskIntoConstraints = false
                backgroundView.addSubview(card)

                NSLayoutConstraint.stickEdges(
                    from: card,
                    to: backgroundView,
                    insets: .init(all: 20)
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

// MARK: - Content

private final class ContentView: UIView {

    // MARK: - View

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.iconImageView,
            self.textStackView,
            UIView(),
            self.button
        ])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 16
        return stackView
    }()

    private lazy var iconImageView: UIImageView = {
        let icon = UIImageView(image: .mock)
        icon.tintColor = .blue
        return icon
    }()

    private lazy var textStackView: UIView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.titleLabel,
            self.descriptionLabel
        ])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome on Card"
        label.font = self.theme.typography.headline2.uiFont
        label.numberOfLines = 0
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the description of the card."
        label.font = self.theme.typography.body1.uiFont
        label.numberOfLines = 0
        return label
    }()

    private let button: UIButton = {
        let label = UIButton(configuration: .filled())
        label.setTitle("Button", for: .normal)
        return label
    }()

    // MARK: - Properties

    var theme: any Theme

    // MARK: - Initialization

    init(theme: any Theme) {
        self.theme = theme

        super.init(frame: .zero)

        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    func setupView() {
        self.isUserInteractionEnabled = false
        self.addSubview(self.contentStackView)

        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.size(
            CardConstantsSnapshotsTests.size,
            from: self
        )

        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self
        )

        self.iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.size(
            .init(width: 24, height: 24),
            from: self.iconImageView
        )
    }
}

private extension UIImage {
    static var mock = UIImage(systemName: "person.2.circle.fill") ?? UIImage()
}
