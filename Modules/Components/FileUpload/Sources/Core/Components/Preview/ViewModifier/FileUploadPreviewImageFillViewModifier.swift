//
//  FileUploadPreviewImageFillViewModifier.swift
//  SparkComponentFileUpload
//
//  Created by Robin Lemaire on 28/10/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon

private struct FileUploadPreviewImageFillViewModifier: ViewModifier {

    // MARK: - Properties

    let isSucceed: Bool

    @Environment(\.theme) private var theme

    // MARK: - View

    func body(content: Content) -> some View {
        let token = self.theme.fileUpload.preview

        content
            .foregroundStyle(token.colors.imageBackground(isSucceed: self.isSucceed))
            .frame(size: FileUploadPreviewConstants.Image.containerSize)
            .sparkCornerRadius(token.border.imageRadius)
    }
}

extension View {

    func fileUploadPreviewImageBackground(isSucceed: Bool) -> some View {
        self.modifier(FileUploadPreviewImageFillViewModifier(isSucceed: isSucceed))
    }
}
