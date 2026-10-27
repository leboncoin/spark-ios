//
//  CircularMeterIconViewModifier.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct CircularMeterIconViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.circularMeterSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .foregroundStyle(self.theme.colors.icon)
            .sparkFrame(size: self.theme.size.icon(for: self.size))
    }
}

extension View {

    func circularMeterIcon() -> some View {
        self.modifier(CircularMeterIconViewModifier())
    }
}
