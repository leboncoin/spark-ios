//
//  SegmentedControlItemFontViewModifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct SegmentedControlItemFontViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.segmentedControlItemIsSelected) private var isSelected

    // MARK: - View

    func body(content: Content) -> some View {
        let fontToken = self.theme.typography.itemFontToken(isSelected: self.isSelected)

        content
            .font(fontToken)
            .optionalAnimation(
                .easeInOut(duration: SegmentedControlConstants.animationDuration),
                value: fontToken.font
            )
    }
}

extension View {

    func segmentedControlItemFont() -> some View {
        self.modifier(SegmentedControlItemFontViewModifier())
    }
}
