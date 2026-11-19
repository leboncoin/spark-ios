//
//  PopoverForegroundViewModifier.swift
//  SparkComponentPopover
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct PopoverForegroundViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.popoverIntent) private var intent

    // MARK: - View

    func body(content: Content) -> some View {
        content.foregroundStyle(self.theme.colors.foreground(intent: self.intent))
    }
}

extension View {

    func popoverForeground() -> some View {
        self.modifier(PopoverForegroundViewModifier())
    }
}
