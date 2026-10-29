//
//  CircularMeterInsidePaddingViewModifier.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct CircularMeterInsidePaddingViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.circularMeterSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content.sparkPadding(self.theme.size.gaugeStroke(for: self.size) + self.theme.layout.padding)
    }
}

extension View {

    func circularMeterInsidePadding() -> some View {
        self.modifier(CircularMeterInsidePaddingViewModifier())
    }
}
