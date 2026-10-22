//
//  AvatarCornerBadgeViewModifier.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 14/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
import SparkComponentBadge

private struct AvatarCornerBadgeViewModifier: ViewModifier {

    // MARK: - Properties

    @Environment(\.avatarSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .sparkBadgeSize(self.size.badgeSize)
            .sparkBadgeIsBorder(true)
    }
}

extension View {

    func avatarCornerBadge() -> some View {
        self.modifier(AvatarCornerBadgeViewModifier())
    }
}
