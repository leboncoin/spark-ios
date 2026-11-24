//
//  DotIndicatorOpacityViewModifier.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct DotIndicatorOpacityViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled

    // MARK: - View

    func body(content: Content) -> some View {
        content.opacity(self.theme.opacity.value(isEnabled: self.isEnabled))
    }
}

extension View {

    func dotIndicatorOpacity() -> some View {
        self.modifier(DotIndicatorOpacityViewModifier())
    }
}
