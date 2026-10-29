//
//  AvatarCornerBadgeViewModifier.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 14/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkComponentBadge

private struct AvatarCornerBadgeViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.avatarSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .sparkBadgeSize(self.theme.size.badge(for: self.size))
            .sparkBadgeIsBorder(true)
    }
}

extension View {

    func avatarCornerBadge() -> some View {
        self.modifier(AvatarCornerBadgeViewModifier())
    }
}
