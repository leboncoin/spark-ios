//
//  DotIndicatorDotViewModifier.swift
//  SparkComponentDotIndicator
//
//  Created by Robin Lemaire on 24/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct DotIndicatorDotViewModifier: ViewModifier {

    // MARK: - Properties

    let isActive: Bool

    @Environment(\.theme) private var theme
    @Environment(\.dotIndicatorSize) private var size
    @Environment(\.dotIndicatorIntent) private var intent

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .foregroundStyle(self.theme.colors.dot(intent: self.intent, isActive: self.isActive))
            .sparkFrame(
                width: self.theme.size.dotWidth(size: self.size, isActive: self.isActive),
                height: self.theme.size.dotHeight(size: self.size)
            )
            .sparkCornerRadius(self.theme.border.radius)
    }
}

extension View {

    func dotIndicatorDot(isActive: Bool) -> some View {
        self.modifier(DotIndicatorDotViewModifier(isActive: isActive))
    }
}
