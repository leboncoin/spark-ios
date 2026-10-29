//
//  SegmentedControlItemRadiusViewModifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct SegmentedControlItemRadiusViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content.sparkCornerRadius(self.theme.border.selectedItemRadius)
    }
}

extension View {

    func segmentedControlItemCornerRadius() -> some View {
        self.modifier(SegmentedControlItemRadiusViewModifier())
    }
}
