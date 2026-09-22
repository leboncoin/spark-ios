//
//  CornerRadiusComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias CornerRadiusComponentUIViewController = ComponentDisplayViewControllerRepresentable<CornerRadiusConfiguration, CornerRadiusUIView, CornerRadiusConfigurationView, CornerRadiusComponentUIViewMaker, CornerRadiusExtraTools>

extension CornerRadiusComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class CornerRadiusComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = CornerRadiusConfiguration
    typealias ComponentView = CornerRadiusUIView
    typealias ConfigurationView = CornerRadiusConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, CornerRadiusComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = CornerRadiusExtraTools

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

final class CornerRadiusUIView: UIView {

    // MARK: - Properties

    var configuration: CornerRadiusComponentUIViewMaker.Configuration {
        didSet {
            self.updateStyle()
        }
    }

    // MARK: - Initialization

    init(configuration: CornerRadiusComponentUIViewMaker.Configuration) {
        self.configuration = configuration

        super.init(frame: .zero)

        self.backgroundColor = self.configuration.backgroundColor.uiColor

        self.translatesAutoresizingMaskIntoConstraints = false

        self.heightAnchor.constraint(equalToConstant: configuration.contentSize.height).isActive = true
        self.widthAnchor.constraint(equalToConstant: configuration.contentSize.width).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()

        self.updateStyle()
    }

    // MARK: - Update

    private func updateStyle() {
        self.sparkCornerRadius(
            self.configuration.radius.value(from: self.configuration),
            isHighlighted: self.configuration.isHighlighted
        )
    }
}
