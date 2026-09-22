//
//  View+AccessibilityExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 27/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    @ViewBuilder
    func demoAccessibilityHidden<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) -> some View {
        if configuration.accessibilityLabel.showConfiguration {
            self.accessibilityHidden(configuration.accessibilityLabel.value.isEmpty)
        } else {
            self
        }
    }

    @ViewBuilder
    func demoAccessibilityLabel<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) -> some View {
        let value = configuration.accessibilityLabel.value
        if let value = value.nilIfEmpty {
            self.accessibilityLabel(value)
                .sparkAccessibilityLargeContentText(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func demoAccessibilityValue<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) -> some View {
        let value = configuration.accessibilityValue.value
        if let value = value.nilIfEmpty {
            self.accessibilityValue(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func demoAccessibilityHint<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) -> some View {
        let value = configuration.accessibilityHint.value
        if let value = value.nilIfEmpty {
            self.accessibilityHint(value)
        } else {
            self
        }
    }

    @ViewBuilder
    func demoAccessibilityShowsLargeContentViewer<Configuration: ComponentConfiguration>(
        _ configuration: Configuration,
        icon: Iconography?
    ) -> some View {
        let value = configuration.accessibilityLargeContentTitle.value
        if let value = value.nilIfEmpty {
            self.accessibilityShowsLargeContentViewer {
                Image(icon: icon)
                Text(value)
            }
        } else {
            self
        }
    }
}
