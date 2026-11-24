//
//  DotIndicatorLayoutViewModifier.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct DotIndicatorLayoutViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.dotIndicatorSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        SparkHStack(spacing: self.theme.layout.spacing(size: self.size)) {
            content
        }
    }
}

extension View {

    func dotIndicatorLayout() -> some View {
        self.modifier(DotIndicatorLayoutViewModifier())
    }
}
