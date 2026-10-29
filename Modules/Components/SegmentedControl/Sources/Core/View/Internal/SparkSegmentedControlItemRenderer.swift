//
//  SparkSegmentedControlItemRenderer.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 24/06/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

struct SparkSegmentedControlItemRenderer<Label>: View where Label: View {

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
        HStack(spacing: self.theme.layout.itemSpacing) {
            self.icon?
                .resizable()
                .scaledToFit()
                .segmentedControlItemContentColor()
                .segmentedControlItemIconFrame()

            self.label()
                .segmentedControlItemContentColor()
                .segmentedControlItemFont()
                .lineLimit(1)
        }
        .padding(self.theme.layout.itemPadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .segmentedControlItemBackground()
        .segmentedControlItemScaleEffect()
        .contentShape(Rectangle())
    }
}
