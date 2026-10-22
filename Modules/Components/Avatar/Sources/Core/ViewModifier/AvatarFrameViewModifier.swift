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

    @Environment(\.avatarSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content.sparkFrame(size: self.size.value)
    }
}

extension View {

    func avatarFrame() -> some View {
        self.modifier(AvatarFrameViewModifier())
    }
}
