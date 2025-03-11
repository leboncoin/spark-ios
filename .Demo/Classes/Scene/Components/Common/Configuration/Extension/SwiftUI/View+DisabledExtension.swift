//
//  View+DisabledExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 30/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    func demoDisabled<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) -> some View {
        self.disabled(!configuration.isEnabled.value)
    }
}
