//
//  AdaptativeStackComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias AdaptativeStackComponentUIViewController = ComponentDisplayViewControllerRepresentable<AdaptativeStackConfiguration, AdaptativeStackUIView, AdaptativeStackConfigurationView, AdaptativeStackComponentUIViewMaker, AdaptativeStackExtraTools>

extension AdaptativeStackComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class AdaptativeStackComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = AdaptativeStackConfiguration
    typealias ComponentView = AdaptativeStackUIView
    typealias ConfigurationView = AdaptativeStackConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, AdaptativeStackComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = AdaptativeStackExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        return .init(configuration: configuration)
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        componentView.configuration = configuration
    }
}

// MARK: - View

final class AdaptativeStackUIView: UIView {

    // MARK: - View

    private lazy var contentStackView: SparkAdaptiveUIStackView = {
        .init(arrangedSubviews: [
            self.text1Label,
            self.text2Label,
            self.text3Label
        ])
    }()

    private let text1Label = UILabel()
    private let text2Label = UILabel()
    private let text3Label = UILabel()

    // MARK: - Properties

    var configuration: AdaptativeStackComponentUIViewMaker.Configuration {
        didSet {
            self.update()
        }
    }

    // MARK: - Initialization

    init(configuration: AdaptativeStackComponentUIViewMaker.Configuration) {
        self.configuration = configuration

        super.init(frame: .zero)

        self.addSubview(self.contentStackView)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self
        )

        self.update()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Update

    private func update() {
        self.text1Label.text = self.configuration.text1
        self.text2Label.text = self.configuration.text2
        self.text3Label.text = self.configuration.text3

        self.contentStackView.spacing = self.configuration.spacing
        self.contentStackView.accessibilitySpacing = self.configuration.accessibilitySpacing
        self.contentStackView.regularAxis = self.configuration.axis.uiKit
        self.contentStackView.regularAlignment = self.configuration.alignment.uiKit
        self.contentStackView.accessibilityAxis = self.configuration.accessibilityAxis.uiKit
        self.contentStackView.accessibilityAlignment = self.configuration.accessibilityAlignment.uiKit
    }
}
