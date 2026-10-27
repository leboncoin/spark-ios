//
//  SegmentedControlBorderViewModifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct SegmentedControlBorderViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content.sparkBorder(
            width: self.theme.border.width,
            radius: self.theme.border.radius,
            colorToken: self.theme.colors.border
        )
    }
}

extension View {

    func segmentedControlBorder() -> some View {
        self.modifier(SegmentedControlBorderViewModifier())
    }
}
