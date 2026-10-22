//
//  AvatarBackgroundViewModifier.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 14/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct AvatarBackgroundViewModifier: ViewModifier {

    // MARK: - Properties

    let contentType: AvatarContentType

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        content.background(self.theme.value.backgroundColorToken(contentType: self.contentType))
    }
}

extension View {

    func avatarBackground(contentType: AvatarContentType) -> some View {
        self.modifier(AvatarBackgroundViewModifier(contentType: contentType))
    }
}
