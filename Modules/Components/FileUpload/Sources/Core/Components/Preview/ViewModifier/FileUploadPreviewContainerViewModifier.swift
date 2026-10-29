//
//  FileUploadPreviewContainerViewModifier.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct FileUploadPreviewContainerViewModifier: ViewModifier {

    // MARK: - Properties

    let isSucceed: Bool
    let isPressed: Bool

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        let token = self.theme.fileUpload.preview

        content
            .sparkPadding(.horizontal, token.layout.horizontalPadding)
            .sparkPadding(.vertical, token.layout.verticalPadding)
            .background(token.colors.background(isPressed: self.isPressed).color)
            .sparkBorder(
                width: token.border.width(isSucceed: self.isSucceed),
                radius: token.border.radius,
                colorToken: token.colors.border(isSucceed: self.isSucceed),
                position: .inner
            )
            .scaleEffect(self.isPressed ? FileUploadPreviewConstants.pressedScaled : 1.0)
            .optionalAnimation(
                .easeInOut(duration: FileUploadPreviewConstants.animationDuration),
                value: self.isPressed
            )
    }
}

extension View {

    func fileUploadPreviewContainer(isSucceed: Bool, isPressed: Bool) -> some View {
        self.modifier(FileUploadPreviewContainerViewModifier(isSucceed: isSucceed, isPressed: isPressed))
    }
}
