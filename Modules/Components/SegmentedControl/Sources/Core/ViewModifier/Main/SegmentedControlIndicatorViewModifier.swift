//
//  SegmentedControlIndicatorViewModifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct SegmentedControlIndicatorViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content.sparkBorder(
            width: self.theme.border.selectedItemWidth,
            radius: self.theme.border.selectedItemRadius,
            colorToken: self.theme.colors.selectedItemBorder
        )
    }
}

extension View {

    func segmentedControlSelectedItemBorder() -> some View {
        self.modifier(SegmentedControlIndicatorViewModifier())
    }
}
