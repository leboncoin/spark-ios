//
//  AvatarPlaceholderViewModifier.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 14/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct AvatarPlaceholderViewModifier: ViewModifier {

    // MARK: - Properties

    let contentType: AvatarContentType

    @Environment(\.theme) private var theme
    @Environment(\.avatarSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .foregroundStyle(self.theme.colors.placeholderTint(contentType: self.contentType))
            .font(self.theme.typography.placeholder(size: self.size))
            .sparkFrame(size: self.theme.size.placeholder(for: self.size))
    }
}

extension View {

    func avatarPlaceholder(contentType: AvatarContentType) -> some View {
        self.modifier(AvatarPlaceholderViewModifier(contentType: contentType))
    }
}
