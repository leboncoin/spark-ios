//
//  UIView+AccessibilityExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 07/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import UIKit

extension UIView {

    func demoAccessibility<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        self.demoAccessibilityLabel(configuration)
        self.demoAccessibilityValue(configuration)
        self.demoAccessibilityHint(configuration)
        self.demoAccessibilityLargeContentTitle(configuration)
    }

    func demoAccessibilityLabel<Configuration: ComponentConfiguration>(
        _ configuration: Configuration,
        canSetNil: Bool = false
    ) {
        if let value = configuration.accessibilityLabel.value.nilIfEmpty {
            self.accessibilityLabel = value
        } else if canSetNil {
            self.accessibilityLabel = nil
        }
    }

    func demoAccessibilityValue<Configuration: ComponentConfiguration>(
        _ configuration: Configuration,
        canSetNil: Bool = false
    ) {
        if let value = configuration.accessibilityValue.value.nilIfEmpty {
            self.accessibilityValue = value
        } else if canSetNil {
            self.accessibilityValue = nil
        }
    }

    func demoAccessibilityHint<Configuration: ComponentConfiguration>(
        _ configuration: Configuration,
        canSetNil: Bool = false
    ) {
        if let value = configuration.accessibilityHint.value.nilIfEmpty {
            self.accessibilityHint = value
        } else if canSetNil {
            self.accessibilityHint = nil
        }
    }

    func demoAccessibilityLargeContentTitle<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        if let value = configuration.accessibilityLargeContentTitle.value.nilIfEmpty {
            self.largeContentTitle = value
        }
    }

    func demoIsAccessibilityElement<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) {
        self.isAccessibilityElement = !configuration.accessibilityLabel.value.isEmpty
    }
}
