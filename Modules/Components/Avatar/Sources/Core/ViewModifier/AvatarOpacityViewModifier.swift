//
//  AvatarOpacityViewModifier.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 14/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct AvatarOpacityViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled

    // MARK: - View

    func body(content: Content) -> some View {
        content.opacity(self.theme.dims.opacity(isEnabled: self.isEnabled))
    }
}

extension View {

    func avatarOpacity() -> some View {
        self.modifier(AvatarOpacityViewModifier())
    }
}
