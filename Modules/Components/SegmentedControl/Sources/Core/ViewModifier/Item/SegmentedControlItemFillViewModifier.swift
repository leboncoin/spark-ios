//
//  SegmentedControlItemFillViewModifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct SegmentedControlItemFillViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.segmentedControlItemIsSelected) private var isSelected
    @Environment(\.segmentedControlItemIsPressed) private var isPressed

    // MARK: - View

    func body(content: Content) -> some View {
        let colorToken = self.theme.colors.itemBackground(
            isSelected: self.isSelected,
            isPressed: self.isPressed
        )

        content
            .background(colorToken)
            .optionalAnimation(
                .easeInOut(duration: SegmentedControlConstants.animationDuration),
                value: colorToken.color
            )
    }
}

extension View {

    func segmentedControlItemBackground() -> some View {
        self.modifier(SegmentedControlItemFillViewModifier())
    }
}
