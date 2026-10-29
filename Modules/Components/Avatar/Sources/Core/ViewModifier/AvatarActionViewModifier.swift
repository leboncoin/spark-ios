//
//  AvatarActionViewModifier.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 14/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct AvatarActionViewModifier: ViewModifier {

    // MARK: - Properties

    let isPressed: Bool

    @Environment(\.theme) private var theme
    @Environment(\.avatarSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .foregroundStyle(self.theme.colors.actionTint(isPressed: self.isPressed))
            .padding(self.theme.layout.actionPadding)
            .sparkFrame(size: self.theme.size.action(for: self.size))
            .background(
                Circle()
                    .fill(self.theme.colors.actionBackground(isPressed: self.isPressed))
                    .shadow(self.theme.value.elevation.dropShadow)
            )
    }
}

extension View {

    func avatarAction(isPressed: Bool) -> some View {
        self.modifier(AvatarActionViewModifier(isPressed: isPressed))
    }
}
