//
//  BorderRadiusComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 01/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

// MARK: - View

typealias BorderRadiusComponentUIViewController = ComponentDisplayViewControllerRepresentable<BorderRadiusConfiguration, BorderRadiusUIView, BorderRadiusConfigurationView, BorderRadiusComponentUIViewMaker, BorderRadiusExtraTools>

extension BorderRadiusComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.alone, .verticalList])
    }
}

// MARK: - View Maker

final class BorderRadiusComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = BorderRadiusConfiguration
    typealias ComponentView = BorderRadiusUIView
    typealias ConfigurationView = BorderRadiusConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, BorderRadiusComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = BorderRadiusExtraTools

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

final class BorderRadiusUIView: UIView {

    // MARK: - Properties

    var configuration: BorderRadiusComponentUIViewMaker.Configuration {
        didSet {
            self.updateStyle()
        }
    }

    // MARK: - Initialization

    init(configuration: BorderRadiusComponentUIViewMaker.Configuration) {
        self.configuration = configuration

        super.init(frame: .zero)

        self.backgroundColor = configuration.backgroundColor.uiColor

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
        if self.configuration.dash > 0 {
            self.sparkBorderRadius(
                width: self.configuration.width.value(from: self.configuration),
                radius: self.configuration.radius.value(from: self.configuration),
                dash: self.configuration.dash,
                colorToken: self.configuration.borderColor
            )
        } else {
            self.sparkBorderRadius(
                width: self.configuration.width.value(from: self.configuration),
                radius: self.configuration.radius.value(from: self.configuration),
                isHighlighted: self.configuration.isHighlighted,
                colorToken: self.configuration.borderColor
            )
        }
    }
}
