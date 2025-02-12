//
//  UIControl+ComponentControlTypeExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Adevinta. All rights reserved.
//

import UIKit
@_spi(SI_SPI) import SparkCommon
import Combine

extension UIControl {

    func demoControlType<
        Configuration: ComponentConfiguration,
        ComponentView: UIView,
        ConfigurationView: ConfigurationUIViewable,
        ViewMaker: ComponentUIViewMaker
    >(
        _ configuration: Configuration,
        on viewController: ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ViewMaker>?
    ) {
        guard let viewController else {
            return
        }

        // Publisher ?
        if configuration.uiKitControlType.value == .publisher {
            viewController.componentControlSubcription = self.publisher(for: .touchUpInside).sink { _ in
                viewController.showTapAlert(for: .publisher)
            }
        } else {
            viewController.componentControlSubcription?.cancel()
            viewController.componentControlSubcription = nil
        }

        // Action ?
        if configuration.uiKitControlType.value == .action {
            self.addAction(viewController.componentAction, for: .touchUpInside)
        } else {
            self.removeAction(viewController.componentAction, for: .touchUpInside)
        }

        // Target ?
        if configuration.uiKitControlType.value == .target {
            self.addTarget(viewController, action: #selector(viewController.componentTouchUpInsideTarget), for: .touchUpInside)
        } else {
            self.removeTarget(viewController, action: #selector(viewController.componentTouchUpInsideTarget), for: .touchUpInside)
        }
    }
}
