//
//  SnackbarComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias SnackbarComponentUIViewController = ComponentDisplayViewControllerRepresentable<SnackbarConfiguration, UIButton, SnackbarConfigurationView, SnackbarComponentUIViewMaker, SnackbarExtraTools>

extension SnackbarComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class SnackbarComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SnackbarConfiguration
    typealias ComponentView = UIButton
    typealias ConfigurationView = SnackbarConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SnackbarComponentUIViewMaker, ExtraTools>
    typealias ExtraTools = SnackbarExtraTools

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let button = UIButton(configuration: .filled())
        button.setTitle("Show snackbar", for: .normal)
        button.addAction(.init(handler: { [weak self] _ in
            self?.actionHandler(for: configuration)
        }), for: .touchUpInside)
        return button
    }

    func updateComponentView(
        _ componentView: ComponentView,
        for configuration: Configuration
    ) {
        // Nothing to do here
    }

    // MARK: - Snackbar

    private func snackbar(configuration: Configuration) -> SparkUISnackbar {
        let theme = DemoThemes.shared.mainTheme.value

        let snackbar = SparkUISnackbar(theme: theme)
        snackbar.intent = configuration.intent
        snackbar.alignment = configuration.alignment
        snackbar.icon = .init(icon: configuration.icon)
        snackbar.demoTitle(configuration)
        snackbar.demoMessage(configuration)
        snackbar.demoButton(configuration)
        snackbar.widthAnchor.constraint(lessThanOrEqualToConstant: 600).isActive = true

        let button = SparkUIButton(theme: theme)
        button.setTitle("Action", for: .normal)
        button.addAction(.init(handler: { _ in
            snackbar.dismiss(completion: { isFinished in
                // swiftlint:disable no_debugging_method
                print("Dismiss action", isFinished)
            })
        }), for: .touchUpInside)
        snackbar.button = button

        return snackbar
    }

    // MARK: - Actions

    private func actionHandler(for configuration: Configuration) {
        guard let viewController else {
            return
        }

        let snackbar = self.snackbar(configuration: configuration)

        if let autoDismissDelay = configuration.autoDismissDelay {
            snackbar.showAndDismiss(
                in: viewController.view,
                from: configuration.direction,
                animated: configuration.uiKitIsAnimated,
                autoDismissDelay: autoDismissDelay
            ) { isFinished in
                // swiftlint:disable no_debugging_method
                print("Auto dismiss", isFinished)
            }
        } else {
            snackbar.show(
                in: viewController.view,
                from: configuration.direction,
                animated: configuration.uiKitIsAnimated
            )
        }
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

// MARK: - Extension

private extension SparkUISnackbar {

    // MARK: - Setter

    func demoTitle(_ configuration: SnackbarConfiguration) {
        let text = configuration.title.nilIfEmpty

        if let text, configuration.uiKitIsAttributedTitle {
            self.attributedTitle = text.demoNSAttributedString
        } else {
            self.title = text
        }
    }

    func demoMessage(_ configuration: SnackbarConfiguration) {
        let text = configuration.message.nilIfEmpty

        if let text, configuration.uiKitIsAttributedMessage {
            self.attributedMessage = text.demoNSAttributedString
        } else {
            self.message = text
        }
    }

    func demoButton(_ configuration: SnackbarConfiguration) {
        guard configuration.hasButton else {
            self.button = nil
            return
        }

        let text = configuration.buttonTitle.nilIfEmpty ?? "Action"
        let button = SparkUIButton(theme: configuration.theme.value)
        button.setTitle(text, for: .normal)
        self.button = button
    }
}
