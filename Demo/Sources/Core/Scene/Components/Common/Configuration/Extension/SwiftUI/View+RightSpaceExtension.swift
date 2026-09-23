//
//  View+RightSpaceExtension.swift
//  SparkDemo
//
//  Created by robin.lemaire on 26/02/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI

extension View {

    func demoRightSpace<Configuration: ComponentConfiguration>(_ configuration: Configuration) -> some View {
        self.modifier(
            RightSpaceViewModifier(configuration: configuration)
        )
    }
}

// MARK: - ViewModifier

struct RightSpaceViewModifier<Configuration: ComponentConfiguration>: ViewModifier {

    // MARK: - Properties

    let id: UUID = UUID()
    let configuration: Configuration

    // MARK: - View

    func body(content: Content) -> some View {
        if self.configuration.swiftUIIsMinWidth.value {
            HStack(spacing: .medium) {
                content
                    .fixedSize(horizontal: true, vertical: true)

                Rectangle()
                    .fill(.clear)
            }
        } else {
            content
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
