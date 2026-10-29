//
//  AvatarScaleEffectViewModifier.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 14/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct AvatarScaleEffectViewModifier: ViewModifier {

    // MARK: - Properties

    let isPressed: Bool

    @Environment(\.theme) private var theme
    @Environment(\.avatarSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content.scaleEffect(self.theme.scaleEffect.value(for: self.size, isPressed: self.isPressed))
    }
}

extension View {

    func avatarScaleEffect(isPressed: Bool) -> some View {
        self.modifier(AvatarScaleEffectViewModifier(isPressed: isPressed))
    }
}
