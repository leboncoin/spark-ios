//
//  SegmentedControlItemScaleViewModifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct SegmentedControlItemScaleViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.segmentedControlItemIsPressed) private var isPressed

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .scaleEffect(self.theme.scaleEffect.item(isPressed: self.isPressed))
            .optionalAnimation(
                .easeInOut(duration: SegmentedControlConstants.animationDuration),
                value: self.isPressed
            )
    }
}

extension View {

    func segmentedControlItemScaleEffect() -> some View {
        self.modifier(SegmentedControlItemScaleViewModifier())
    }
}
