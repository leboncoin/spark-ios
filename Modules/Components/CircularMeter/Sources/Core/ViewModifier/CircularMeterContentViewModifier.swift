//
//  CircularMeterContentViewModifier.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct CircularMeterContentViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.circularMeterSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .font(self.theme.typography.content(size: self.size))
            .foregroundStyle(self.theme.colors.content)
    }
}

extension View {

    func circularMeterContent() -> some View {
        self.modifier(CircularMeterContentViewModifier())
    }
}
