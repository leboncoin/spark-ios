//
//  SegmentedControlItemContentViewModifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct SegmentedControlItemContentViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content.foregroundStyle(self.theme.colors.itemContent)
    }
}

extension View {

    func segmentedControlItemContentColor() -> some View {
        self.modifier(SegmentedControlItemContentViewModifier())
    }
}
