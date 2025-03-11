//
//  View+FrameExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 24/01/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    func demoFrame<Configuration: ComponentConfiguration>(
        _ configuration: Configuration
    ) -> some View {
        self.frame(
            width: configuration.swiftUIWidth.value(),
            height: configuration.height.value()
        )
        .frame(
            minWidth: configuration.swiftUIWidth.minValue(),
            maxWidth: configuration.swiftUIWidth.maxValue(),
            minHeight: configuration.height.minValue(),
            maxHeight: configuration.height.maxValue()
        )
    }
}
