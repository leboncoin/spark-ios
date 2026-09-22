//
//  UIControl+ComponentControlTypeExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 10/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit
@_spi(SI_SPI) import SparkCommon
import Combine

extension UIControl {

    func demoControlType<
        Configuration: ComponentConfiguration,
        ComponentView: UIView,
        ConfigurationView: ConfigurationUIViewable,
        ViewMaker: ComponentUIViewMaker,
        ExtraTools: ComponentExtraTools
    >(
        _ configuration: Configuration,
        event: UIControl.Event = .touchUpInside,
        on viewController: ComponentDisplayViewController<Configuration, ComponentView, ConfigurationView, ViewMaker, ExtraTools>?
    ) {
        guard let viewController else {
            return
        }

        let controlType = configuration.uiKitControlType.value

        // Publisher ?
        if controlType == .publisher {
            viewController.componentTapControlSubcription = self.publisher(for: .touchUpInside).sink { _ in
                viewController.showTapAlert(for: .publisher)
            }
        } else {
            viewController.componentTapControlSubcription?.cancel()
            viewController.componentTapControlSubcription = nil
        }

        // Action ?
        if controlType == .action {
            self.addAction(viewController.componentAction, for: event)
        } else {
            self.removeAction(viewController.componentAction, for: event)
        }

        // Target ?
        if controlType == .target {
            self.addTarget(
                viewController,
                action: #selector(viewController.componentTouchUpInsideAction),
                for: event
            )
        } else {
            self.removeTarget(
                viewController,
                action: #selector(viewController.componentTouchUpInsideAction),
                for: event
            )
        }

        // Toggle ?
        if controlType == .toggle {
            viewController.componentToggleAction = UIAction { [weak self] _ in
                guard controlType == .toggle else { return }
                self?.isSelected.toggle()
                configuration.uiKitIsSelected.value.toggle()
            }
            self.addAction(viewController.componentToggleAction, for: event)
        } else {
            self.removeAction(viewController.componentToggleAction, for: event)
        }
    }
}
