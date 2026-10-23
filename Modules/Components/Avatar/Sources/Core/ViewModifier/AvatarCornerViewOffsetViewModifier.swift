//
//  AvatarCornerViewOffsetViewModifier.swift
//  SparkComponentAvatar
//
//  Created by robin.lemaire on 13/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct AvatarCornerViewOffsetViewModifier: ViewModifier {

    // MARK: - Properties

    let contentType: AvatarContentType

    @Environment(\.theme) private var theme
    @Environment(\.avatarSize) private var size
    @State private var cornerViewSize: CGSize?

    // MARK: - View

    func body(content: Content) -> some View {
        content
            .offset(
                self.theme.cornerViewOffset.value(
                    for: self.contentType,
                    avatarSize: self.theme.size.value(for: self.size),
                    cornerViewSize: self.cornerViewSize
                )
            )
            .onGeometryChange(for: CGSize.self) { proxy in
                proxy.size
            } action: { newValue in
                self.cornerViewSize = newValue
            }
    }
}

extension View {

    func avatarCornerViewOffset(contentType: AvatarContentType) -> some View {
        self.modifier(AvatarCornerViewOffsetViewModifier(contentType: contentType))
    }
}
