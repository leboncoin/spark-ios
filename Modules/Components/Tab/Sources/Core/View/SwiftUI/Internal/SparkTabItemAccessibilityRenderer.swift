//
//  SparkTabItemAccessibilityRenderer.swift
//  SparkComponentTab
//
//  Created by robin.lemaire on 24/02/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

struct SparkTabItemAccessibilityRenderer<Label>: View where Label: View {

    // MARK: - Properties

    private let icon: Image?
    private let label: () -> Label

    @Environment(\.tabLayout) private var layout

    // MARK: - Initialization

    init(
        icon: Image? = nil,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.icon = icon
        self.label = label
    }

    // MARK: - View

    var body: some View {
        HStack(spacing: self.layout.spacing) {
            self.icon
            self.label()
        }
        .frame(maxWidth: .infinity)
    }
}
