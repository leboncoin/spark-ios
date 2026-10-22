//
//  AvatarBorderViewModifier.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 13/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct AvatarBorderViewModifier: ViewModifier {

    // MARK: - Properties

    let contentType: AvatarContentType

    @Environment(\.theme) private var theme
    @Environment(\.avatarIsBorder) private var isBorder
    @Environment(\.avatarSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content.sparkBorder(
            width: self.theme.value.borderWidth(isBorder: self.isBorder, size: self.size),
            radius: self.theme.value.borderRadius(contentType: self.contentType),
            colorToken: self.theme.value.borderColorToken
        )
    }
}

extension View {

    func avatarBorder(contentType: AvatarContentType) -> some View {
        self.modifier(AvatarBorderViewModifier(contentType: contentType))
    }
}
