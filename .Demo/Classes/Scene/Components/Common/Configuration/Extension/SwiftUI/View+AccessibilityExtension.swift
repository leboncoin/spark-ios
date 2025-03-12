//
//  View+AccessibilityExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    func demoAccessibilityLabel<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) -> some View {
        self.accessibilityLabel(configuration.accessibilityLabel.value)
    }

    func demoAccessibilityValue<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) -> some View {
        self.accessibilityValue(configuration.accessibilityValue.value)
    }
}
