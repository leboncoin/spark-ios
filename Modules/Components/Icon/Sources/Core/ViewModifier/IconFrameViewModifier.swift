//
//  IconFrameViewModifier.swift
//  SparkComponentIcon
//
//  Created by robin.lemaire on 18/11/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct IconFrameViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.iconSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content.sparkFrame(size: self.theme.size.value(for: self.size))
    }
}

extension View {

    func iconFrame() -> some View {
        self.modifier(IconFrameViewModifier())
    }
}
