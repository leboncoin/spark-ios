//
//  SegmentedControlOpacityViewModifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct SegmentedControlOpacityViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled

    // MARK: - View

    func body(content: Content) -> some View {
        content.opacity(self.theme.opacity.value(isEnabled: self.isEnabled))
    }
}

extension View {

    func segmentedControlOpacity() -> some View {
        self.modifier(SegmentedControlOpacityViewModifier())
    }
}
