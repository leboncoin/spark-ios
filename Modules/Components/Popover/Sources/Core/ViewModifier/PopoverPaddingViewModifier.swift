//
//  PopoverPaddingViewModifier.swift
//  SparkComponentPopover
//
//  Created by Robin Lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct PopoverPaddingViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .sparkPadding(.vertical, self.theme.layout.verticalPadding)
            .sparkPadding(.horizontal, self.theme.layout.horizontalPadding)
    }
}

extension View {

    func popoverPadding() -> some View {
        self.modifier(PopoverPaddingViewModifier())
    }
}
