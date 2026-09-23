//
//  CardComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 02/12/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias CardComponentUIViewController = ComponentDisplayViewControllerRepresentable<CardConfiguration, SparkUICard, CardConfigurationView, CardComponentUIViewMaker, CardExtraTools>

// MARK: - View Maker

final class CardComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = CardConfiguration
    typealias ComponentView = SparkUICard
    typealias ConfigurationView = CardConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, CardComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = CardExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let contentView = self.createContentView(for: configuration)
        let componentView = ComponentView(
            theme: configuration.theme.value,
            contentView: contentView
        )
        self.updateCommonProperties(componentView, for: configuration)

        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.theme = configuration.theme.value

        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.intent = configuration.intent
        componentView.isHighlightedStyle = configuration.isHighlighted
        componentView.isPadding = configuration.uiKitIsPadding
        componentView.variant = configuration.variant
        componentView.demoControlType(configuration, on: self.viewController)
        componentView.demoDisabled(configuration)
        componentView.demoAccessibility(configuration)
    }

    // MARK: - Subview

    private func createContentView(for configuration: Configuration) -> UIView {
        let contentView = ContentView(configuration: configuration)
        contentView.button.addAction(.init(handler: { _ in
            self.viewController?.showTapAlert(for: .action, name: "Button")
        }), for: .touchUpInside)
        return contentView
    }
}

// MARK: - Content

private final class ContentView: UIView {

    // MARK: - View

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.tagView,
            self.textStackView,
            self.button
        ])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = Spacing.medium.rawValue
        stackView.accessibilityElements = [
            self.tagView,
            self.titleLabel,
            self.descriptionLabel,
            self.button
        ]
        return stackView
    }()

    private lazy var tagView: UIView = {
        let maker = TagComponentUIViewMaker()
        return maker.createComponentView(for: self.configuration.tag)
    }()

    private lazy var textStackView: UIView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.titleLabel,
            self.descriptionLabel
        ])
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = Spacing.small.rawValue
        return stackView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome on Card"
        label.font = self.configuration.theme.value.typography.headline2.uiFont
        label.numberOfLines = 0
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the description of the card."
        label.font = self.configuration.theme.value.typography.body1.uiFont
        label.numberOfLines = 0
        return label
    }()

    lazy var button: ButtonComponentUIViewMaker.ComponentView = {
        let maker = ButtonComponentUIViewMaker()
        return maker.createComponentView(for: self.configuration.button)
    }()

    // MARK: - Properties

    var configuration: CardConfiguration

    // MARK: - Initialization

    init(configuration: CardConfiguration) {
        self.configuration = configuration

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

        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self
        )
    }
}
