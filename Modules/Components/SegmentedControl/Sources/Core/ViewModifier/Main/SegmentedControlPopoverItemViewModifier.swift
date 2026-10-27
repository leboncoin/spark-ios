//
//  SegmentedControlPopoverItemViewModifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkTheming
@_spi(SI_SPI) import SparkCommon

private struct SegmentedControlPopoverItemViewModifier: ViewModifier {

    // MARK: - Properties

    let isSelected: Bool

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        let colors = self.theme.colors

        content
            .padding(.horizontal, self.theme.layout.accessibilityHorizontalPadding)
            .padding(.vertical, self.theme.layout.accessibilityVerticalPadding)
            .accessibilityItemColors(
                isSelected: self.isSelected,
                tintColorToken: colors.accessibilitySelectedTint,
                backgroundColorToken: colors.accessibilitySelectedBackground
            )
    }
}

// MARK: - Extension

private extension View {

    @ViewBuilder
    func accessibilityItemColors(
        isSelected: Bool,
        tintColorToken: any ColorToken,
        backgroundColorToken: any ColorToken
    ) -> some View {
        if isSelected {
            self.tint(tintColorToken)
                .background(backgroundColorToken)
        } else {
            self.tint(.primary)
        }
    }
}

extension View {

    func segmentedControlAccessibilityItem(isSelected: Bool) -> some View {
        self.modifier(SegmentedControlPopoverItemViewModifier(isSelected: isSelected))
    }
}
