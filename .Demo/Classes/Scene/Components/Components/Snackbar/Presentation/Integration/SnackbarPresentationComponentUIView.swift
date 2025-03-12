//
//  SnackbarPresentationComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - View Controller

typealias SnackbarPresentationComponentUIViewController = ComponentDisplayViewControllerRepresentable<SnackbarPresentationConfiguration, UIButton, SnackbarPresentationConfigurationView, SnackbarPresentationComponentUIViewMaker>

extension SnackbarPresentationComponentUIViewController {

    init() {
        self.init(style: .alone, styles: [.alone])
    }
}

// MARK: - View Maker

final class SnackbarPresentationComponentUIViewMaker: ComponentUIViewMaker {

    // MARK: - Type Alias

    typealias Configuration = SnackbarPresentationConfiguration
    typealias ComponentView = UIButton
    typealias ConfigurationView = SnackbarPresentationConfigurationView
    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SnackbarPresentationComponentUIViewMaker>

    // MARK: - Properties

    weak var viewController: DisplayViewController?

    private var snackbar: SnackbarUIView = {
        let view = SnackbarUIView(
            theme: DemoThemes.shared.mainTheme.value,
            intent: .neutral
        )
        view.label.text = "Snackbar text"
        view.widthAnchor.constraint(lessThanOrEqualToConstant: 600).isActive = true

        let button = view.addButton()
        button.setTitle("Dismiss", for: .normal)
        button.addAction(.init(handler: { _ in
            view.dismiss(completion: { isFinished in
                // swiftlint:disable no_debugging_method
                print("Dismiss action", isFinished)
            })
        }), for: .touchUpInside)

        return view
    }()

    // MARK: - Methods

    func createComponentView(
        for configuration: Configuration
    ) -> ComponentView {
        let button = UIButton(configuration: .filled())
        button.setTitle("Show Snackbar", for: .normal)
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

    // MARK: - Actions

    private func actionHandler(for configuration: Configuration) {
        guard let viewController else {
            return
        }

        if let autoDismissDelay = configuration.autoDismissDelay {
            self.snackbar.showAndDismiss(
                in: viewController.view,
                from: configuration.direction,
                insets: .init(configuration),
                autoDismissDelay: autoDismissDelay
            ) { isFinished in
                // swiftlint:disable no_debugging_method
                print("Auto dismiss", isFinished)
            }
        } else {
            self.snackbar.show(
                in: viewController.view,
                from: configuration.direction,
                insets: .init(configuration)
            )
        }
    }

    // MARK: - Getter

    func isFullWidth() -> Bool {
        true
    }
}

// MARK: - Extension

private extension UIEdgeInsets {

    init(_ configuration: SnackbarPresentationComponentUIViewMaker.Configuration) {
        self = .init(
            top: configuration.topInsetString.cgFloat ?? 0,
            left: configuration.leftInsetString.cgFloat ?? 0,
            bottom: configuration.bottomInsetString.cgFloat ?? 0,
            right: configuration.rightInsetString.cgFloat ?? 0
        )
    }
}
