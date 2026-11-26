//
//  DotsIndicatorLayoutViewModifier.swift
//  SparkComponentDotsIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct DotsIndicatorLayoutViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.dotsIndicatorSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        SparkHStack(spacing: self.theme.layout.spacing(size: self.size)) {
            content
        }
    }
}

extension View {

    func dotsIndicatorLayout() -> some View {
        self.modifier(DotsIndicatorLayoutViewModifier())
    }
}
