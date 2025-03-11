//
//  MicroAnimationComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 05/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias MicroAnimationComponentUIViewController = ComponentDisplayViewControllerRepresentable<MicroAnimationConfiguration, MicroAnimationContentUIView, MicroAnimationConfigurationView, MicroAnimationComponentUIViewMaker>

extension MicroAnimationComponentUIViewController {

    init() {
        self.init(style: .verticalList, styles: [.verticalList])
    }
}

// MARK: - View Maker

final class MicroAnimationComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = MicroAnimationConfiguration
    typealias ComponentView = MicroAnimationContentUIView
    typealias ConfigurationView = MicroAnimationConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, MicroAnimationComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let componentView = ComponentView(configuration: configuration)
        self.updateCommonProperties(componentView, for: configuration)
        return componentView
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        self.updateCommonProperties(componentView, for: configuration)
    }

    private func updateCommonProperties(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        let infoText = configuration.type.name + " | " + configuration.getInfo()
        configuration.uiKitInfoLabel?.text = infoText
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }

    func isInfoLabel() -> Bool {
        true
    }
}

// MARK: - Content View

final class MicroAnimationContentUIView: UIView {

    // MARK: - Components

    private lazy var contentStackView: UIStackView = {
        let animationStackView = UIStackView(arrangedSubviews: [
            self.iconView,
            self.iconButton,
            self.button,
            UIView()
        ])
        animationStackView.axis = .horizontal
        animationStackView.alignment = .center
        animationStackView.distribution = .fillProportionally
        animationStackView.spacing = Spacing.medium.rawValue

        let parentStackView = UIStackView(arrangedSubviews: [
            animationStackView,
            self.startButton
        ])
        parentStackView.axis = .vertical
        return parentStackView
    }()

    private lazy var iconView: IconUIView = {
        let maker = IconComponentUIViewMaker()

        return maker.createComponentView(
            for: self.configuration.bellConfiguration.iconConfiguration
        )
    }()

    private lazy var iconButton: IconButtonUIView = {
        let maker = IconButtonComponentUIViewMaker()

        return maker.createComponentView(
            for: self.configuration.bellConfiguration.iconButtonConfiguration
        )
    }()

    private lazy var button: ButtonUIView = {
        let maker = ButtonComponentUIViewMaker()

        return maker.createComponentView(
            for: self.configuration.bellConfiguration.buttonConfiguration
        )
    }()

    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.addAction(.init(handler: { [weak self] _ in
            guard let self else { return }
            button.isEnabled = false

            UIView.animate(
                type: .bell,
                on: [
                    self.iconView,
                    self.iconButton,
                    self.button.imageView
                ],
                repeat: self.configuration.getRepeat(),
                completion: { _ in
                    if !self.configuration.isIndefinitely  {
                        button.isEnabled = true
                    }
                })

        }), for: .touchUpInside)
        return button
    }()

    private let image = UIImage(systemName: "bell")

    // MARK: - Properties

    private let configuration: MicroAnimationConfiguration

    // MARK: - Initialization

    init(configuration: MicroAnimationConfiguration) {
        self.configuration = configuration

        super.init(frame: .zero)

        // Setup View
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup Views

    private func setupView() {
        // Subviews
        self.addSubview(self.contentStackView)

        // Constraints
        self.contentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.stickEdges(
            from: self.contentStackView,
            to: self
        )
    }

    // MARK: - Action

    func reset() {
        self.startButton.isEnabled = true
    }
}
