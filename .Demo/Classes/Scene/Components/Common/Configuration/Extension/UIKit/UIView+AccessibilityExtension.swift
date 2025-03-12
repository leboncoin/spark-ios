//
//  UIView+AccessibilityExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 07/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension UIView {

    func demoAccessibilityLabel<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        self.accessibilityLabel = configuration.accessibilityLabel.value
    }

    func demoAccessibilityValue<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        self.accessibilityValue = configuration.accessibilityValue.value
    }
}
