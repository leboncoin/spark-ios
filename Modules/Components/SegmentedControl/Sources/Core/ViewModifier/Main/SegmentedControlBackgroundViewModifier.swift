//
//  SegmentedControlBackgroundViewModifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct SegmentedControlBackgroundViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content.background(self.theme.colors.background)
    }
}

extension View {

    func segmentedControlBackground() -> some View {
        self.modifier(SegmentedControlBackgroundViewModifier())
    }
}
