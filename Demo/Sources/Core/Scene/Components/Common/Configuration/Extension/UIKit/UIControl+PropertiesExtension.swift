//
//  UIControl+PropertiesExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 11/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension UIControl {

    func demoDisabled<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        let value = configuration.isEnabled.value
        if self.isEnabled != value {
            self.isEnabled = value
        }
    }

    func demoSelected<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        let value = configuration.uiKitIsSelected.value
        if self.isSelected != value {
            self.isSelected = value
        }
    }
}
