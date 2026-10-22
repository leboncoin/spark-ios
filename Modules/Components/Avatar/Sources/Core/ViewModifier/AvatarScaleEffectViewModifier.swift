//
//  AvatarScaleEffectViewModifier.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 14/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI

private struct AvatarScaleEffectViewModifier: ViewModifier {

    // MARK: - Properties

    let isPressed: Bool

    @Environment(\.avatarSize) private var size

    // MARK: - View

    func body(content: Content) -> some View {
        content.scaleEffect(self.size.scaleEffect(isPressed: self.isPressed))
    }
}

extension View {

    func avatarScaleEffect(isPressed: Bool) -> some View {
        self.modifier(AvatarScaleEffectViewModifier(isPressed: isPressed))
    }
}
