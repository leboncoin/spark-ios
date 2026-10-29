//
//  CircularMeterValueViewModifier.swift
//  SparkComponentCircularMeter
//
//  Created by robin.lemaire on 27/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct CircularMeterValueViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.circularMeterSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .font(self.theme.typography.value(size: self.size))
            .foregroundStyle(self.theme.colors.value)
    }
}

extension View {

    func circularMeterValue() -> some View {
        self.modifier(CircularMeterValueViewModifier())
    }
}
