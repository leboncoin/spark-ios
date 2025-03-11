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
        self.isEnabled = configuration.isEnabled.value
    }

    func demoSelected<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        self.isSelected = configuration.uiKitIsSelected.value
    }
}
