//
//  SegmentedControlFrameViewModifier.swift
//  SparkComponentSegmentedControl
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct SegmentedControlFrameViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content.frame(minHeight: self.theme.size.minHeight)
    }
}

extension View {

    func segmentedControlFrame() -> some View {
        self.modifier(SegmentedControlFrameViewModifier())
    }
}
