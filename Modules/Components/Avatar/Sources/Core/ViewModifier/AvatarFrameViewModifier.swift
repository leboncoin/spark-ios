//
//  AvatarFrameViewModifier.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 14/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct AvatarFrameViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.avatarSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content.sparkFrame(size: self.theme.size.value(for: self.size))
    }
}

extension View {

    func avatarFrame() -> some View {
        self.modifier(AvatarFrameViewModifier())
    }
}
