//
//  SnackbarPresentationComponentUIView.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
import SwiftUI

// TODO: Tox fix :
// - add intrinsic content size
// - no multiline on configuration view ...

// MARK: - View Controller

//typealias SnackbarPresentationComponentUIViewController = ComponentDisplayViewControllerRepresentable<SnackbarPresentationConfiguration, UIButton, SnackbarPresentationConfigurationView, SnackbarPresentationComponentUIViewMaker>
//
//// MARK: - View Maker
//
//final class SnackbarPresentationComponentUIViewMaker: ComponentUIViewMaker {
//
//    // MARK: - Type Alias
//
//    typealias Configuration = SnackbarPresentationConfiguration
//    typealias ComponentView = UIButton
//    typealias ConfigurationView = SnackbarPresentationConfigurationView
//    typealias DisplayViewController = ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, SnackbarPresentationComponentUIViewMaker>
//
//    // MARK: - Static Properties
//
//    static var fullWidth: Bool { false }
//
//    // MARK: - Static Methods
//
//    static func createComponentView(
//        for configuration: Configuration,
//        viewController: DisplayViewController?
//    ) -> ComponentView {
//
//
//        let button = UIButton(configuration: .filled())
//        button.setTitle("Show Snackbar", for: .normal)
//        button.addAction(.init(handler: { _ in
//            self.snackbar.show(
//                in: self.view,
//                from: self.direction,
//                insets: self.insets)
//        }), for: .touchUpInside)
//
////        self.updateCommonProperties(
////            componentView,
////            for: configuration,
////            viewController: viewController
////        )
//
//        return button
//    }
//
//    static func updateComponentView(
//        _ componentView: ComponentView,
//        for configuration: Configuration,
//        viewController: DisplayViewController?
//    ) {
//        guard let viewController else {
//            componentView.removeact
//        }
//        componentView.addAction(.init(handler: { _ in
//
//            if let autoDismissDelay = configuration.autoDismissDelay {
//                self.snackbar.showAndDismiss(
//                    in: self.view,
//                    from: self.direction,
//                    insets: self.insets,
//                    autoDismissDelay: autoDismissDelay
//                ) { isFinished in
//                        print("Auto dismiss", isFinished)
//                    }
//
//            } else {
//                self.snackbar.show(
//                    in: self.view,
//                    from: self.direction,
//                    insets: self.insets
//                )
//            }
//
//
//            self.snackbar.show(
//                in: self.view,
//                from: self.direction,
//                insets: self.insets
//            )
//        }), for: .touchUpInside)
//    }
//
//    private static func updateCommonProperties(
//        _ componentView: ComponentView,
//        for configuration: Configuration,
//        viewController: DisplayViewController?
//    ) {
//        componentView.alignment = configuration.alignment
//        componentView.textAlignment = configuration.uiKitTextAlignment
//        componentView.lineBreakMode = configuration.uiKitLineBreakMode
//        componentView.numberOfLines = configuration.numberOfLine
//        if configuration.isLongText {
//            componentView.textHighlightRange = configuration.getTextHighlightRange()
//        }
//        componentView.demoControlType(configuration, on: viewController)
//        componentView.demoAccessibilityLabel(configuration)
//        componentView.demoAccessibilityValue(configuration)
//        componentView.demoBackground(configuration)
//    }
//
//    private static func makeSnackbarView(for configuration: Configuration) -> SnackbarUIView {
//        return .init(
//            theme: configuration.theme.value,
//            intent: .basic
//        )
//    }
//}
