//
//  SparkSegmentedControlItemAccessibilityRenderer.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 25/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

struct SparkSegmentedControlItemAccessibilityRenderer<Label>: View where Label: View {

    // MARK: - Properties

    private let icon: Image?
    private let label: () -> Label

    @Environment(\.theme) private var theme

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
        HStack(spacing: self.theme.layout.spacing) {
            self.icon
            self.label()
        }
        .frame(maxWidth: .infinity)
    }
}
