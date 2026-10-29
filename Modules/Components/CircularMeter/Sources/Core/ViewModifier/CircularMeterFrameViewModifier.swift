//
//  CircularMeterFrameViewModifier.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct CircularMeterFrameViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.circularMeterSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content.sparkFrame(size: self.theme.size.gaugeDiameter(for: self.size))
    }
}

extension View {

    func circularMeterFrame() -> some View {
        self.modifier(CircularMeterFrameViewModifier())
    }
}
