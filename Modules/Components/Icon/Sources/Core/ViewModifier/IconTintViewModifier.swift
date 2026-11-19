//
//  IconTintViewModifier.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct IconTintViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.iconIntent) private var intent

    // MARK: - View

    func body(content: Content) -> some View {
        content.foregroundStyle(self.theme.colors.tint(intent: self.intent))
    }
}

extension View {

    func iconTint() -> some View {
        self.modifier(IconTintViewModifier())
    }
}
